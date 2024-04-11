/* Write a lex code to recognize and display keywords numbers and words in a given sentence. */

%{
#include <stdio.h>
%}

%%

[0-9]+          { printf("Number: %s\n", yytext); }
if|else|while   { printf("Keyword: %s\n", yytext); }
[a-zA-Z]+       { printf("Word: %s\n", yytext); }
.               ; // Ignore any other characters

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a sentence: ");
    yylex(); // Call the lexer
    return 0;
}
