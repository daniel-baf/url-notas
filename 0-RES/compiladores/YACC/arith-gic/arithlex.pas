
(* lexical analyzer template (TP Lex V3.0), V1.0 3-2-91 AG *)

(* global definitions: *)
var
  input: Integer; // Declare a global variable to store the number



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
            Val(yytext, input);
            yylval  :=  input;
            return(NUM);
        end;
  3:
        return(JL);
  4:
        return(ADD);
  5:
        return(SUB);
  6:
        return(MULT);
  7:
        return(DIVI);
  8:
        return(LPAREN);
  9:
        return(RPAREN);
  10:
        return(UNKNOWN);
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
yyntrans   = 22;
yynstates  = 13;

yyk : array [1..yynmarks] of Integer = (
  { 0: }
  { 1: }
  { 2: }
  1,
  10,
  { 3: }
  2,
  10,
  { 4: }
  3,
  { 5: }
  4,
  10,
  { 6: }
  5,
  10,
  { 7: }
  6,
  10,
  { 8: }
  7,
  10,
  { 9: }
  8,
  10,
  { 10: }
  9,
  10,
  { 11: }
  10,
  { 12: }
  2
);

yym : array [1..yynmatches] of Integer = (
{ 0: }
{ 1: }
{ 2: }
  1,
  10,
{ 3: }
  2,
  10,
{ 4: }
  3,
{ 5: }
  4,
  10,
{ 6: }
  5,
  10,
{ 7: }
  6,
  10,
{ 8: }
  7,
  10,
{ 9: }
  8,
  10,
{ 10: }
  9,
  10,
{ 11: }
  10,
{ 12: }
  2
);

yyt : array [1..yyntrans] of YYTrec = (
{ 0: }
  ( cc: [ #1..#8,#11,#12,#14..#31,'!'..'''',',','.',
            ':'..#255 ]; s: 11),
  ( cc: [ #9,#13,' ' ]; s: 2),
  ( cc: [ #10 ]; s: 4),
  ( cc: [ '(' ]; s: 9),
  ( cc: [ ')' ]; s: 10),
  ( cc: [ '*' ]; s: 7),
  ( cc: [ '+' ]; s: 5),
  ( cc: [ '-' ]; s: 6),
  ( cc: [ '/' ]; s: 8),
  ( cc: [ '0'..'9' ]; s: 3),
{ 1: }
  ( cc: [ #1..#8,#11,#12,#14..#31,'!'..'''',',','.',
            ':'..#255 ]; s: 11),
  ( cc: [ #9,#13,' ' ]; s: 2),
  ( cc: [ #10 ]; s: 4),
  ( cc: [ '(' ]; s: 9),
  ( cc: [ ')' ]; s: 10),
  ( cc: [ '*' ]; s: 7),
  ( cc: [ '+' ]; s: 5),
  ( cc: [ '-' ]; s: 6),
  ( cc: [ '/' ]; s: 8),
  ( cc: [ '0'..'9' ]; s: 3),
{ 2: }
{ 3: }
  ( cc: [ '0'..'9' ]; s: 12),
{ 4: }
{ 5: }
{ 6: }
{ 7: }
{ 8: }
{ 9: }
{ 10: }
{ 11: }
{ 12: }
  ( cc: [ '0'..'9' ]; s: 12)
);

yykl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 3,
{ 4: } 5,
{ 5: } 6,
{ 6: } 8,
{ 7: } 10,
{ 8: } 12,
{ 9: } 14,
{ 10: } 16,
{ 11: } 18,
{ 12: } 19
);

yykh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 2,
{ 3: } 4,
{ 4: } 5,
{ 5: } 7,
{ 6: } 9,
{ 7: } 11,
{ 8: } 13,
{ 9: } 15,
{ 10: } 17,
{ 11: } 18,
{ 12: } 19
);

yyml : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 3,
{ 4: } 5,
{ 5: } 6,
{ 6: } 8,
{ 7: } 10,
{ 8: } 12,
{ 9: } 14,
{ 10: } 16,
{ 11: } 18,
{ 12: } 19
);

yymh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 2,
{ 3: } 4,
{ 4: } 5,
{ 5: } 7,
{ 6: } 9,
{ 7: } 11,
{ 8: } 13,
{ 9: } 15,
{ 10: } 17,
{ 11: } 18,
{ 12: } 19
);

yytl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 11,
{ 2: } 21,
{ 3: } 21,
{ 4: } 22,
{ 5: } 22,
{ 6: } 22,
{ 7: } 22,
{ 8: } 22,
{ 9: } 22,
{ 10: } 22,
{ 11: } 22,
{ 12: } 22
);

yyth : array [0..yynstates-1] of Integer = (
{ 0: } 10,
{ 1: } 20,
{ 2: } 20,
{ 3: } 21,
{ 4: } 21,
{ 5: } 21,
{ 6: } 21,
{ 7: } 21,
{ 8: } 21,
{ 9: } 21,
{ 10: } 21,
{ 11: } 21,
{ 12: } 22
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


