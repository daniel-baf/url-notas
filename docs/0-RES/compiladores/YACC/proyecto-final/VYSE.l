%{
var
  input: Integer; // Declare a global variable to store the number
%}

ignore      [ \t\r\n]
num         [0-9]+(\.[0-9]+)?
id          [a-zA-Z]
read        (read|Read)
write       (write|Write)
if          (if|If)
then        (Then|then)

%%
{ignore}    ;
{id}    Begin
            yylval  :=  yytext;
            return(ID);
        end;
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
"^"     return(POW);
"%"     return(MOD);
"("     return(LPAREN);
")"     return(RPAREN);
":="    return(ASSIGN);
";"     return(C_ENDL);
"<"     return(LOWER_T);
">"     return(HIGHER_T);
","     return(TOKEN_SPLT);
"{"     return(O_BRACES);
"}"     return(C_BRACES);
{read}  return(READ);
{write} return(WRITE);
{if}    return(IF);
{then}  return(THEN);
"Main"  return(MAIN);
.       return(UNKNOWN);
%%