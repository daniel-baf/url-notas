%%
[a-z]([a-z0-9]*)                                          return(ID);
[+-]?((0?([1-9][0-9]*))|0)(\.[0-9]+)?(([eE])[+-]?[0-9]+)? 
                            Begin
                                val(yytext, yyval.yyReal, resultado);
                                return(NUM);
                            End;

"(" return(PA);
")" return(PC);
"*" return(MUL);
"+" return(SUMA);
"-" return(SUB);
"/" return(DIVI);
"=" return(ASIGNACION);
"\n" return(ENTER);
%%