%{

Uses Lexlib;


%}

%start a b

%%

<a>if|then|else|begin|end	Write('PALABRA RESERVADA');  //ESTO ES UN COMENTARIO
<a>[0-9]+					Write('NUMERO');
<a>[a-z][a-z0-9]+			Write('IDENTIFICADOR');
<a>"/*"						Begin
								Write('COMENTARIO INICIADO');
								start(b);
							End;
<b>"*/"				Begin
						start(a);
						Write('FIN DE COMENTARIO');
					End;
<b>.*				;

%%

Begin
	start(a);
	if yylex()=0 then
End.