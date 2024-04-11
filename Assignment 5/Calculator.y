%{ 
/* Definition section */
#include<stdio.h> 
int flag=0; 
%} 

%token NUMBER 

%left '+' '-'

%left '*' '/' '%'

%left '(' ')'

%% 

ArithmeticExpression: E{ 

		printf("\nResult=%d\n", $$); 

		return 0; 

		}; 
E:E'+'E {$$=$1+$3;} 

|E'-'E {$$=$1-$3;} 

|E'*'E {$$=$1*$3;} 

|E'/'E {$$=$1/$3;} 

|E'%'E {$$=$1%$3;} 

|'('E')' {$$=$2;} 

| NUMBER {$$=$1;} 

; 

%% 

int main() 
{ 
printf("\nEnter Any Arithmetic Expression which "
       "can have operations Addition, "
       "Subtraction, Multiplication, Division, "
       "Modulus and Round brackets:\n");


yyparse(); 
if(flag==0){
    printf("\nEntered arithmetic expression is Invalid\n\n");
}
return 0;
} 

void yyerror() 
{ 
printf("\nEntered arithmetic expression is Invalid\n\n"); 
flag=1; 
} 
