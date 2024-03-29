
(* lexical analyzer template (TP Lex V3.0), V1.0 3-2-91 AG *)

(* global definitions: *)
Var
  comment: String;
  input: Integer; // Declare a global variable to store the number


const cdl = 2;
const l_comm = 4;
const s_comm = 6;


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
								    start(l_comm);
							    End;
  3:
                  Begin
                    start(s_comm);
                  End;
  4:
                  ;
  5:
            
      				    Begin
						        start(cdl);
                    comment := '';
					        End;
  6:
            
                  Begin
                    start(cdl);
                    comment := '';
                  End;
  7:
                  Begin
                    comment := comment + yytext;
                  End;
  8:
                  Begin
                    comment := comment + yytext;
                  End;

  9:
                  Begin
                    return(ID);
                  End;
  10:
                  Begin
                      Val(yytext, input);
                      yylval  :=  input;
                      return(NUM);
                  End;
  11:
                  return(ADD);
  12:
                  return(SUB);
  13:
                  return(MULT);
  14:
                  return(DIVI);
  15:
                  return(POW);
  16:
                  return(MODi);
  17:
                  return(LPAREN);
  18:
                  return(RPAREN);
  19:
                  return(C_EndL);
  20:
                  return(ASSIGN);
  21:
                  return(LOWER_OE_T);
  22:
                  return(HIGHER_OE_T);
  23:
                  return(HIGHER_T);
  24:
                  return(LOWER_T);
  25:
                  return(TOKEN_SPLT);
  26:
                  return(O_BRACES);
  27:
                  return(C_BRACES);
  28:
                  return(MAIN);
  29:
                  return(IFi);
  30:
                  return(THENi);
  31:
                  return(READi);
  32:
                  return(WRITEi);
  33:
                  Begin
                      yylval  :=  input;
                      return(VARTYPEI);
                  End;
  34:
                  Begin
                    return(INVALID);
                  End;
  end;
end(*yyaction*);

(* DFA table: *)

type YYTRec = record
                cc : set of Char;
                s  : Integer;
              end;

const

yynmarks   = 107;
yynmatches = 107;
yyntrans   = 139;
yynstates  = 74;

yyk : array [1..yynmarks] of Integer = (
  { 0: }
  { 1: }
  { 2: }
  { 3: }
  { 4: }
  { 5: }
  { 6: }
  { 7: }
  { 8: }
  1,
  { 9: }
  14,
  34,
  { 10: }
  9,
  33,
  34,
  { 11: }
  10,
  34,
  { 12: }
  11,
  34,
  { 13: }
  12,
  34,
  { 14: }
  13,
  34,
  { 15: }
  15,
  34,
  { 16: }
  16,
  34,
  { 17: }
  17,
  34,
  { 18: }
  18,
  34,
  { 19: }
  19,
  34,
  { 20: }
  34,
  { 21: }
  24,
  34,
  { 22: }
  23,
  34,
  { 23: }
  25,
  34,
  { 24: }
  26,
  34,
  { 25: }
  27,
  34,
  { 26: }
  9,
  33,
  34,
  { 27: }
  9,
  33,
  34,
  { 28: }
  9,
  33,
  34,
  { 29: }
  9,
  33,
  34,
  { 30: }
  9,
  33,
  34,
  { 31: }
  9,
  33,
  34,
  { 32: }
  9,
  33,
  34,
  { 33: }
  9,
  33,
  34,
  { 34: }
  9,
  33,
  34,
  { 35: }
  1,
  34,
  { 36: }
  34,
  { 37: }
  4,
  { 38: }
  7,
  { 39: }
  4,
  7,
  { 40: }
  7,
  { 41: }
  6,
  { 42: }
  8,
  { 43: }
  2,
  { 44: }
  3,
  { 45: }
  33,
  { 46: }
  10,
  { 47: }
  { 48: }
  20,
  { 49: }
  21,
  { 50: }
  22,
  { 51: }
  33,
  { 52: }
  29,
  33,
  { 53: }
  33,
  { 54: }
  33,
  { 55: }
  33,
  { 56: }
  33,
  { 57: }
  33,
  { 58: }
  33,
  { 59: }
  5,
  { 60: }
  10,
  { 61: }
  33,
  { 62: }
  33,
  { 63: }
  33,
  { 64: }
  33,
  { 65: }
  33,
  { 66: }
  33,
  { 67: }
  33,
  { 68: }
  28,
  33,
  { 69: }
  30,
  33,
  { 70: }
  31,
  33,
  { 71: }
  33,
  { 72: }
  33,
  { 73: }
  32,
  33
);

yym : array [1..yynmatches] of Integer = (
{ 0: }
{ 1: }
{ 2: }
{ 3: }
{ 4: }
{ 5: }
{ 6: }
{ 7: }
{ 8: }
  1,
{ 9: }
  14,
  34,
{ 10: }
  9,
  33,
  34,
{ 11: }
  10,
  34,
{ 12: }
  11,
  34,
{ 13: }
  12,
  34,
{ 14: }
  13,
  34,
{ 15: }
  15,
  34,
{ 16: }
  16,
  34,
{ 17: }
  17,
  34,
{ 18: }
  18,
  34,
{ 19: }
  19,
  34,
{ 20: }
  34,
{ 21: }
  24,
  34,
{ 22: }
  23,
  34,
{ 23: }
  25,
  34,
{ 24: }
  26,
  34,
{ 25: }
  27,
  34,
{ 26: }
  9,
  33,
  34,
{ 27: }
  9,
  33,
  34,
{ 28: }
  9,
  33,
  34,
{ 29: }
  9,
  33,
  34,
{ 30: }
  9,
  33,
  34,
{ 31: }
  9,
  33,
  34,
{ 32: }
  9,
  33,
  34,
{ 33: }
  9,
  33,
  34,
{ 34: }
  9,
  33,
  34,
{ 35: }
  1,
  34,
{ 36: }
  34,
{ 37: }
  4,
{ 38: }
  7,
{ 39: }
  4,
  7,
{ 40: }
  7,
{ 41: }
  6,
{ 42: }
  8,
{ 43: }
  2,
{ 44: }
  3,
{ 45: }
  33,
{ 46: }
  10,
{ 47: }
{ 48: }
  20,
{ 49: }
  21,
{ 50: }
  22,
{ 51: }
  33,
{ 52: }
  29,
  33,
{ 53: }
  33,
{ 54: }
  33,
{ 55: }
  33,
{ 56: }
  33,
{ 57: }
  33,
{ 58: }
  33,
{ 59: }
  5,
{ 60: }
  10,
{ 61: }
  33,
{ 62: }
  33,
{ 63: }
  33,
{ 64: }
  33,
{ 65: }
  33,
{ 66: }
  33,
{ 67: }
  33,
{ 68: }
  28,
  33,
{ 69: }
  30,
  33,
{ 70: }
  31,
  33,
{ 71: }
  33,
{ 72: }
  33,
{ 73: }
  32,
  33
);

yyt : array [1..yyntrans] of YYTrec = (
{ 0: }
{ 1: }
{ 2: }
  ( cc: [ #1..#8,#11,#12,#14..#31,'!'..'$','&','''',
            '.','=','?','@','['..']','_','`','|','~'..#255 ]; s: 36),
  ( cc: [ #9,#13,' ' ]; s: 35),
  ( cc: [ #10 ]; s: 8),
  ( cc: [ '%' ]; s: 16),
  ( cc: [ '(' ]; s: 17),
  ( cc: [ ')' ]; s: 18),
  ( cc: [ '*' ]; s: 14),
  ( cc: [ '+' ]; s: 12),
  ( cc: [ ',' ]; s: 23),
  ( cc: [ '-' ]; s: 13),
  ( cc: [ '/' ]; s: 9),
  ( cc: [ '0'..'9' ]; s: 11),
  ( cc: [ ':' ]; s: 20),
  ( cc: [ ';' ]; s: 19),
  ( cc: [ '<' ]; s: 21),
  ( cc: [ '>' ]; s: 22),
  ( cc: [ 'A'..'H','J'..'L','N'..'Q','S','U','V','X'..'Z',
            'a'..'h','j'..'q','s','u','v','x'..'z' ]; s: 10),
  ( cc: [ 'I' ]; s: 28),
  ( cc: [ 'M' ]; s: 26),
  ( cc: [ 'R' ]; s: 32),
  ( cc: [ 'T' ]; s: 29),
  ( cc: [ 'W' ]; s: 34),
  ( cc: [ '^' ]; s: 15),
  ( cc: [ 'i' ]; s: 27),
  ( cc: [ 'r' ]; s: 31),
  ( cc: [ 't' ]; s: 30),
  ( cc: [ 'w' ]; s: 33),
  ( cc: [ '{' ]; s: 24),
  ( cc: [ '}' ]; s: 25),
{ 3: }
  ( cc: [ #1..#8,#11,#12,#14..#31,'!'..'$','&','''',
            '.','=','?','@','['..']','_','`','|','~'..#255 ]; s: 36),
  ( cc: [ #9,#13,' ' ]; s: 35),
  ( cc: [ #10 ]; s: 8),
  ( cc: [ '%' ]; s: 16),
  ( cc: [ '(' ]; s: 17),
  ( cc: [ ')' ]; s: 18),
  ( cc: [ '*' ]; s: 14),
  ( cc: [ '+' ]; s: 12),
  ( cc: [ ',' ]; s: 23),
  ( cc: [ '-' ]; s: 13),
  ( cc: [ '/' ]; s: 9),
  ( cc: [ '0'..'9' ]; s: 11),
  ( cc: [ ':' ]; s: 20),
  ( cc: [ ';' ]; s: 19),
  ( cc: [ '<' ]; s: 21),
  ( cc: [ '>' ]; s: 22),
  ( cc: [ 'A'..'H','J'..'L','N'..'Q','S','U','V','X'..'Z',
            'a'..'h','j'..'q','s','u','v','x'..'z' ]; s: 10),
  ( cc: [ 'I' ]; s: 28),
  ( cc: [ 'M' ]; s: 26),
  ( cc: [ 'R' ]; s: 32),
  ( cc: [ 'T' ]; s: 29),
  ( cc: [ 'W' ]; s: 34),
  ( cc: [ '^' ]; s: 15),
  ( cc: [ 'i' ]; s: 27),
  ( cc: [ 'r' ]; s: 31),
  ( cc: [ 't' ]; s: 30),
  ( cc: [ 'w' ]; s: 33),
  ( cc: [ '{' ]; s: 24),
  ( cc: [ '}' ]; s: 25),
{ 4: }
  ( cc: [ #1..#8,#11,#12,#14..#31,'!'..')','+'..#255 ]; s: 40),
  ( cc: [ #9,#13,' ' ]; s: 39),
  ( cc: [ #10 ]; s: 37),
  ( cc: [ '*' ]; s: 38),
{ 5: }
  ( cc: [ #1..#8,#11,#12,#14..#31,'!'..')','+'..#255 ]; s: 40),
  ( cc: [ #9,#13,' ' ]; s: 39),
  ( cc: [ #10 ]; s: 37),
  ( cc: [ '*' ]; s: 38),
{ 6: }
  ( cc: [ #1..#9,#11..#255 ]; s: 42),
  ( cc: [ #10 ]; s: 41),
{ 7: }
  ( cc: [ #1..#9,#11..#255 ]; s: 42),
  ( cc: [ #10 ]; s: 41),
{ 8: }
{ 9: }
  ( cc: [ '*' ]; s: 43),
  ( cc: [ '/' ]; s: 44),
{ 10: }
  ( cc: [ 'A'..'Z','a'..'z' ]; s: 45),
{ 11: }
  ( cc: [ '.' ]; s: 47),
  ( cc: [ '0'..'9' ]; s: 46),
{ 12: }
{ 13: }
{ 14: }
{ 15: }
{ 16: }
{ 17: }
{ 18: }
{ 19: }
{ 20: }
  ( cc: [ '=' ]; s: 48),
{ 21: }
  ( cc: [ '=' ]; s: 49),
{ 22: }
  ( cc: [ '=' ]; s: 50),
{ 23: }
{ 24: }
{ 25: }
{ 26: }
  ( cc: [ 'A'..'Z','b'..'z' ]; s: 45),
  ( cc: [ 'a' ]; s: 51),
{ 27: }
  ( cc: [ 'A'..'Z','a'..'e','g'..'z' ]; s: 45),
  ( cc: [ 'f' ]; s: 52),
{ 28: }
  ( cc: [ 'A'..'Z','a'..'e','g'..'z' ]; s: 45),
  ( cc: [ 'f' ]; s: 52),
{ 29: }
  ( cc: [ 'A'..'Z','a'..'g','i'..'z' ]; s: 45),
  ( cc: [ 'h' ]; s: 53),
{ 30: }
  ( cc: [ 'A'..'Z','a'..'g','i'..'z' ]; s: 45),
  ( cc: [ 'h' ]; s: 54),
{ 31: }
  ( cc: [ 'A'..'Z','a'..'d','f'..'z' ]; s: 45),
  ( cc: [ 'e' ]; s: 55),
{ 32: }
  ( cc: [ 'A'..'Z','a'..'d','f'..'z' ]; s: 45),
  ( cc: [ 'e' ]; s: 56),
{ 33: }
  ( cc: [ 'A'..'Z','a'..'q','s'..'z' ]; s: 45),
  ( cc: [ 'r' ]; s: 57),
{ 34: }
  ( cc: [ 'A'..'Z','a'..'q','s'..'z' ]; s: 45),
  ( cc: [ 'r' ]; s: 58),
{ 35: }
{ 36: }
{ 37: }
{ 38: }
  ( cc: [ '/' ]; s: 59),
{ 39: }
{ 40: }
{ 41: }
{ 42: }
{ 43: }
{ 44: }
{ 45: }
  ( cc: [ 'A'..'Z','a'..'z' ]; s: 45),
{ 46: }
  ( cc: [ '.' ]; s: 47),
  ( cc: [ '0'..'9' ]; s: 46),
{ 47: }
  ( cc: [ '0'..'9' ]; s: 60),
{ 48: }
{ 49: }
{ 50: }
{ 51: }
  ( cc: [ 'A'..'Z','a'..'h','j'..'z' ]; s: 45),
  ( cc: [ 'i' ]; s: 61),
{ 52: }
  ( cc: [ 'A'..'Z','a'..'z' ]; s: 45),
{ 53: }
  ( cc: [ 'A'..'Z','a'..'d','f'..'z' ]; s: 45),
  ( cc: [ 'e' ]; s: 62),
{ 54: }
  ( cc: [ 'A'..'Z','a'..'d','f'..'z' ]; s: 45),
  ( cc: [ 'e' ]; s: 63),
{ 55: }
  ( cc: [ 'A'..'Z','b'..'z' ]; s: 45),
  ( cc: [ 'a' ]; s: 64),
{ 56: }
  ( cc: [ 'A'..'Z','b'..'z' ]; s: 45),
  ( cc: [ 'a' ]; s: 65),
{ 57: }
  ( cc: [ 'A'..'Z','a'..'h','j'..'z' ]; s: 45),
  ( cc: [ 'i' ]; s: 66),
{ 58: }
  ( cc: [ 'A'..'Z','a'..'h','j'..'z' ]; s: 45),
  ( cc: [ 'i' ]; s: 67),
{ 59: }
{ 60: }
  ( cc: [ '0'..'9' ]; s: 60),
{ 61: }
  ( cc: [ 'A'..'Z','a'..'m','o'..'z' ]; s: 45),
  ( cc: [ 'n' ]; s: 68),
{ 62: }
  ( cc: [ 'A'..'Z','a'..'m','o'..'z' ]; s: 45),
  ( cc: [ 'n' ]; s: 69),
{ 63: }
  ( cc: [ 'A'..'Z','a'..'m','o'..'z' ]; s: 45),
  ( cc: [ 'n' ]; s: 69),
{ 64: }
  ( cc: [ 'A'..'Z','a'..'c','e'..'z' ]; s: 45),
  ( cc: [ 'd' ]; s: 70),
{ 65: }
  ( cc: [ 'A'..'Z','a'..'c','e'..'z' ]; s: 45),
  ( cc: [ 'd' ]; s: 70),
{ 66: }
  ( cc: [ 'A'..'Z','a'..'s','u'..'z' ]; s: 45),
  ( cc: [ 't' ]; s: 71),
{ 67: }
  ( cc: [ 'A'..'Z','a'..'s','u'..'z' ]; s: 45),
  ( cc: [ 't' ]; s: 72),
{ 68: }
  ( cc: [ 'A'..'Z','a'..'z' ]; s: 45),
{ 69: }
  ( cc: [ 'A'..'Z','a'..'z' ]; s: 45),
{ 70: }
  ( cc: [ 'A'..'Z','a'..'z' ]; s: 45),
{ 71: }
  ( cc: [ 'A'..'Z','a'..'d','f'..'z' ]; s: 45),
  ( cc: [ 'e' ]; s: 73),
{ 72: }
  ( cc: [ 'A'..'Z','a'..'d','f'..'z' ]; s: 45),
  ( cc: [ 'e' ]; s: 73),
{ 73: }
  ( cc: [ 'A'..'Z','a'..'z' ]; s: 45)
);

yykl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 1,
{ 4: } 1,
{ 5: } 1,
{ 6: } 1,
{ 7: } 1,
{ 8: } 1,
{ 9: } 2,
{ 10: } 4,
{ 11: } 7,
{ 12: } 9,
{ 13: } 11,
{ 14: } 13,
{ 15: } 15,
{ 16: } 17,
{ 17: } 19,
{ 18: } 21,
{ 19: } 23,
{ 20: } 25,
{ 21: } 26,
{ 22: } 28,
{ 23: } 30,
{ 24: } 32,
{ 25: } 34,
{ 26: } 36,
{ 27: } 39,
{ 28: } 42,
{ 29: } 45,
{ 30: } 48,
{ 31: } 51,
{ 32: } 54,
{ 33: } 57,
{ 34: } 60,
{ 35: } 63,
{ 36: } 65,
{ 37: } 66,
{ 38: } 67,
{ 39: } 68,
{ 40: } 70,
{ 41: } 71,
{ 42: } 72,
{ 43: } 73,
{ 44: } 74,
{ 45: } 75,
{ 46: } 76,
{ 47: } 77,
{ 48: } 77,
{ 49: } 78,
{ 50: } 79,
{ 51: } 80,
{ 52: } 81,
{ 53: } 83,
{ 54: } 84,
{ 55: } 85,
{ 56: } 86,
{ 57: } 87,
{ 58: } 88,
{ 59: } 89,
{ 60: } 90,
{ 61: } 91,
{ 62: } 92,
{ 63: } 93,
{ 64: } 94,
{ 65: } 95,
{ 66: } 96,
{ 67: } 97,
{ 68: } 98,
{ 69: } 100,
{ 70: } 102,
{ 71: } 104,
{ 72: } 105,
{ 73: } 106
);

yykh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 0,
{ 3: } 0,
{ 4: } 0,
{ 5: } 0,
{ 6: } 0,
{ 7: } 0,
{ 8: } 1,
{ 9: } 3,
{ 10: } 6,
{ 11: } 8,
{ 12: } 10,
{ 13: } 12,
{ 14: } 14,
{ 15: } 16,
{ 16: } 18,
{ 17: } 20,
{ 18: } 22,
{ 19: } 24,
{ 20: } 25,
{ 21: } 27,
{ 22: } 29,
{ 23: } 31,
{ 24: } 33,
{ 25: } 35,
{ 26: } 38,
{ 27: } 41,
{ 28: } 44,
{ 29: } 47,
{ 30: } 50,
{ 31: } 53,
{ 32: } 56,
{ 33: } 59,
{ 34: } 62,
{ 35: } 64,
{ 36: } 65,
{ 37: } 66,
{ 38: } 67,
{ 39: } 69,
{ 40: } 70,
{ 41: } 71,
{ 42: } 72,
{ 43: } 73,
{ 44: } 74,
{ 45: } 75,
{ 46: } 76,
{ 47: } 76,
{ 48: } 77,
{ 49: } 78,
{ 50: } 79,
{ 51: } 80,
{ 52: } 82,
{ 53: } 83,
{ 54: } 84,
{ 55: } 85,
{ 56: } 86,
{ 57: } 87,
{ 58: } 88,
{ 59: } 89,
{ 60: } 90,
{ 61: } 91,
{ 62: } 92,
{ 63: } 93,
{ 64: } 94,
{ 65: } 95,
{ 66: } 96,
{ 67: } 97,
{ 68: } 99,
{ 69: } 101,
{ 70: } 103,
{ 71: } 104,
{ 72: } 105,
{ 73: } 107
);

yyml : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 1,
{ 4: } 1,
{ 5: } 1,
{ 6: } 1,
{ 7: } 1,
{ 8: } 1,
{ 9: } 2,
{ 10: } 4,
{ 11: } 7,
{ 12: } 9,
{ 13: } 11,
{ 14: } 13,
{ 15: } 15,
{ 16: } 17,
{ 17: } 19,
{ 18: } 21,
{ 19: } 23,
{ 20: } 25,
{ 21: } 26,
{ 22: } 28,
{ 23: } 30,
{ 24: } 32,
{ 25: } 34,
{ 26: } 36,
{ 27: } 39,
{ 28: } 42,
{ 29: } 45,
{ 30: } 48,
{ 31: } 51,
{ 32: } 54,
{ 33: } 57,
{ 34: } 60,
{ 35: } 63,
{ 36: } 65,
{ 37: } 66,
{ 38: } 67,
{ 39: } 68,
{ 40: } 70,
{ 41: } 71,
{ 42: } 72,
{ 43: } 73,
{ 44: } 74,
{ 45: } 75,
{ 46: } 76,
{ 47: } 77,
{ 48: } 77,
{ 49: } 78,
{ 50: } 79,
{ 51: } 80,
{ 52: } 81,
{ 53: } 83,
{ 54: } 84,
{ 55: } 85,
{ 56: } 86,
{ 57: } 87,
{ 58: } 88,
{ 59: } 89,
{ 60: } 90,
{ 61: } 91,
{ 62: } 92,
{ 63: } 93,
{ 64: } 94,
{ 65: } 95,
{ 66: } 96,
{ 67: } 97,
{ 68: } 98,
{ 69: } 100,
{ 70: } 102,
{ 71: } 104,
{ 72: } 105,
{ 73: } 106
);

yymh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 0,
{ 3: } 0,
{ 4: } 0,
{ 5: } 0,
{ 6: } 0,
{ 7: } 0,
{ 8: } 1,
{ 9: } 3,
{ 10: } 6,
{ 11: } 8,
{ 12: } 10,
{ 13: } 12,
{ 14: } 14,
{ 15: } 16,
{ 16: } 18,
{ 17: } 20,
{ 18: } 22,
{ 19: } 24,
{ 20: } 25,
{ 21: } 27,
{ 22: } 29,
{ 23: } 31,
{ 24: } 33,
{ 25: } 35,
{ 26: } 38,
{ 27: } 41,
{ 28: } 44,
{ 29: } 47,
{ 30: } 50,
{ 31: } 53,
{ 32: } 56,
{ 33: } 59,
{ 34: } 62,
{ 35: } 64,
{ 36: } 65,
{ 37: } 66,
{ 38: } 67,
{ 39: } 69,
{ 40: } 70,
{ 41: } 71,
{ 42: } 72,
{ 43: } 73,
{ 44: } 74,
{ 45: } 75,
{ 46: } 76,
{ 47: } 76,
{ 48: } 77,
{ 49: } 78,
{ 50: } 79,
{ 51: } 80,
{ 52: } 82,
{ 53: } 83,
{ 54: } 84,
{ 55: } 85,
{ 56: } 86,
{ 57: } 87,
{ 58: } 88,
{ 59: } 89,
{ 60: } 90,
{ 61: } 91,
{ 62: } 92,
{ 63: } 93,
{ 64: } 94,
{ 65: } 95,
{ 66: } 96,
{ 67: } 97,
{ 68: } 99,
{ 69: } 101,
{ 70: } 103,
{ 71: } 104,
{ 72: } 105,
{ 73: } 107
);

yytl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 30,
{ 4: } 59,
{ 5: } 63,
{ 6: } 67,
{ 7: } 69,
{ 8: } 71,
{ 9: } 71,
{ 10: } 73,
{ 11: } 74,
{ 12: } 76,
{ 13: } 76,
{ 14: } 76,
{ 15: } 76,
{ 16: } 76,
{ 17: } 76,
{ 18: } 76,
{ 19: } 76,
{ 20: } 76,
{ 21: } 77,
{ 22: } 78,
{ 23: } 79,
{ 24: } 79,
{ 25: } 79,
{ 26: } 79,
{ 27: } 81,
{ 28: } 83,
{ 29: } 85,
{ 30: } 87,
{ 31: } 89,
{ 32: } 91,
{ 33: } 93,
{ 34: } 95,
{ 35: } 97,
{ 36: } 97,
{ 37: } 97,
{ 38: } 97,
{ 39: } 98,
{ 40: } 98,
{ 41: } 98,
{ 42: } 98,
{ 43: } 98,
{ 44: } 98,
{ 45: } 98,
{ 46: } 99,
{ 47: } 101,
{ 48: } 102,
{ 49: } 102,
{ 50: } 102,
{ 51: } 102,
{ 52: } 104,
{ 53: } 105,
{ 54: } 107,
{ 55: } 109,
{ 56: } 111,
{ 57: } 113,
{ 58: } 115,
{ 59: } 117,
{ 60: } 117,
{ 61: } 118,
{ 62: } 120,
{ 63: } 122,
{ 64: } 124,
{ 65: } 126,
{ 66: } 128,
{ 67: } 130,
{ 68: } 132,
{ 69: } 133,
{ 70: } 134,
{ 71: } 135,
{ 72: } 137,
{ 73: } 139
);

yyth : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 29,
{ 3: } 58,
{ 4: } 62,
{ 5: } 66,
{ 6: } 68,
{ 7: } 70,
{ 8: } 70,
{ 9: } 72,
{ 10: } 73,
{ 11: } 75,
{ 12: } 75,
{ 13: } 75,
{ 14: } 75,
{ 15: } 75,
{ 16: } 75,
{ 17: } 75,
{ 18: } 75,
{ 19: } 75,
{ 20: } 76,
{ 21: } 77,
{ 22: } 78,
{ 23: } 78,
{ 24: } 78,
{ 25: } 78,
{ 26: } 80,
{ 27: } 82,
{ 28: } 84,
{ 29: } 86,
{ 30: } 88,
{ 31: } 90,
{ 32: } 92,
{ 33: } 94,
{ 34: } 96,
{ 35: } 96,
{ 36: } 96,
{ 37: } 96,
{ 38: } 97,
{ 39: } 97,
{ 40: } 97,
{ 41: } 97,
{ 42: } 97,
{ 43: } 97,
{ 44: } 97,
{ 45: } 98,
{ 46: } 100,
{ 47: } 101,
{ 48: } 101,
{ 49: } 101,
{ 50: } 101,
{ 51: } 103,
{ 52: } 104,
{ 53: } 106,
{ 54: } 108,
{ 55: } 110,
{ 56: } 112,
{ 57: } 114,
{ 58: } 116,
{ 59: } 116,
{ 60: } 117,
{ 61: } 119,
{ 62: } 121,
{ 63: } 123,
{ 64: } 125,
{ 65: } 127,
{ 66: } 129,
{ 67: } 131,
{ 68: } 132,
{ 69: } 133,
{ 70: } 134,
{ 71: } 136,
{ 72: } 138,
{ 73: } 139
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


