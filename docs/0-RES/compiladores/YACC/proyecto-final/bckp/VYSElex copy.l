%{
var
  input: Integer; // Declare a global variable to store the number
%}

ignore      [ \t\r\n]
num         [0-9]+(\.[0-9]+)?
id          [a-zA-Z]
read        (read|Read)
write       (write|Write)
ifi         (if|If)
theni       (Then|then)

%start a b

%%

<a>{ignore} ;

<a>"/*"     Begin
              start(b);
            End;
<b>"*/"     Begin
              Write("FIN DE COMENTARIO");
              start(a);
            End;

<a>{id}     Begin
              yylval  :=  yytext;
              return(ID);
            End;
<a>{num}
            Begin
                Val(yytext, input);
                yylval  :=  input;
                return(NUM);
            End;
<a>"+"      return(ADD);
<a>"-"      return(SUB);
<a>"*"      return(MULT);
<a>"/"      return(DIVI);
<a>"^"      return(POW);
<a>"%"      return(MODi);
<a>"("      return(LPAREN);
<a>")"      return(RPAREN);
<a>":="     return(ASSIGN);
<a>";"      return(C_EndL);
<a>"<"      return(LOWER_T);
<a>">"      return(HIGHER_T);
<a>","      return(TOKEN_SPLT);
<a>"{"      return(O_BRACES);
<a>"}"      return(C_BRACES);
<a>{read}   return(READ);
<a>{write}  return(WRITE);
<a>{ifi}    return(IFi);
<a>{theni}  return(THENi);
<a>"Main"   return(MAIN);
<a>.        return(UNKNOWN);
%%




