%{
    #include <stdio.h>
%}

%%

"//".*      { /* Single-line comments */ }
"/*"([^*]|(\*+[^*/]))*\*+"/"    { /* Multi-line comments */ }
.           { /* Any other character */ ECHO; }

%%

int yywrap() {
    return 1;  // Indicate to Flex that the end of input has been reached
}

int main() {
    FILE *input = fopen("input.c", "r");
    FILE *output = fopen("out.c", "w");

    if (!input) {
        perror("Error opening input file");
        return 1;
    }

    if (!output) {
        perror("Error opening output file");
        fclose(input);
        return 1;
    }

    yyin = input;
    yyout = output;

    yylex();

    fclose(input);
    fclose(output);

    return 0;
}
