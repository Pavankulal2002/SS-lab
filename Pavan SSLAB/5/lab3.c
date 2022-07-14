#include<stdio.h>
#include<string.h>
char op[10],arg1[10],arg2[10],result[10];
void main()
{
	FILE *fp1,*fp2;
	fp1=fopen("input.txt","r");
	fp2=fopen("output.txt","w");
	while(!feof(fp1))
	{
		fscanf(fp1,"%s%s%s%s",result,arg1,op,arg2);
		if(strcmp(op,"=")==0)
		{
			fprintf(fp2,"MOV R0, %s \n",arg1);
			fprintf(fp2,"MOV %s,R0 \n",result);
		}
		if(strcmp(op,"+")==0)
		{
			fprintf(fp2,"MOV R0, %s \n",arg1);
			fprintf(fp2,"ADD R0, %s \n",arg2);
			fprintf(fp2,"MOV %s,R0 \n",result);
		
		}
		if(strcmp(op,"*")==0)
		{
			fprintf(fp2,"MOV R0, %s \n",arg1);
			fprintf(fp2,"MUL R0, %s \n",arg2);
			fprintf(fp2,"MOV %s,R0 \n",result);
		
		}


	}
	fclose(fp1);
	fclose(fp2);
}
