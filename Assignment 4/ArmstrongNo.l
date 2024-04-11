/*Write a lex program to check wheather given number is armstrong number or not.*/


%{
#include<stdio.h>
int n, sum=0, temp, r;
%}

%%
[0-9]+ {n=atoi(yytext);
temp=n;
while(n>0)
{
r=n%10;
sum=sum+(r*r*r);
n=n/10;
}
if(temp==sum)
printf("Armstrong number\n");
else
printf("Not an Armstrong number\n");
}
%%

int main()
{
printf("Enter a number\n");
yylex();
return 0;
}

int yywrap()
{
return 1;
}