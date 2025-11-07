%{
var
  input: Integer; // Declare a global variable to store the number
%}

ignore      [ \t\r]
num         [0-9]+

%%
{ignore}    ;
{num}
        Begin
            Val(yytext, input);
            yylval  :=  input;
            return(NUM);
        end;
"\n"    return(JL);
"+"     return(ADD);
"-"     return(SUB);
"*"     return(MULT);
"/"     return(DIVI);
"("     return(LPAREN);
")"     return(RPAREN);
.       return(UNKNOWN);
%%