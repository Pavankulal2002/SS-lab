%{ 
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror()
{
printf("error");
exit(0);
}
%}
%token num
%%
E:expr {printf("%d\n",$$); exit(0);}
expr : expr '+' expr {$$=$1+$3;}
 expr : expr '-' expr {$$=$1-$3;}
expr : expr '*' expr {$$=$1*$3;}
expr : expr '/' expr {if($3==0){printf("Divide by zero error\n");exit(0);}else{ $$=$1/$3;}}
|num{$$=$1;}
; 
%%

int main()
{ printf("Enter ");
yyparse();
}

