%{
Uses lexlib;
Var
  articles_counter: Integer; // Declare a global variable to store the number
%}

ignore      [ \t\r]
articles    (el|la|los|las)


%start  a b

%%
{ignore}    ;
<a>{articles}
        Begin
            articles_counter := articles_counter + 1;
            write('ARTICULO');
            start(b);
        end;
<b>.    write(yytext);

%%

Begin
    If yylex() = 0 then;

    writeLn('Cantidad de articulos: ', articles_counter);
End.