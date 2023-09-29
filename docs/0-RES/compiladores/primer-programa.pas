
(* lexical analyzer template (TP Lex V3.0), V1.0 3-2-91 AG *)

(* global definitions: *)
Uses lexlib;



function yylex : Integer;

procedure yyaction ( yyruleno : Integer );
  (* local definitions: *)

begin
  (* actions: *)
  case yyruleno of
  1:
      			write('entero');
  2:
          		write('entero');
  3:
                     	write('real');
  4:
                       	write('identificador');


  end;
end(*yyaction*);

(* DFA table: *)

type YYTRec = record
                cc : set of Char;
                s  : Integer;
              end;

const

yynmarks   = 4;
yynmatches = 4;
yyntrans   = 10;
yynstates  = 7;

yyk : array [1..yynmarks] of Integer = (
  { 0: }
  { 1: }
  { 2: }
  1,
  2,
  { 3: }
  { 4: }
  { 5: }
  4,
  { 6: }
  3
);

yym : array [1..yynmatches] of Integer = (
{ 0: }
{ 1: }
{ 2: }
  1,
  2,
{ 3: }
{ 4: }
{ 5: }
  4,
{ 6: }
  3
);

yyt : array [1..yyntrans] of YYTrec = (
{ 0: }
  ( cc: [ '0'..'9' ]; s: 2),
  ( cc: [ 'a'..'z' ]; s: 3),
{ 1: }
  ( cc: [ '0'..'9' ]; s: 2),
  ( cc: [ 'a'..'z' ]; s: 3),
{ 2: }
  ( cc: [ '.' ]; s: 4),
  ( cc: [ '0'..'9' ]; s: 2),
{ 3: }
  ( cc: [ '0'..'9','a'..'z' ]; s: 5),
{ 4: }
  ( cc: [ '0'..'9' ]; s: 6),
{ 5: }
  ( cc: [ '0'..'9','a'..'z' ]; s: 5),
{ 6: }
  ( cc: [ '0'..'9' ]; s: 6)
);

yykl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 3,
{ 4: } 3,
{ 5: } 3,
{ 6: } 4
);

yykh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 2,
{ 3: } 2,
{ 4: } 2,
{ 5: } 3,
{ 6: } 4
);

yyml : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 3,
{ 4: } 3,
{ 5: } 3,
{ 6: } 4
);

yymh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 2,
{ 3: } 2,
{ 4: } 2,
{ 5: } 3,
{ 6: } 4
);

yytl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 3,
{ 2: } 5,
{ 3: } 7,
{ 4: } 8,
{ 5: } 9,
{ 6: } 10
);

yyth : array [0..yynstates-1] of Integer = (
{ 0: } 2,
{ 1: } 4,
{ 2: } 6,
{ 3: } 7,
{ 4: } 8,
{ 5: } 9,
{ 6: } 10
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


begin
yylex()=0
end.
