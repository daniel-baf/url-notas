%{
Uses lexlib;
%}

numero [0-9]+
digito [0-9]
car [a-z]

%%

[0-9]+			write('entero');
{digito}+ 		write('entero');
{digito}+\.{digito}+ 	write('real');
{car}({car}|{digito})+ 	write('identificador');


%%
begin
yylex()=0
end.