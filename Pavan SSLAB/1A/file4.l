%{
#include<stdio.h>
#include<string.h>
int i=0;
int X=0;
int Y=0;
int Z=0;
%}

%%
[0-9]+ {X++;}
[-*+/%] {Y++;} 
[(] {Z++;}
[)] {Z--;}
%%


int yywrap(){}

int main()
{
yylex();

if(X==0&&Y>=1)
{
printf("Invalid\n");
}

if(Y+1==X && Y>0 && Z==0){
printf("valid\n");
printf("operator:%d\n",X);
printf("operand :%d\n",Y);
}
else{
printf("Invalid\n");
}

return 0;
}

