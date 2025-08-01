
(* lexical analyzer template (TP Lex V3.0), V1.0 3-2-91 AG *)

(* global definitions: *)

Uses Lexlib;



const a = 2;
const b = 4;


function yylex : Integer;

procedure yyaction ( yyruleno : Integer );
  (* local definitions: *)

begin
  (* actions: *)
  case yyruleno of
  1:
                         	Write('PALABRA RESERVADA');  //ESTO ES UN COMENTARIO
  2:
         			Write('NUMERO');
  3:
                 		Write('IDENTIFICADOR');
  4:
       				Begin
						Write('COMENTARIO INICIADO');
						start(b);
					End;
  5:
       				Begin
						start(a);
						Write('FIN DE COMENTARIO');
					End;
  6:
     				;

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
yyntrans   = 52;
yynstates  = 27;

yyk : array [1..yynmarks] of Integer = (
  { 0: }
  { 1: }
  { 2: }
  { 3: }
  { 4: }
  6,
  { 5: }
  6,
  { 6: }
  { 7: }
  { 8: }
  { 9: }
  { 10: }
  2,
  { 11: }
  { 12: }
  { 13: }
  6,
  { 14: }
  6,
  { 15: }
  1,
  3,
  { 16: }
  3,
  { 17: }
  3,
  { 18: }
  3,
  { 19: }
  3,
  { 20: }
  3,
  { 21: }
  4,
  { 22: }
  5,
  6,
  { 23: }
  3,
  { 24: }
  3,
  { 25: }
  3,
  { 26: }
  3
);

yym : array [1..yynmatches] of Integer = (
{ 0: }
{ 1: }
{ 2: }
{ 3: }
{ 4: }
  6,
{ 5: }
  6,
{ 6: }
{ 7: }
{ 8: }
{ 9: }
{ 10: }
  2,
{ 11: }
{ 12: }
{ 13: }
  6,
{ 14: }
  6,
{ 15: }
  1,
  3,
{ 16: }
  3,
{ 17: }
  3,
{ 18: }
  3,
{ 19: }
  3,
{ 20: }
  3,
{ 21: }
  4,
{ 22: }
  5,
  6,
{ 23: }
  3,
{ 24: }
  3,
{ 25: }
  3,
{ 26: }
  3
);

yyt : array [1..yyntrans] of YYTrec = (
{ 0: }
{ 1: }
{ 2: }
  ( cc: [ '/' ]; s: 12),
  ( cc: [ '0'..'9' ]; s: 10),
  ( cc: [ 'a','c','d','f'..'h','j'..'s','u'..'z' ]; s: 11),
  ( cc: [ 'b' ]; s: 9),
  ( cc: [ 'e' ]; s: 8),
  ( cc: [ 'i' ]; s: 6),
  ( cc: [ 't' ]; s: 7),
{ 3: }
  ( cc: [ '/' ]; s: 12),
  ( cc: [ '0'..'9' ]; s: 10),
  ( cc: [ 'a','c','d','f'..'h','j'..'s','u'..'z' ]; s: 11),
  ( cc: [ 'b' ]; s: 9),
  ( cc: [ 'e' ]; s: 8),
  ( cc: [ 'i' ]; s: 6),
  ( cc: [ 't' ]; s: 7),
{ 4: }
  ( cc: [ #1..#9,#11..')','+'..#255 ]; s: 14),
  ( cc: [ '*' ]; s: 13),
{ 5: }
  ( cc: [ #1..#9,#11..')','+'..#255 ]; s: 14),
  ( cc: [ '*' ]; s: 13),
{ 6: }
  ( cc: [ '0'..'9','a'..'e','g'..'z' ]; s: 16),
  ( cc: [ 'f' ]; s: 15),
{ 7: }
  ( cc: [ '0'..'9','a'..'g','i'..'z' ]; s: 16),
  ( cc: [ 'h' ]; s: 17),
{ 8: }
  ( cc: [ '0'..'9','a'..'k','m','o'..'z' ]; s: 16),
  ( cc: [ 'l' ]; s: 18),
  ( cc: [ 'n' ]; s: 19),
{ 9: }
  ( cc: [ '0'..'9','a'..'d','f'..'z' ]; s: 16),
  ( cc: [ 'e' ]; s: 20),
{ 10: }
  ( cc: [ '0'..'9' ]; s: 10),
{ 11: }
  ( cc: [ '0'..'9','a'..'z' ]; s: 16),
{ 12: }
  ( cc: [ '*' ]; s: 21),
{ 13: }
  ( cc: [ #1..#9,#11..'.','0'..#255 ]; s: 14),
  ( cc: [ '/' ]; s: 22),
{ 14: }
  ( cc: [ #1..#9,#11..#255 ]; s: 14),
{ 15: }
  ( cc: [ '0'..'9','a'..'z' ]; s: 16),
{ 16: }
  ( cc: [ '0'..'9','a'..'z' ]; s: 16),
{ 17: }
  ( cc: [ '0'..'9','a'..'d','f'..'z' ]; s: 16),
  ( cc: [ 'e' ]; s: 23),
{ 18: }
  ( cc: [ '0'..'9','a'..'r','t'..'z' ]; s: 16),
  ( cc: [ 's' ]; s: 24),
{ 19: }
  ( cc: [ '0'..'9','a'..'c','e'..'z' ]; s: 16),
  ( cc: [ 'd' ]; s: 15),
{ 20: }
  ( cc: [ '0'..'9','a'..'f','h'..'z' ]; s: 16),
  ( cc: [ 'g' ]; s: 25),
{ 21: }
{ 22: }
  ( cc: [ #1..#9,#11..#255 ]; s: 14),
{ 23: }
  ( cc: [ '0'..'9','a'..'m','o'..'z' ]; s: 16),
  ( cc: [ 'n' ]; s: 15),
{ 24: }
  ( cc: [ '0'..'9','a'..'d','f'..'z' ]; s: 16),
  ( cc: [ 'e' ]; s: 15),
{ 25: }
  ( cc: [ '0'..'9','a'..'h','j'..'z' ]; s: 16),
  ( cc: [ 'i' ]; s: 26),
{ 26: }
  ( cc: [ '0'..'9','a'..'m','o'..'z' ]; s: 16),
  ( cc: [ 'n' ]; s: 15)
);

yykl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 1,
{ 4: } 1,
{ 5: } 2,
{ 6: } 3,
{ 7: } 3,
{ 8: } 3,
{ 9: } 3,
{ 10: } 3,
{ 11: } 4,
{ 12: } 4,
{ 13: } 4,
{ 14: } 5,
{ 15: } 6,
{ 16: } 8,
{ 17: } 9,
{ 18: } 10,
{ 19: } 11,
{ 20: } 12,
{ 21: } 13,
{ 22: } 14,
{ 23: } 16,
{ 24: } 17,
{ 25: } 18,
{ 26: } 19
);

yykh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 0,
{ 3: } 0,
{ 4: } 1,
{ 5: } 2,
{ 6: } 2,
{ 7: } 2,
{ 8: } 2,
{ 9: } 2,
{ 10: } 3,
{ 11: } 3,
{ 12: } 3,
{ 13: } 4,
{ 14: } 5,
{ 15: } 7,
{ 16: } 8,
{ 17: } 9,
{ 18: } 10,
{ 19: } 11,
{ 20: } 12,
{ 21: } 13,
{ 22: } 15,
{ 23: } 16,
{ 24: } 17,
{ 25: } 18,
{ 26: } 19
);

yyml : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 1,
{ 4: } 1,
{ 5: } 2,
{ 6: } 3,
{ 7: } 3,
{ 8: } 3,
{ 9: } 3,
{ 10: } 3,
{ 11: } 4,
{ 12: } 4,
{ 13: } 4,
{ 14: } 5,
{ 15: } 6,
{ 16: } 8,
{ 17: } 9,
{ 18: } 10,
{ 19: } 11,
{ 20: } 12,
{ 21: } 13,
{ 22: } 14,
{ 23: } 16,
{ 24: } 17,
{ 25: } 18,
{ 26: } 19
);

yymh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 0,
{ 3: } 0,
{ 4: } 1,
{ 5: } 2,
{ 6: } 2,
{ 7: } 2,
{ 8: } 2,
{ 9: } 2,
{ 10: } 3,
{ 11: } 3,
{ 12: } 3,
{ 13: } 4,
{ 14: } 5,
{ 15: } 7,
{ 16: } 8,
{ 17: } 9,
{ 18: } 10,
{ 19: } 11,
{ 20: } 12,
{ 21: } 13,
{ 22: } 15,
{ 23: } 16,
{ 24: } 17,
{ 25: } 18,
{ 26: } 19
);

yytl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 8,
{ 4: } 15,
{ 5: } 17,
{ 6: } 19,
{ 7: } 21,
{ 8: } 23,
{ 9: } 26,
{ 10: } 28,
{ 11: } 29,
{ 12: } 30,
{ 13: } 31,
{ 14: } 33,
{ 15: } 34,
{ 16: } 35,
{ 17: } 36,
{ 18: } 38,
{ 19: } 40,
{ 20: } 42,
{ 21: } 44,
{ 22: } 44,
{ 23: } 45,
{ 24: } 47,
{ 25: } 49,
{ 26: } 51
);

yyth : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 7,
{ 3: } 14,
{ 4: } 16,
{ 5: } 18,
{ 6: } 20,
{ 7: } 22,
{ 8: } 25,
{ 9: } 27,
{ 10: } 28,
{ 11: } 29,
{ 12: } 30,
{ 13: } 32,
{ 14: } 33,
{ 15: } 34,
{ 16: } 35,
{ 17: } 37,
{ 18: } 39,
{ 19: } 41,
{ 20: } 43,
{ 21: } 43,
{ 22: } 44,
{ 23: } 46,
{ 24: } 48,
{ 25: } 50,
{ 26: } 52
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
	start(a);
	if yylex()=0 then
End.
