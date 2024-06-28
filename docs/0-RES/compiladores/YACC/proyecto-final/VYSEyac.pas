
(* Yacc parser template (TP Yacc V3.0), V1.2 6-17-91 AG *)

(* global definitions: *)

Uses Lexlib, Yacclib;
const ID = 257;
const NUM = 258;
const ADD = 259;
const SUB = 260;
const MULT = 261;
const DIVI = 262;
const POW = 263;
const MODi = 264;
const LPAREN = 265;
const RPAREN = 266;
const ASSIGN = 267;
const C_EndL = 268;
const LOWER_T = 269;
const HIGHER_T = 270;
const TOKEN_SPLT = 271;
const O_BRACES = 272;
const C_BRACES = 273;
const INVALID = 274;
const MAIN = 275;
const IFi = 276;
const THENi = 277;
const READi = 278;
const WRITEi = 279;
const VARTYPEI = 280;
const HIGHER_OE_T = 281;
const LOWER_OE_T = 282;

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
         writeLn('OK | EMPTY MAIN'); 
       end;
   2 : begin
         writeLn('OK | CODED MAIN'); 
       end;
   3 : begin
         yyval := yyv[yysp-0];
       end;
   4 : begin
         yyval := yyv[yysp-1];
       end;
   5 : begin
         yyval := yyv[yysp-0];
       end;
   6 : begin
         yyval := yyv[yysp-1];
       end;
   7 : begin
         yyval := yyv[yysp-2];
       end;
   8 : begin
         yyval := yyv[yysp-0];
       end;
   9 : begin
         yyval := yyv[yysp-5];
       end;
  10 : begin
         yyval := yyv[yysp-3];
       end;
  11 : begin
         yyval := yyv[yysp-0];
       end;
  12 : begin
         yyval := yyv[yysp-2];
       end;
  13 : begin
         yyval := yyv[yysp-2];
       end;
  14 : begin
         yyval := yyv[yysp-2];
       end;
  15 : begin
         yyval := yyv[yysp-2];
       end;
  16 : begin
         yyval := yyv[yysp-0];
       end;
  17 : begin
         yyval := yyv[yysp-0];
       end;
  18 : begin
         yyval := yyv[yysp-0];
       end;
  19 : begin
         yyval := yyv[yysp-0];
       end;
  20 : begin
         yyval := yyv[yysp-0];
       end;
  21 : begin
         yyval := yyv[yysp-0];
       end;
  22 : begin
         yyval := yyv[yysp-2];
       end;
  23 : begin
         yyval := yyv[yysp-2];
       end;
  24 : begin
         yyval := yyv[yysp-2];
       end;
  25 : begin
         yyval := yyv[yysp-0];
       end;
  26 : begin
         yyval := yyv[yysp-2];
       end;
  27 : begin
         yyval := yyv[yysp-2];
       end;
  28 : begin
         yyval := yyv[yysp-0];
       end;
  29 : begin
         yyval := yyv[yysp-2];
       end;
  30 : begin
         yyval := yyv[yysp-2];
       end;
  31 : begin
         yyval := yyv[yysp-0];
       end;
  32 : begin
         yyval := yyv[yysp-0];
       end;
  33 : begin
         yyval := yyv[yysp-2];
       end;
  34 : begin
         yyval := yyv[yysp-0];
       end;
  35 : begin
         yyval := yyv[yysp-0];
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

yynacts   = 164;
yyngotos  = 55;
yynstates = 66;
yynrules  = 35;

yya : array [1..yynacts] of YYARec = (
{ 0: }
  ( sym: 256; act: 2 ),
  ( sym: 275; act: 3 ),
{ 1: }
  ( sym: 0; act: 0 ),
{ 2: }
{ 3: }
  ( sym: 272; act: 4 ),
{ 4: }
  ( sym: 256; act: 8 ),
  ( sym: 257; act: 9 ),
  ( sym: 273; act: 10 ),
  ( sym: 276; act: 11 ),
  ( sym: 278; act: 12 ),
  ( sym: 279; act: 13 ),
  ( sym: 280; act: 14 ),
{ 5: }
{ 6: }
{ 7: }
  ( sym: 257; act: 9 ),
  ( sym: 273; act: 16 ),
  ( sym: 276; act: 11 ),
  ( sym: 278; act: 12 ),
  ( sym: 279; act: 13 ),
  ( sym: 280; act: 14 ),
{ 8: }
  ( sym: 268; act: 17 ),
{ 9: }
  ( sym: 267; act: 18 ),
{ 10: }
{ 11: }
  ( sym: 257; act: 24 ),
  ( sym: 258; act: 25 ),
  ( sym: 265; act: 26 ),
{ 12: }
  ( sym: 257; act: 28 ),
{ 13: }
  ( sym: 257; act: 29 ),
{ 14: }
  ( sym: 257; act: 32 ),
{ 15: }
{ 16: }
{ 17: }
{ 18: }
  ( sym: 257; act: 24 ),
  ( sym: 258; act: 25 ),
  ( sym: 265; act: 26 ),
{ 19: }
{ 20: }
{ 21: }
  ( sym: 263; act: 34 ),
  ( sym: 264; act: 35 ),
  ( sym: 259; act: -28 ),
  ( sym: 260; act: -28 ),
  ( sym: 261; act: -28 ),
  ( sym: 262; act: -28 ),
  ( sym: 266; act: -28 ),
  ( sym: 268; act: -28 ),
  ( sym: 269; act: -28 ),
  ( sym: 270; act: -28 ),
  ( sym: 271; act: -28 ),
  ( sym: 277; act: -28 ),
  ( sym: 281; act: -28 ),
  ( sym: 282; act: -28 ),
{ 22: }
  ( sym: 261; act: 36 ),
  ( sym: 262; act: 37 ),
  ( sym: 259; act: -25 ),
  ( sym: 260; act: -25 ),
  ( sym: 266; act: -25 ),
  ( sym: 268; act: -25 ),
  ( sym: 269; act: -25 ),
  ( sym: 270; act: -25 ),
  ( sym: 271; act: -25 ),
  ( sym: 277; act: -25 ),
  ( sym: 281; act: -25 ),
  ( sym: 282; act: -25 ),
{ 23: }
  ( sym: 259; act: 39 ),
  ( sym: 260; act: 40 ),
  ( sym: 269; act: 41 ),
  ( sym: 270; act: 42 ),
  ( sym: 281; act: 43 ),
  ( sym: 282; act: 44 ),
{ 24: }
{ 25: }
{ 26: }
  ( sym: 257; act: 24 ),
  ( sym: 258; act: 25 ),
  ( sym: 265; act: 26 ),
{ 27: }
  ( sym: 268; act: 46 ),
  ( sym: 271; act: 47 ),
{ 28: }
{ 29: }
  ( sym: 268; act: 48 ),
{ 30: }
{ 31: }
  ( sym: 268; act: 49 ),
  ( sym: 271; act: 50 ),
{ 32: }
  ( sym: 267; act: 51 ),
  ( sym: 268; act: -16 ),
  ( sym: 271; act: -16 ),
{ 33: }
  ( sym: 259; act: 39 ),
  ( sym: 260; act: 40 ),
  ( sym: 268; act: 52 ),
{ 34: }
  ( sym: 257; act: 24 ),
  ( sym: 258; act: 25 ),
  ( sym: 265; act: 26 ),
{ 35: }
  ( sym: 257; act: 24 ),
  ( sym: 258; act: 25 ),
  ( sym: 265; act: 26 ),
{ 36: }
  ( sym: 257; act: 24 ),
  ( sym: 258; act: 25 ),
  ( sym: 265; act: 26 ),
{ 37: }
  ( sym: 257; act: 24 ),
  ( sym: 258; act: 25 ),
  ( sym: 265; act: 26 ),
{ 38: }
  ( sym: 257; act: 24 ),
  ( sym: 258; act: 25 ),
  ( sym: 265; act: 26 ),
{ 39: }
  ( sym: 257; act: 24 ),
  ( sym: 258; act: 25 ),
  ( sym: 265; act: 26 ),
{ 40: }
  ( sym: 257; act: 24 ),
  ( sym: 258; act: 25 ),
  ( sym: 265; act: 26 ),
{ 41: }
{ 42: }
{ 43: }
{ 44: }
{ 45: }
  ( sym: 259; act: 39 ),
  ( sym: 260; act: 40 ),
  ( sym: 266; act: 60 ),
{ 46: }
{ 47: }
  ( sym: 257; act: 61 ),
{ 48: }
{ 49: }
{ 50: }
  ( sym: 257; act: 32 ),
{ 51: }
  ( sym: 257; act: 24 ),
  ( sym: 258; act: 25 ),
  ( sym: 265; act: 26 ),
{ 52: }
{ 53: }
{ 54: }
{ 55: }
  ( sym: 263; act: 34 ),
  ( sym: 264; act: 35 ),
  ( sym: 259; act: -26 ),
  ( sym: 260; act: -26 ),
  ( sym: 261; act: -26 ),
  ( sym: 262; act: -26 ),
  ( sym: 266; act: -26 ),
  ( sym: 268; act: -26 ),
  ( sym: 269; act: -26 ),
  ( sym: 270; act: -26 ),
  ( sym: 271; act: -26 ),
  ( sym: 277; act: -26 ),
  ( sym: 281; act: -26 ),
  ( sym: 282; act: -26 ),
{ 56: }
  ( sym: 263; act: 34 ),
  ( sym: 264; act: 35 ),
  ( sym: 259; act: -27 ),
  ( sym: 260; act: -27 ),
  ( sym: 261; act: -27 ),
  ( sym: 262; act: -27 ),
  ( sym: 266; act: -27 ),
  ( sym: 268; act: -27 ),
  ( sym: 269; act: -27 ),
  ( sym: 270; act: -27 ),
  ( sym: 271; act: -27 ),
  ( sym: 277; act: -27 ),
  ( sym: 281; act: -27 ),
  ( sym: 282; act: -27 ),
{ 57: }
  ( sym: 259; act: 39 ),
  ( sym: 260; act: 40 ),
  ( sym: 277; act: 64 ),
{ 58: }
  ( sym: 261; act: 36 ),
  ( sym: 262; act: 37 ),
  ( sym: 259; act: -23 ),
  ( sym: 260; act: -23 ),
  ( sym: 266; act: -23 ),
  ( sym: 268; act: -23 ),
  ( sym: 269; act: -23 ),
  ( sym: 270; act: -23 ),
  ( sym: 271; act: -23 ),
  ( sym: 277; act: -23 ),
  ( sym: 281; act: -23 ),
  ( sym: 282; act: -23 ),
{ 59: }
  ( sym: 261; act: 36 ),
  ( sym: 262; act: 37 ),
  ( sym: 259; act: -24 ),
  ( sym: 260; act: -24 ),
  ( sym: 266; act: -24 ),
  ( sym: 268; act: -24 ),
  ( sym: 269; act: -24 ),
  ( sym: 270; act: -24 ),
  ( sym: 271; act: -24 ),
  ( sym: 277; act: -24 ),
  ( sym: 281; act: -24 ),
  ( sym: 282; act: -24 ),
{ 60: }
{ 61: }
{ 62: }
{ 63: }
  ( sym: 259; act: 39 ),
  ( sym: 260; act: 40 ),
  ( sym: 268; act: -15 ),
  ( sym: 271; act: -15 ),
{ 64: }
  ( sym: 278; act: 12 ),
  ( sym: 279; act: 13 )
{ 65: }
);

yyg : array [1..yyngotos] of YYARec = (
{ 0: }
  ( sym: -2; act: 1 ),
{ 1: }
{ 2: }
{ 3: }
{ 4: }
  ( sym: -6; act: 5 ),
  ( sym: -4; act: 6 ),
  ( sym: -3; act: 7 ),
{ 5: }
{ 6: }
{ 7: }
  ( sym: -6; act: 5 ),
  ( sym: -4; act: 15 ),
{ 8: }
{ 9: }
{ 10: }
{ 11: }
  ( sym: -14; act: 19 ),
  ( sym: -13; act: 20 ),
  ( sym: -12; act: 21 ),
  ( sym: -11; act: 22 ),
  ( sym: -7; act: 23 ),
{ 12: }
  ( sym: -10; act: 27 ),
{ 13: }
{ 14: }
  ( sym: -9; act: 30 ),
  ( sym: -5; act: 31 ),
{ 15: }
{ 16: }
{ 17: }
{ 18: }
  ( sym: -14; act: 19 ),
  ( sym: -13; act: 20 ),
  ( sym: -12; act: 21 ),
  ( sym: -11; act: 22 ),
  ( sym: -7; act: 33 ),
{ 19: }
{ 20: }
{ 21: }
{ 22: }
{ 23: }
  ( sym: -8; act: 38 ),
{ 24: }
{ 25: }
{ 26: }
  ( sym: -14; act: 19 ),
  ( sym: -13; act: 20 ),
  ( sym: -12; act: 21 ),
  ( sym: -11; act: 22 ),
  ( sym: -7; act: 45 ),
{ 27: }
{ 28: }
{ 29: }
{ 30: }
{ 31: }
{ 32: }
{ 33: }
{ 34: }
  ( sym: -14; act: 19 ),
  ( sym: -13; act: 53 ),
{ 35: }
  ( sym: -14; act: 19 ),
  ( sym: -13; act: 54 ),
{ 36: }
  ( sym: -14; act: 19 ),
  ( sym: -13; act: 20 ),
  ( sym: -12; act: 55 ),
{ 37: }
  ( sym: -14; act: 19 ),
  ( sym: -13; act: 20 ),
  ( sym: -12; act: 56 ),
{ 38: }
  ( sym: -14; act: 19 ),
  ( sym: -13; act: 20 ),
  ( sym: -12; act: 21 ),
  ( sym: -11; act: 22 ),
  ( sym: -7; act: 57 ),
{ 39: }
  ( sym: -14; act: 19 ),
  ( sym: -13; act: 20 ),
  ( sym: -12; act: 21 ),
  ( sym: -11; act: 58 ),
{ 40: }
  ( sym: -14; act: 19 ),
  ( sym: -13; act: 20 ),
  ( sym: -12; act: 21 ),
  ( sym: -11; act: 59 ),
{ 41: }
{ 42: }
{ 43: }
{ 44: }
{ 45: }
{ 46: }
{ 47: }
{ 48: }
{ 49: }
{ 50: }
  ( sym: -9; act: 62 ),
{ 51: }
  ( sym: -14; act: 19 ),
  ( sym: -13; act: 20 ),
  ( sym: -12; act: 21 ),
  ( sym: -11; act: 22 ),
  ( sym: -7; act: 63 ),
{ 52: }
{ 53: }
{ 54: }
{ 55: }
{ 56: }
{ 57: }
{ 58: }
{ 59: }
{ 60: }
{ 61: }
{ 62: }
{ 63: }
{ 64: }
  ( sym: -6; act: 65 )
{ 65: }
);

yyd : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } -3,
{ 3: } 0,
{ 4: } 0,
{ 5: } -8,
{ 6: } -5,
{ 7: } 0,
{ 8: } 0,
{ 9: } 0,
{ 10: } -1,
{ 11: } 0,
{ 12: } 0,
{ 13: } 0,
{ 14: } 0,
{ 15: } -6,
{ 16: } -2,
{ 17: } -4,
{ 18: } 0,
{ 19: } -32,
{ 20: } -31,
{ 21: } 0,
{ 22: } 0,
{ 23: } 0,
{ 24: } -35,
{ 25: } -34,
{ 26: } 0,
{ 27: } 0,
{ 28: } -21,
{ 29: } 0,
{ 30: } -11,
{ 31: } 0,
{ 32: } 0,
{ 33: } 0,
{ 34: } 0,
{ 35: } 0,
{ 36: } 0,
{ 37: } 0,
{ 38: } 0,
{ 39: } 0,
{ 40: } 0,
{ 41: } -19,
{ 42: } -17,
{ 43: } -18,
{ 44: } -20,
{ 45: } 0,
{ 46: } -13,
{ 47: } 0,
{ 48: } -14,
{ 49: } -7,
{ 50: } 0,
{ 51: } 0,
{ 52: } -10,
{ 53: } -29,
{ 54: } -30,
{ 55: } 0,
{ 56: } 0,
{ 57: } 0,
{ 58: } 0,
{ 59: } 0,
{ 60: } -33,
{ 61: } -22,
{ 62: } -12,
{ 63: } 0,
{ 64: } 0,
{ 65: } -9
);

yyal : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 3,
{ 2: } 4,
{ 3: } 4,
{ 4: } 5,
{ 5: } 12,
{ 6: } 12,
{ 7: } 12,
{ 8: } 18,
{ 9: } 19,
{ 10: } 20,
{ 11: } 20,
{ 12: } 23,
{ 13: } 24,
{ 14: } 25,
{ 15: } 26,
{ 16: } 26,
{ 17: } 26,
{ 18: } 26,
{ 19: } 29,
{ 20: } 29,
{ 21: } 29,
{ 22: } 43,
{ 23: } 55,
{ 24: } 61,
{ 25: } 61,
{ 26: } 61,
{ 27: } 64,
{ 28: } 66,
{ 29: } 66,
{ 30: } 67,
{ 31: } 67,
{ 32: } 69,
{ 33: } 72,
{ 34: } 75,
{ 35: } 78,
{ 36: } 81,
{ 37: } 84,
{ 38: } 87,
{ 39: } 90,
{ 40: } 93,
{ 41: } 96,
{ 42: } 96,
{ 43: } 96,
{ 44: } 96,
{ 45: } 96,
{ 46: } 99,
{ 47: } 99,
{ 48: } 100,
{ 49: } 100,
{ 50: } 100,
{ 51: } 101,
{ 52: } 104,
{ 53: } 104,
{ 54: } 104,
{ 55: } 104,
{ 56: } 118,
{ 57: } 132,
{ 58: } 135,
{ 59: } 147,
{ 60: } 159,
{ 61: } 159,
{ 62: } 159,
{ 63: } 159,
{ 64: } 163,
{ 65: } 165
);

yyah : array [0..yynstates-1] of Integer = (
{ 0: } 2,
{ 1: } 3,
{ 2: } 3,
{ 3: } 4,
{ 4: } 11,
{ 5: } 11,
{ 6: } 11,
{ 7: } 17,
{ 8: } 18,
{ 9: } 19,
{ 10: } 19,
{ 11: } 22,
{ 12: } 23,
{ 13: } 24,
{ 14: } 25,
{ 15: } 25,
{ 16: } 25,
{ 17: } 25,
{ 18: } 28,
{ 19: } 28,
{ 20: } 28,
{ 21: } 42,
{ 22: } 54,
{ 23: } 60,
{ 24: } 60,
{ 25: } 60,
{ 26: } 63,
{ 27: } 65,
{ 28: } 65,
{ 29: } 66,
{ 30: } 66,
{ 31: } 68,
{ 32: } 71,
{ 33: } 74,
{ 34: } 77,
{ 35: } 80,
{ 36: } 83,
{ 37: } 86,
{ 38: } 89,
{ 39: } 92,
{ 40: } 95,
{ 41: } 95,
{ 42: } 95,
{ 43: } 95,
{ 44: } 95,
{ 45: } 98,
{ 46: } 98,
{ 47: } 99,
{ 48: } 99,
{ 49: } 99,
{ 50: } 100,
{ 51: } 103,
{ 52: } 103,
{ 53: } 103,
{ 54: } 103,
{ 55: } 117,
{ 56: } 131,
{ 57: } 134,
{ 58: } 146,
{ 59: } 158,
{ 60: } 158,
{ 61: } 158,
{ 62: } 158,
{ 63: } 162,
{ 64: } 164,
{ 65: } 164
);

yygl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 2,
{ 2: } 2,
{ 3: } 2,
{ 4: } 2,
{ 5: } 5,
{ 6: } 5,
{ 7: } 5,
{ 8: } 7,
{ 9: } 7,
{ 10: } 7,
{ 11: } 7,
{ 12: } 12,
{ 13: } 13,
{ 14: } 13,
{ 15: } 15,
{ 16: } 15,
{ 17: } 15,
{ 18: } 15,
{ 19: } 20,
{ 20: } 20,
{ 21: } 20,
{ 22: } 20,
{ 23: } 20,
{ 24: } 21,
{ 25: } 21,
{ 26: } 21,
{ 27: } 26,
{ 28: } 26,
{ 29: } 26,
{ 30: } 26,
{ 31: } 26,
{ 32: } 26,
{ 33: } 26,
{ 34: } 26,
{ 35: } 28,
{ 36: } 30,
{ 37: } 33,
{ 38: } 36,
{ 39: } 41,
{ 40: } 45,
{ 41: } 49,
{ 42: } 49,
{ 43: } 49,
{ 44: } 49,
{ 45: } 49,
{ 46: } 49,
{ 47: } 49,
{ 48: } 49,
{ 49: } 49,
{ 50: } 49,
{ 51: } 50,
{ 52: } 55,
{ 53: } 55,
{ 54: } 55,
{ 55: } 55,
{ 56: } 55,
{ 57: } 55,
{ 58: } 55,
{ 59: } 55,
{ 60: } 55,
{ 61: } 55,
{ 62: } 55,
{ 63: } 55,
{ 64: } 55,
{ 65: } 56
);

yygh : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 1,
{ 4: } 4,
{ 5: } 4,
{ 6: } 4,
{ 7: } 6,
{ 8: } 6,
{ 9: } 6,
{ 10: } 6,
{ 11: } 11,
{ 12: } 12,
{ 13: } 12,
{ 14: } 14,
{ 15: } 14,
{ 16: } 14,
{ 17: } 14,
{ 18: } 19,
{ 19: } 19,
{ 20: } 19,
{ 21: } 19,
{ 22: } 19,
{ 23: } 20,
{ 24: } 20,
{ 25: } 20,
{ 26: } 25,
{ 27: } 25,
{ 28: } 25,
{ 29: } 25,
{ 30: } 25,
{ 31: } 25,
{ 32: } 25,
{ 33: } 25,
{ 34: } 27,
{ 35: } 29,
{ 36: } 32,
{ 37: } 35,
{ 38: } 40,
{ 39: } 44,
{ 40: } 48,
{ 41: } 48,
{ 42: } 48,
{ 43: } 48,
{ 44: } 48,
{ 45: } 48,
{ 46: } 48,
{ 47: } 48,
{ 48: } 48,
{ 49: } 48,
{ 50: } 49,
{ 51: } 54,
{ 52: } 54,
{ 53: } 54,
{ 54: } 54,
{ 55: } 54,
{ 56: } 54,
{ 57: } 54,
{ 58: } 54,
{ 59: } 54,
{ 60: } 54,
{ 61: } 54,
{ 62: } 54,
{ 63: } 54,
{ 64: } 55,
{ 65: } 55
);

yyr : array [1..yynrules] of YYRRec = (
{ 1: } ( len: 3; sym: -2 ),
{ 2: } ( len: 4; sym: -2 ),
{ 3: } ( len: 1; sym: -2 ),
{ 4: } ( len: 2; sym: -3 ),
{ 5: } ( len: 1; sym: -3 ),
{ 6: } ( len: 2; sym: -3 ),
{ 7: } ( len: 3; sym: -4 ),
{ 8: } ( len: 1; sym: -4 ),
{ 9: } ( len: 6; sym: -4 ),
{ 10: } ( len: 4; sym: -4 ),
{ 11: } ( len: 1; sym: -5 ),
{ 12: } ( len: 3; sym: -5 ),
{ 13: } ( len: 3; sym: -6 ),
{ 14: } ( len: 3; sym: -6 ),
{ 15: } ( len: 3; sym: -9 ),
{ 16: } ( len: 1; sym: -9 ),
{ 17: } ( len: 1; sym: -8 ),
{ 18: } ( len: 1; sym: -8 ),
{ 19: } ( len: 1; sym: -8 ),
{ 20: } ( len: 1; sym: -8 ),
{ 21: } ( len: 1; sym: -10 ),
{ 22: } ( len: 3; sym: -10 ),
{ 23: } ( len: 3; sym: -7 ),
{ 24: } ( len: 3; sym: -7 ),
{ 25: } ( len: 1; sym: -7 ),
{ 26: } ( len: 3; sym: -11 ),
{ 27: } ( len: 3; sym: -11 ),
{ 28: } ( len: 1; sym: -11 ),
{ 29: } ( len: 3; sym: -12 ),
{ 30: } ( len: 3; sym: -12 ),
{ 31: } ( len: 1; sym: -12 ),
{ 32: } ( len: 1; sym: -13 ),
{ 33: } ( len: 3; sym: -13 ),
{ 34: } ( len: 1; sym: -14 ),
{ 35: } ( len: 1; sym: -14 )
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


{$I VYSElex.pas}
Begin
    start(cdl);
    yyparse();
End.