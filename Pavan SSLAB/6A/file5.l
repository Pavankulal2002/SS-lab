%{
#include<stdio.h>
#include<string.h>
int i=0;
int comm1=0;
int comm2=0;
%}

%%
[/][/].* {comm1++;}
[/][*] {i++;} 
[*][/] {i--,comm2++;} 
. {if(i==0) ECHO;}

%%


int yywrap(){}

int main()
{

yyin = fopen("sum.c","r");
yyout = fopen("sum1.c","w");
yylex();

printf("comment // \t:  %d\n",comm1);
printf("comment /*...*/  \t:  %d\n",comm2);
return 0;
}

