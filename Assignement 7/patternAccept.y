%{
    #include <stdio.h>
    int flag = 0; 
%}

%token ID;

%%
E : E '+' T | T;
T : T '*' F | F;
F : '(' E ')' | ID;
%%

int main() {
    printf("Enter an expression: ");
    yyparse();
    if (flag == 0) {
        printf("Valid expression\n");
    } else {
        printf("Invalid expression\n");
    }
    return 0;
}

int yyerror() {
    flag = 1;
    printf("Invalid expression\n");
    return 0;
}