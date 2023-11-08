
(* lexical analyzer template (TP Lex V3.0), V1.0 3-2-91 AG *)

(* global definitions: *)
Uses lexlib;
Var
  articles_counter: Integer; // Declare a global variable to store the number



function yylex : Integer;

procedure yyaction ( yyruleno : Integer );
  (* local definitions: *)
begin
  (* actions: *)
  case yyruleno of
  1:
            ;
  2:
          
        Begin
            articles_counter := articles_counter + 1;
            write('ARTICULO');
        end;
  3:
        write(yytext);
  end;
end(*yyaction*);

(* DFA table: *)

type YYTRec = record
                cc : set of Char;
                s  : Integer;
              end;

const

yynmarks   = 7;
yynmatches = 7;
yyntrans   = 13;
yynstates  = 9;

yyk : array [1..yynmarks] of Integer = (
  { 0: }
  { 1: }
  { 2: }
  1,
  3,
  { 3: }
  3,
  { 4: }
  3,
  { 5: }
  3,
  { 6: }
  2,
  { 7: }
  2
  { 8: }
);

yym : array [1..yynmatches] of Integer = (
{ 0: }
{ 1: }
{ 2: }
  1,
  3,
{ 3: }
  3,
{ 4: }
  3,
{ 5: }
  3,
{ 6: }
  2,
{ 7: }
  2
{ 8: }
);

yyt : array [1..yyntrans] of YYTrec = (
{ 0: }
  ( cc: [ #1..#8,#11,#12,#14..'d','f'..'k','m'..#255 ]; s: 5),
  ( cc: [ #9,#13 ]; s: 2),
  ( cc: [ 'e' ]; s: 3),
  ( cc: [ 'l' ]; s: 4),
{ 1: }
  ( cc: [ #1..#8,#11,#12,#14..'d','f'..'k','m'..#255 ]; s: 5),
  ( cc: [ #9,#13 ]; s: 2),
  ( cc: [ 'e' ]; s: 3),
  ( cc: [ 'l' ]; s: 4),
{ 2: }
{ 3: }
  ( cc: [ 'l' ]; s: 6),
{ 4: }
  ( cc: [ 'a' ]; s: 7),
  ( cc: [ 'o' ]; s: 8),
{ 5: }
{ 6: }
{ 7: }
  ( cc: [ 's' ]; s: 6),
{ 8: }
  ( cc: [ 's' ]; s: 6)
);

yykl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 3,
{ 4: } 4,
{ 5: } 5,
{ 6: } 6,
{ 7: } 7,
{ 8: } 8
);

yykh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 2,
{ 3: } 3,
{ 4: } 4,
{ 5: } 5,
{ 6: } 6,
{ 7: } 7,
{ 8: } 7
);

yyml : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 3,
{ 4: } 4,
{ 5: } 5,
{ 6: } 6,
{ 7: } 7,
{ 8: } 8
);

yymh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 2,
{ 3: } 3,
{ 4: } 4,
{ 5: } 5,
{ 6: } 6,
{ 7: } 7,
{ 8: } 7
);

yytl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 5,
{ 2: } 9,
{ 3: } 9,
{ 4: } 10,
{ 5: } 12,
{ 6: } 12,
{ 7: } 12,
{ 8: } 13
);

yyth : array [0..yynstates-1] of Integer = (
{ 0: } 4,
{ 1: } 8,
{ 2: } 8,
{ 3: } 9,
{ 4: } 11,
{ 5: } 11,
{ 6: } 11,
{ 7: } 12,
{ 8: } 13
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
    If yylex() = 0 then;

    writeLn('Cantidad de articulos: ', articles_counter);
End.
