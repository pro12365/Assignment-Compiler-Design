/*Write a lex program to check odd or even number.*/

%{
#include <stdio.h>
%}

DIGIT [0-9]

%%

{DIGIT}+   {
                int num = atoi(yytext); // Convert matched digits to integer
                if(num % 2 == 0)
                    printf("%d is even\n", num);
                else
                    printf("%d is odd\n", num);
            }

.|\n        ECHO; // Echo all other characters

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a number: ");
    yylex(); // Call the lexer
    return 0;
}
