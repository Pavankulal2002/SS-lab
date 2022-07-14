%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[\t];
[+|-|*|/] {printf("Operator is %s \n",yytext); return operator;}
[0-9]+ {printf("digit is %s \n",yytext); return DIGIT;}
[char|int|float|void|include|stdio] {printf("Keyword is %s \n",yytext); return KEY;}
[a-zA-Z0_9]+ {printf("Identifier is %s\n",yytext); return ID;}
. ;
%%
