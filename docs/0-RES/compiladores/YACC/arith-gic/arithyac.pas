
(* Yacc parser template (TP Yacc V3.0), V1.2 6-17-91 AG *)

(* global definitions: *)

Uses Lexlib, Yacclib;
const NUM = 257;
const UNKNOWN = 258;
const ADD = 259;
const SUB = 260;
const MULT = 261;
const DIVI = 262;
const LPAREN = 263;
const RPAREN = 264;
const JL = 265;

var yylval : YYSType;

function yylex : Integer; forward;

function yyparse : Integer;

var yystate, yysp, yyn : Integer;
    yys : array [1..yymaxdepth] of Integer;
    yyv : array [1..yymaxdepth] of YYSType;
    yyval : YYSType;

procedure yyaction ( yyruleno : Integer );
  (* local definitions: *)
begin
  (* actions: *)
  case yyruleno of
   1 : begin
         yyval := yyv[yysp-0];
       end;
   2 : begin
         yyval := yyv[yysp-1];
       end;
   3 : begin
         writeLn('OK   | div rounds to integers'); writeLn('Result: ', yyv[yysp-1]); 
       end;
   4 : begin
         writeLn('invalid'); 
       end;
   5 : begin
         yyval := yyv[yysp-2] + yyv[yysp-0]; 
       end;
   6 : begin
         yyval := yyv[yysp-2] - yyv[yysp-0]; 
       end;
   7 : begin
         yyval := yyv[yysp-0]; 
       end;
   8 : begin
         yyval := yyv[yysp-2] * yyv[yysp-0]; 
       end;
   9 : begin
         yyval := Round(yyv[yysp-2] / yyv[yysp-0]); 
       end;
  10 : begin
         yyval := yyv[yysp-0]; 
       end;
  11 : begin
         yyval := yyv[yysp-0]; 
       end;
  12 : begin
         yyval := yyv[yysp-1]; 
       end;
  end;
end(*yyaction*);

(* parse table: *)

type YYARec = record
                sym, act : Integer;
              end;
     YYRRec = record
                len, sym : Integer;
              end;

const

yynacts   = 43;
yyngotos  = 19;
yynstates = 22;
yynrules  = 12;

yya : array [1..yynacts] of YYARec = (
{ 0: }
  ( sym: 256; act: 6 ),
  ( sym: 257; act: 7 ),
  ( sym: 263; act: 8 ),
{ 1: }
{ 2: }
  ( sym: 261; act: 9 ),
  ( sym: 262; act: 10 ),
  ( sym: 259; act: -7 ),
  ( sym: 260; act: -7 ),
  ( sym: 264; act: -7 ),
  ( sym: 265; act: -7 ),
{ 3: }
  ( sym: 259; act: 11 ),
  ( sym: 260; act: 12 ),
  ( sym: 265; act: 13 ),
{ 4: }
  ( sym: 256; act: 6 ),
  ( sym: 257; act: 7 ),
  ( sym: 263; act: 8 ),
  ( sym: 0; act: -1 ),
{ 5: }
  ( sym: 0; act: 0 ),
{ 6: }
  ( sym: 265; act: 15 ),
{ 7: }
{ 8: }
  ( sym: 257; act: 7 ),
  ( sym: 263; act: 8 ),
{ 9: }
  ( sym: 257; act: 7 ),
  ( sym: 263; act: 8 ),
{ 10: }
  ( sym: 257; act: 7 ),
  ( sym: 263; act: 8 ),
{ 11: }
  ( sym: 257; act: 7 ),
  ( sym: 263; act: 8 ),
{ 12: }
  ( sym: 257; act: 7 ),
  ( sym: 263; act: 8 ),
{ 13: }
{ 14: }
{ 15: }
{ 16: }
  ( sym: 259; act: 11 ),
  ( sym: 260; act: 12 ),
  ( sym: 264; act: 21 ),
{ 17: }
{ 18: }
{ 19: }
  ( sym: 261; act: 9 ),
  ( sym: 262; act: 10 ),
  ( sym: 259; act: -5 ),
  ( sym: 260; act: -5 ),
  ( sym: 264; act: -5 ),
  ( sym: 265; act: -5 ),
{ 20: }
  ( sym: 261; act: 9 ),
  ( sym: 262; act: 10 ),
  ( sym: 259; act: -6 ),
  ( sym: 260; act: -6 ),
  ( sym: 264; act: -6 ),
  ( sym: 265; act: -6 )
{ 21: }
);

yyg : array [1..yyngotos] of YYARec = (
{ 0: }
  ( sym: -6; act: 1 ),
  ( sym: -5; act: 2 ),
  ( sym: -4; act: 3 ),
  ( sym: -3; act: 4 ),
  ( sym: -2; act: 5 ),
{ 1: }
{ 2: }
{ 3: }
{ 4: }
  ( sym: -6; act: 1 ),
  ( sym: -5; act: 2 ),
  ( sym: -4; act: 3 ),
  ( sym: -3; act: 4 ),
  ( sym: -2; act: 14 ),
{ 5: }
{ 6: }
{ 7: }
{ 8: }
  ( sym: -6; act: 1 ),
  ( sym: -5; act: 2 ),
  ( sym: -4; act: 16 ),
{ 9: }
  ( sym: -6; act: 17 ),
{ 10: }
  ( sym: -6; act: 18 ),
{ 11: }
  ( sym: -6; act: 1 ),
  ( sym: -5; act: 19 ),
{ 12: }
  ( sym: -6; act: 1 ),
  ( sym: -5; act: 20 )
{ 13: }
{ 14: }
{ 15: }
{ 16: }
{ 17: }
{ 18: }
{ 19: }
{ 20: }
{ 21: }
);

yyd : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } -10,
{ 2: } 0,
{ 3: } 0,
{ 4: } 0,
{ 5: } 0,
{ 6: } 0,
{ 7: } -11,
{ 8: } 0,
{ 9: } 0,
{ 10: } 0,
{ 11: } 0,
{ 12: } 0,
{ 13: } -3,
{ 14: } -2,
{ 15: } -4,
{ 16: } 0,
{ 17: } -8,
{ 18: } -9,
{ 19: } 0,
{ 20: } 0,
{ 21: } -12
);

yyal : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 4,
{ 2: } 4,
{ 3: } 10,
{ 4: } 13,
{ 5: } 17,
{ 6: } 18,
{ 7: } 19,
{ 8: } 19,
{ 9: } 21,
{ 10: } 23,
{ 11: } 25,
{ 12: } 27,
{ 13: } 29,
{ 14: } 29,
{ 15: } 29,
{ 16: } 29,
{ 17: } 32,
{ 18: } 32,
{ 19: } 32,
{ 20: } 38,
{ 21: } 44
);

yyah : array [0..yynstates-1] of Integer = (
{ 0: } 3,
{ 1: } 3,
{ 2: } 9,
{ 3: } 12,
{ 4: } 16,
{ 5: } 17,
{ 6: } 18,
{ 7: } 18,
{ 8: } 20,
{ 9: } 22,
{ 10: } 24,
{ 11: } 26,
{ 12: } 28,
{ 13: } 28,
{ 14: } 28,
{ 15: } 28,
{ 16: } 31,
{ 17: } 31,
{ 18: } 31,
{ 19: } 37,
{ 20: } 43,
{ 21: } 43
);

yygl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 6,
{ 2: } 6,
{ 3: } 6,
{ 4: } 6,
{ 5: } 11,
{ 6: } 11,
{ 7: } 11,
{ 8: } 11,
{ 9: } 14,
{ 10: } 15,
{ 11: } 16,
{ 12: } 18,
{ 13: } 20,
{ 14: } 20,
{ 15: } 20,
{ 16: } 20,
{ 17: } 20,
{ 18: } 20,
{ 19: } 20,
{ 20: } 20,
{ 21: } 20
);

yygh : array [0..yynstates-1] of Integer = (
{ 0: } 5,
{ 1: } 5,
{ 2: } 5,
{ 3: } 5,
{ 4: } 10,
{ 5: } 10,
{ 6: } 10,
{ 7: } 10,
{ 8: } 13,
{ 9: } 14,
{ 10: } 15,
{ 11: } 17,
{ 12: } 19,
{ 13: } 19,
{ 14: } 19,
{ 15: } 19,
{ 16: } 19,
{ 17: } 19,
{ 18: } 19,
{ 19: } 19,
{ 20: } 19,
{ 21: } 19
);

yyr : array [1..yynrules] of YYRRec = (
{ 1: } ( len: 1; sym: -2 ),
{ 2: } ( len: 2; sym: -2 ),
{ 3: } ( len: 2; sym: -3 ),
{ 4: } ( len: 2; sym: -3 ),
{ 5: } ( len: 3; sym: -4 ),
{ 6: } ( len: 3; sym: -4 ),
{ 7: } ( len: 1; sym: -4 ),
{ 8: } ( len: 3; sym: -5 ),
{ 9: } ( len: 3; sym: -5 ),
{ 10: } ( len: 1; sym: -5 ),
{ 11: } ( len: 1; sym: -6 ),
{ 12: } ( len: 3; sym: -6 )
);


const _error = 256; (* error token *)

function yyact(state, sym : Integer; var act : Integer) : Boolean;
  (* search action table *)
  var k : Integer;
  begin
    k := yyal[state];
    while (k<=yyah[state]) and (yya[k].sym<>sym) do inc(k);
    if k>yyah[state] then
      yyact := false
    else
      begin
        act := yya[k].act;
        yyact := true;
      end;
  end(*yyact*);

function yygoto(state, sym : Integer; var nstate : Integer) : Boolean;
  (* search goto table *)
  var k : Integer;
  begin
    k := yygl[state];
    while (k<=yygh[state]) and (yyg[k].sym<>sym) do inc(k);
    if k>yygh[state] then
      yygoto := false
    else
      begin
        nstate := yyg[k].act;
        yygoto := true;
      end;
  end(*yygoto*);

label parse, next, error, errlab, shift, reduce, accept, abort;

begin(*yyparse*)

  (* initialize: *)

  yystate := 0; yychar := -1; yynerrs := 0; yyerrflag := 0; yysp := 0;

{$ifdef yydebug}
  yydebug := true;
{$else}
  yydebug := false;
{$endif}

parse:

  (* push state and value: *)

  inc(yysp);
  if yysp>yymaxdepth then
    begin
      yyerror('yyparse stack overflow');
      goto abort;
    end;
  yys[yysp] := yystate; yyv[yysp] := yyval;

next:

  if (yyd[yystate]=0) and (yychar=-1) then
    (* get next symbol *)
    begin
      yychar := yylex; if yychar<0 then yychar := 0;
    end;

  if yydebug then writeln('state ', yystate, ', char ', yychar);

  (* determine parse action: *)

  yyn := yyd[yystate];
  if yyn<>0 then goto reduce; (* simple state *)

  (* no default action; search parse table *)

  if not yyact(yystate, yychar, yyn) then goto error
  else if yyn>0 then                      goto shift
  else if yyn<0 then                      goto reduce
  else                                    goto accept;

error:

  (* error; start error recovery: *)

  if yyerrflag=0 then yyerror('syntax error');

errlab:

  if yyerrflag=0 then inc(yynerrs);     (* new error *)

  if yyerrflag<=2 then                  (* incomplete recovery; try again *)
    begin
      yyerrflag := 3;
      (* uncover a state with shift action on error token *)
      while (yysp>0) and not ( yyact(yys[yysp], _error, yyn) and
                               (yyn>0) ) do
        begin
          if yydebug then
            if yysp>1 then
              writeln('error recovery pops state ', yys[yysp], ', uncovers ',
                      yys[yysp-1])
            else
              writeln('error recovery fails ... abort');
          dec(yysp);
        end;
      if yysp=0 then goto abort; (* parser has fallen from stack; abort *)
      yystate := yyn;            (* simulate shift on error *)
      goto parse;
    end
  else                                  (* no shift yet; discard symbol *)
    begin
      if yydebug then writeln('error recovery discards char ', yychar);
      if yychar=0 then goto abort; (* end of input; abort *)
      yychar := -1; goto next;     (* clear lookahead char and try again *)
    end;

shift:

  (* go to new state, clear lookahead character: *)

  yystate := yyn; yychar := -1; yyval := yylval;
  if yyerrflag>0 then dec(yyerrflag);

  goto parse;

reduce:

  (* execute action, pop rule from stack, and go to next state: *)

  if yydebug then writeln('reduce ', -yyn);

  yyflag := yyfnone; yyaction(-yyn);
  dec(yysp, yyr[-yyn].len);
  if yygoto(yys[yysp], yyr[-yyn].sym, yyn) then yystate := yyn;

  (* handle action calls to yyaccept, yyabort and yyerror: *)

  case yyflag of
    yyfaccept : goto accept;
    yyfabort  : goto abort;
    yyferror  : goto errlab;
  end;

  goto parse;

accept:

  yyparse := 0; exit;

abort:

  yyparse := 1; exit;

end(*yyparse*);


{$I arithlex.pas}
Begin
    yyparse();
End.