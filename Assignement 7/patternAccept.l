/*Write a yacc program for the below grammer.
E -> E+T | T
T -> T*F | F
F -> (E) | id
*/

%{
    #include <stdio.h>
    #include "y.tab.h"
%}

%%
[a-zA-Z][0-9a-zA-Z]* { return ID; }
[ \t] ;
. { return yytext[0]; }
\n { return 0; }
%%

int yywrap() {
    return 1;
}