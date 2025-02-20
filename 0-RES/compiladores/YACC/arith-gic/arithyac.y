%{
Uses Lexlib, Yacclib;
%}

%token  NUM, UNKNOWN, ADD, SUB, MULT, DIVI, LPAREN, RPAREN, JL
%start  data

%%

data        :       input
            |       input data
            ;

input       :       expression JL                   { 
                                                        writeLn('OK   | div rounds to integers'); 
                                                        writeLn('Result: ', $1); 
                                                    }
            |       error JL                        { writeLn('invalid'); }
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