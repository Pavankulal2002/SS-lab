%{
#include<stdio.h>
#include<stdlib.h>
int yylex();

%}
%token A B ENTER
%%
input:S ENTER {printf("valid \n"); exit(0);}
S: S1 B | B
S1: A S1 | ;
;
%%

int main()
{
printf("Enter the string \n");
yyparse();
return(0);
}

int yyerror()
{
printf("Invalid string\n");
exit(0);
}


