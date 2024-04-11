/*Write a lex code to remove the comments from any c-program given at run time and store into out.c file.*/

%{
    #include <stdio.h>
%}

%%
"//" * { }
"/*" * "*/" { }
%%

int yywrap()
{
    return 1;
}

int main()
{

    yyin = fopen("input.c", "r");
    yyout = fopen("out.c", "w");
    yylex();
    return 0;
}