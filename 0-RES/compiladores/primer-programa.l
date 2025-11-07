%{

Uses lexlib;

Var
    (*
        ESTO ES UN COMENTARIO, PODEMOS
        REALIZAR COMENTARIOS LARGOS CON 
        LA SINTAXIS (* ... COMENTARIO ... *)
    *)

	intCounter, decCounter, idCounter  :  integer;  //declara intCounter
	a1	    :   real;   //declara variable tipo float
	nombre	:   string;   //declara cadenas
%}

emptyData   [\s\t\n]
numero	    [0-9]+
digito	    [0-9]
car	        [a-z]

%%
{emptyData}+    ;
{digito}+ 		Begin   // use yytext to extract input
				    writeLn('entero');
				    intCounter := intCounter + 1;
			    end;
{digito}+\.{digito}+
                Begin
                    writeLn('REAL, ingresaste', yytext);
                    decCounter := decCounter + 1;
                end;
{car}({car}|{digito})+ 	
                Begin
                    writeLn('identificador');
                    idCounter := idCounter + 1;
                end;
.*              writeLn('TOKEN INVALIDO');
%%
Begin
	
	If yylex()=0 then;
    
    writeLn('------------------------ RESUMEN ------------------------');
    writeLn('ENTEROS        : ', intCounter);
    writeLn('DECIMALES      : ', decCounter);
    writeLn('IDENTIFICADORES: ', idCounter);

End.