%{ 
  /* Definition section */
  #include<stdio.h> 
  int num, r; 
%}

DIGIT [0-9] 
/* Rule Section */
%% 
{DIGIT}+   { 
             num=atoi(yytext); 
             int binary[32]; // Assuming 32-bit integers
             int i = 0;
             while (num > 0) 
             { 
              binary[i++] = num % 2; 
              num/= 2; 
             } 
             for (int j = i - 1; j >= 0; j--) {
               printf("%d", binary[j]); // Printing binary in reverse order
             }
            } 
.|\n    ECHO; 
         
%% 

int yywrap() {
    // Indicates to Flex that there are no more input files to process
    return 1;
}
  
int main() 
{ 
    printf("Enter a number: ");
    int number;
    scanf("%d", &number); // Read the user input
    num = number; // Set the global variable 'num' to the user input
    printf("The binary equivalent is: ");
    yylex(); // Call the lexer to calculate and print the binary equivalent
    printf("\n"); // Print a newline for clarity
    return 0; 
}

