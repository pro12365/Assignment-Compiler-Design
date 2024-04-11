%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token A B NL

%%
str: S NL { printf("Valid String\n");
            exit(0); }
;
S: A S B | A B;
%%

int yyerror(char *s) {
    printf("Invalid String\n");
    exit(1);
}

int main() {
    printf("Enter the string: \n");
    yyparse();
    return 0;
}