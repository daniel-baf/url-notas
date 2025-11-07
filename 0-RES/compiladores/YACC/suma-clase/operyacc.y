%{
    Uses yacclib, lexlib;
%}

%token ID VAR PA PC MUL SUMA SUB DIVI ASIGNACION ENTER
%token <REAL> NUM
%type  <REAL> Exp
%start lineas

%%
lineas : lineas Exp ENTER  {writeln('Aceptado');}
       | Exp ENTER         {writeln('Aceptado');}
       | ID ASIGNACION Exp {writeln('Aceptado');}
       ;

Exp : Exp SUMA Exp          {  }
    | Exp MUL Exp
    | Exp SUB Exp
    | Exp DIVI Exp
    | PA Exp PC
    | ID
    | NUM
    ;
%%
{$I operlex.pas}
Begin
    yyparse();
End.
