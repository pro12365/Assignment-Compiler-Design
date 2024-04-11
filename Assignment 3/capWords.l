/* Write a code in lex to display only the capital words from the given input string.*/

%{
#include <stdio.h>
%}

%%

[A-Z]+     { printf("Capital Word: %s\n", yytext); }

.          ; // Ignore any other characters

%%


int yywrap(){
    return 1;
}

int main() {
    printf("Enter a sentence: ");
    yylex(); // Call the lexer
    return 0;
}