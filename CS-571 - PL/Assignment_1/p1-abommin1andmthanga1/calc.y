%{
#include <stdio.h>
#include<string.h>
#include<stdlib.h>
int counter = 0;
struct T
	{       
	   char operand1[50];		
	   int value;		
	}symbol_table[200];


%}

%token TOK_ID TOK_SEMICOLON TOK_ADD TOK_SUB TOK_MUL TOK_DIV TOK_NUM TOK_PRINTLN TOK_MAIN
       TOK_EQUALS TOK_BRACKETOPEN TOK_BRACKETCLOSE TOK_OPENROUND TOK_CLOSEROUND

%union{
        int int_val;
        char tok_id[50];
}


%type <int_val> exprs TOK_NUM
%type <tok_id>  TOK_ID

%left TOK_ADD 
%left TOK_MUL 

%%

Prog: |TOK_MAIN TOK_OPENROUND TOK_CLOSEROUND TOK_BRACKETOPEN stmts TOK_BRACKETCLOSE        
;

stmts: 	|  stmt TOK_SEMICOLON  stmts 
;

stmt:   TOK_PRINTLN exprs
	{
        printf("%d\n",$2);         
	}
	
	|TOK_ID TOK_EQUALS exprs
	{
	
		strcpy(symbol_table[counter].operand1,$1);
		symbol_table[counter].value=$3;
		counter++;	

	}

	|TOK_ID TOK_MUL TOK_EQUALS exprs
	{
			int index=counter,y;
			while(index>=0){
				if(strcmp(symbol_table[index].operand1,$1)==0){
					y=symbol_table[index].value;
		     		symbol_table[index].value = y*$4;        			
					break;
				}
                else if(index==0){
                    printf("\nVariable %s is not declared\n",$1);
					yyerror();
					YYABORT;
			   	}
				index--;
			}	
	}
	
	|TOK_ID TOK_ADD TOK_EQUALS exprs
	{
			int index=counter,y;
			while(index>=0){
				if(strcmp(symbol_table[index].operand1,$1)==0){
					y=symbol_table[index].value;
	        		symbol_table[index].value = y+$4;        			
					break;
				}
                else if(index==0){
                    printf("\nVariable %s is not declared\n",$1);
					yyerror();
					YYABORT;
			   	}
				index--;
			}	
	}
	
;

exprs: 	 
	TOK_ID
	  	{
		int index=counter-1;
		while(index>=0){
			if(strcmp(symbol_table[index].operand1,$1)==0){					
				$$ =  symbol_table[index].value;
				break;
			}
			if(index==0){
                printf("\nVariable %s is not declared\n",$1);
				yyerror();
				YYABORT;				
			}
			index--;
		}  
	}

	| TOK_NUM
	  { 	
		$$ = $1;
	  }

	| exprs TOK_ADD exprs
	{
	$$=$1+$3;
	}

       | exprs TOK_MUL exprs
	{
	$$=$1*$3;
	}
	| TOK_OPENROUND TOK_SUB TOK_NUM TOK_CLOSEROUND
	{$$=-$3;}
;


%%

int yyerror( )
{	
	extern int yylineno;	
    printf("\nPrasing Error: line %d\n\n",yylineno);   
	return 0;
}

int main()
{
   yyparse();
   return 0;
}
