
(* lexical analyzer template (TP Lex V3.0), V1.0 3-2-91 AG *)

(* global definitions: *)

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



function yylex : Integer;

procedure yyaction ( yyruleno : Integer );
  (* local definitions: *)
begin
  (* actions: *)
  case yyruleno of
  1:
                ;
  2:
          		Begin   // use yytext to extract input
				    writeLn('entero');
				    intCounter := intCounter + 1;
			    end;
  3:
                    
                Begin
                    writeLn('REAL, ingresaste', yytext);
                    decCounter := decCounter + 1;
                end;
  4:
                       	
                Begin
                    writeLn('identificador');
                    idCounter := idCounter + 1;
                end;
  5:
                writeLn('TOKEN INVALIDO');
  end;
end(*yyaction*);

(* DFA table: *)

type YYTRec = record
                cc : set of Char;
                s  : Integer;
              end;

const

yynmarks   = 19;
yynmatches = 19;
yyntrans   = 38;
yynstates  = 12;

yyk : array [1..yynmarks] of Integer = (
  { 0: }
  5,
  { 1: }
  5,
  { 2: }
  1,
  { 3: }
  2,
  5,
  { 4: }
  1,
  5,
  { 5: }
  5,
  { 6: }
  1,
  5,
  { 7: }
  5,
  { 8: }
  5,
  { 9: }
  1,
  4,
  5,
  { 10: }
  4,
  5,
  { 11: }
  3,
  5
);

yym : array [1..yynmatches] of Integer = (
{ 0: }
  5,
{ 1: }
  5,
{ 2: }
  1,
{ 3: }
  2,
  5,
{ 4: }
  1,
  5,
{ 5: }
  5,
{ 6: }
  1,
  5,
{ 7: }
  5,
{ 8: }
  5,
{ 9: }
  1,
  4,
  5,
{ 10: }
  4,
  5,
{ 11: }
  3,
  5
);

yyt : array [1..yyntrans] of YYTrec = (
{ 0: }
  ( cc: [ #1..#8,#11..'/',':'..'`','{'..#255 ]; s: 7),
  ( cc: [ #9 ]; s: 6),
  ( cc: [ #10 ]; s: 2),
  ( cc: [ '0'..'9' ]; s: 3),
  ( cc: [ 'a'..'r','t'..'z' ]; s: 5),
  ( cc: [ 's' ]; s: 4),
{ 1: }
  ( cc: [ #1..#8,#11..'/',':'..'`','{'..#255 ]; s: 7),
  ( cc: [ #9 ]; s: 6),
  ( cc: [ #10 ]; s: 2),
  ( cc: [ '0'..'9' ]; s: 3),
  ( cc: [ 'a'..'r','t'..'z' ]; s: 5),
  ( cc: [ 's' ]; s: 4),
{ 2: }
  ( cc: [ #9,#10,'s' ]; s: 2),
{ 3: }
  ( cc: [ #1..#9,#11..'-','/',':'..#255 ]; s: 7),
  ( cc: [ '.' ]; s: 8),
  ( cc: [ '0'..'9' ]; s: 3),
{ 4: }
  ( cc: [ #1..#8,#11..'/',':'..'`','{'..#255 ]; s: 7),
  ( cc: [ #9 ]; s: 6),
  ( cc: [ #10 ]; s: 2),
  ( cc: [ '0'..'9','a'..'r','t'..'z' ]; s: 10),
  ( cc: [ 's' ]; s: 9),
{ 5: }
  ( cc: [ #1..#9,#11..'/',':'..'`','{'..#255 ]; s: 7),
  ( cc: [ '0'..'9','a'..'z' ]; s: 10),
{ 6: }
  ( cc: [ #1..#8,#11..'r','t'..#255 ]; s: 7),
  ( cc: [ #9,'s' ]; s: 6),
  ( cc: [ #10 ]; s: 2),
{ 7: }
  ( cc: [ #1..#9,#11..#255 ]; s: 7),
{ 8: }
  ( cc: [ #1..#9,#11..'/',':'..#255 ]; s: 7),
  ( cc: [ '0'..'9' ]; s: 11),
{ 9: }
  ( cc: [ #1..#8,#11..'/',':'..'`','{'..#255 ]; s: 7),
  ( cc: [ #9 ]; s: 6),
  ( cc: [ #10 ]; s: 2),
  ( cc: [ '0'..'9','a'..'r','t'..'z' ]; s: 10),
  ( cc: [ 's' ]; s: 9),
{ 10: }
  ( cc: [ #1..#9,#11..'/',':'..'`','{'..#255 ]; s: 7),
  ( cc: [ '0'..'9','a'..'z' ]; s: 10),
{ 11: }
  ( cc: [ #1..#9,#11..'/',':'..#255 ]; s: 7),
  ( cc: [ '0'..'9' ]; s: 11)
);

yykl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 2,
{ 2: } 3,
{ 3: } 4,
{ 4: } 6,
{ 5: } 8,
{ 6: } 9,
{ 7: } 11,
{ 8: } 12,
{ 9: } 13,
{ 10: } 16,
{ 11: } 18
);

yykh : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 2,
{ 2: } 3,
{ 3: } 5,
{ 4: } 7,
{ 5: } 8,
{ 6: } 10,
{ 7: } 11,
{ 8: } 12,
{ 9: } 15,
{ 10: } 17,
{ 11: } 19
);

yyml : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 2,
{ 2: } 3,
{ 3: } 4,
{ 4: } 6,
{ 5: } 8,
{ 6: } 9,
{ 7: } 11,
{ 8: } 12,
{ 9: } 13,
{ 10: } 16,
{ 11: } 18
);

yymh : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 2,
{ 2: } 3,
{ 3: } 5,
{ 4: } 7,
{ 5: } 8,
{ 6: } 10,
{ 7: } 11,
{ 8: } 12,
{ 9: } 15,
{ 10: } 17,
{ 11: } 19
);

yytl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 7,
{ 2: } 13,
{ 3: } 14,
{ 4: } 17,
{ 5: } 22,
{ 6: } 24,
{ 7: } 27,
{ 8: } 28,
{ 9: } 30,
{ 10: } 35,
{ 11: } 37
);

yyth : array [0..yynstates-1] of Integer = (
{ 0: } 6,
{ 1: } 12,
{ 2: } 13,
{ 3: } 16,
{ 4: } 21,
{ 5: } 23,
{ 6: } 26,
{ 7: } 27,
{ 8: } 29,
{ 9: } 34,
{ 10: } 36,
{ 11: } 38
);


var yyn : Integer;

label start, scan, action;

begin

start:

  (* initialize: *)

  yynew;

scan:

  (* mark positions and matches: *)

  for yyn := yykl[yystate] to     yykh[yystate] do yymark(yyk[yyn]);
  for yyn := yymh[yystate] downto yyml[yystate] do yymatch(yym[yyn]);

  if yytl[yystate]>yyth[yystate] then goto action; (* dead state *)

  (* get next character: *)

  yyscan;

  (* determine action: *)

  yyn := yytl[yystate];
  while (yyn<=yyth[yystate]) and not (yyactchar in yyt[yyn].cc) do inc(yyn);
  if yyn>yyth[yystate] then goto action;
    (* no transition on yyactchar in this state *)

  (* switch to new state: *)

  yystate := yyt[yyn].s;

  goto scan;

action:

  (* execute action: *)

  if yyfind(yyrule) then
    begin
      yyaction(yyrule);
      if yyreject then goto action;
    end
  else if not yydefault and yywrap() then
    begin
      yyclear;
      return(0);
    end;

  if not yydone then goto start;

  yylex := yyretval;

end(*yylex*);


Begin
	
	If yylex()=0 then;
    
    writeLn('------------------------ RESUMEN ------------------------');
    writeLn('ENTEROS        : ', intCounter);
    writeLn('DECIMALES      : ', decCounter);
    writeLn('IDENTIFICADORES: ', idCounter);

End.
