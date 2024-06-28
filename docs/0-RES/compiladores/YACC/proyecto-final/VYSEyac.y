%{
Uses Lexlib, Yacclib;
%}

%token  ID, NUM, ADD, SUB, MULT, DIVI, POW, MODi, LPAREN, RPAREN, ASSIGN
%token  C_EndL, LOWER_T, HIGHER_T, TOKEN_SPLT, O_BRACES, C_BRACES, INVALID
%token  MAIN, IFi, THENi, READi, WRITEi, VARTYPEI, HIGHER_OE_T, LOWER_OE_T
%start  file

%%

file            :       MAIN O_BRACES C_BRACES                  { writeLn('OK | EMPTY MAIN'); }
                |       MAIN O_BRACES code_section C_BRACES     { writeLn('OK | CODED MAIN'); }
                |       error
                ;

code_section    :       error   C_EndL
                |       code_line
                |       code_section code_line
                ;

code_line       :       VARTYPEI var_dec C_EndL
                |       sentence
                |       IFi expression bool_compare expression THENi sentence
                |       ID ASSIGN expression C_EndL
                ;

var_dec         :       var_dec_iter
                |       var_dec TOKEN_SPLT var_dec_iter
                ;

sentence        :       READi ids_array C_EndL
                |       WRITEi ID C_EndL
                ;

var_dec_iter    :       ID ASSIGN expression
                |       ID
                ;

bool_compare    :       HIGHER_T
                |       HIGHER_OE_T
                |       LOWER_T
                |       LOWER_OE_T
                ;

ids_array       :       ID
                |       ids_array TOKEN_SPLT ID
                ;

expression      :       expression ADD term
                |       expression SUB term
                |       term
                ;

term            :       term MULT primary
                |       term DIVI primary
                |       primary
                ;

primary         :       primary POW factor
                |       primary MODi factor
                |       factor
                ;

factor          :       value
                |       LPAREN expression RPAREN
                ;

value           :       NUM
                |       ID
                ;


%%

{$I VYSElex.pas}
Begin
    start(cdl);
    yyparse();
End.