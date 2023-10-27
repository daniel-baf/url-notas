DANIEL EDUARDO BAUTISTA FUENTES
2121323


GRAMÁTICA LEXER

```pascal
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
```

GRAMÁTICA PARSER

```pascal
%{
Uses Lexlib, Yacclib;
%}

%token  NUM, UNKNOWN, ADD, SUB, MULT, DIVI, LPAREN, RPAREN, JL
%start  data

%%

data        :       input
            |       input data
            ;

input       :       expression JL       { writeLn('OK   | div rounds to integers'); writeLn('Result: ', $1); }
            |       error JL            { writeLn('invalid'); }
            ;

expression  :       expression ADD term             { $$ := $1 + $3; }
            |       expression SUB term             { $$ := $1 - $3; }
            |       term                            { $$ := $1; }
            ;

term        :       term MULT factor                { $$ := $1 * $3; }     
            |       term DIVI factor                { $$ := Round($1 / $3); }
            |       factor                          { $$ := $1; }
            ;

factor      :       NUM                             { $$ := $1; }         
            |       LPAREN expression RPAREN        { $$ := $2; }
            ;

%%

{$I arithlex.pas}
Begin
    yyparse();
End.
```

COMPILA Y EJECUTA

```bash
echo "-------- FILE: arith --------"
echo "-------- BORRANDO ARCHIVOS VIEJOS --------"
rm -rf *.pas *.o *.e
echo "-------- GENERANDO TOKENS --------"
plex arithlex.l
echo "-------- GENERANDO PARSER --------"
pyacc arithyac.y
echo "-------- GENERANDO EXE --------"
fpc -oarithyac.e arithyac.pas
echo "-------- CORRIENDO EXE --------"
./arithyac.e
```

RESULTADOS

![[Pasted image 20231026220828.png]]

