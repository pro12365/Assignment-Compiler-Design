/*Write a program to recognize strings 'aaab', 'abbb', 'ab' and 'a' using grammer (a^n n^n, n>= 0) i.e., equal number of 'a' is followed by equal number of 'b*/

%{
#include "y.tab.h"
%}

%%
[aA] return A;
[bB] return B;
\n return NL;
. return yytext[0];

%%

int yywrap()
{
    return 1;
}

