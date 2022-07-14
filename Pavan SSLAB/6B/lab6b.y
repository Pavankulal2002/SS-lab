%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
int id=0,op=0,key=0,dig=0;
extern  FILE *yyin;

%}
%token KEY ID operator DIGIT
%%
input:
	DIGIT input {dig++;}
	| ID input{id++;}
	| KEY input { key++;}
	|operator input{op++;}
	|DIGIT {dig++;}
	|ID {id++;}
	| KEY {key++;}
	|operator{op++;}
	;
%%



int yyerror()
{
	printf("Invalid string\n");
	exit(0);
}

int main()
{
	yyin= fopen("input.c","r");
	yyparse();
	printf("Identifier count = %d\n",id);
	printf("Operator count = %d\n",op);
	printf("Digit count = %d\n",dig);
	printf("Keyword count = %d\n",key);
	return(0);
}


