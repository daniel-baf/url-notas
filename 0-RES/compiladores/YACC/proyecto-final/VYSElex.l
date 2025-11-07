%{
Var
  comment: String;
  input: Integer; // Declare a global variable to store the number
%}

ignore            [ \t\r\n]
num               [0-9]+(\.[0-9]+)?
id                [a-zA-Z]
vartypei          [a-zA-Z]+
readi             (read|Read)
writei            (write|Write)
ifi               (if|If)
theni             (Then|then)

%start            cdl l_comm s_comm

%%


<cdl>{ignore}     ;
<cdl>"/*"		      Begin
								    start(l_comm);
							    End;
<cdl>"//"         Begin
                    start(s_comm);
                  End;
<l_comm>{ignore}  ;
<l_comm>"*/"
      				    Begin
						        start(cdl);
                    comment := '';
					        End;
<s_comm>"\n"
                  Begin
                    start(cdl);
                    comment := '';
                  End;
<l_comm>.         Begin
                    comment := comment + yytext;
                  End;
<s_comm>.         Begin
                    comment := comment + yytext;
                  End;

<cdl>{id}         Begin
                    return(ID);
                  End;
<cdl>{num}        Begin
                      Val(yytext, input);
                      yylval  :=  input;
                      return(NUM);
                  End;
<cdl>"+"          return(ADD);
<cdl>"-"          return(SUB);
<cdl>"*"          return(MULT);
<cdl>"/"          return(DIVI);
<cdl>"^"          return(POW);
<cdl>"%"          return(MODi);
<cdl>"("          return(LPAREN);
<cdl>")"          return(RPAREN);
<cdl>";"          return(C_EndL);
<cdl>":="         return(ASSIGN);
<cdl>"<="         return(LOWER_OE_T);
<cdl>">="         return(HIGHER_OE_T);
<cdl>">"          return(HIGHER_T);
<cdl>"<"          return(LOWER_T);
<cdl>","          return(TOKEN_SPLT);
<cdl>"{"          return(O_BRACES);
<cdl>"}"          return(C_BRACES);
<cdl>"Main"       return(MAIN);
<cdl>{ifi}        return(IFi);
<cdl>{theni}      return(THENi);
<cdl>{readi}      return(READi);
<cdl>{writei}     return(WRITEi);
<cdl>{vartypei}   Begin
                      yylval  :=  input;
                      return(VARTYPEI);
                  End;
<cdl>.            Begin
                    return(INVALID);
                  End;
%%
