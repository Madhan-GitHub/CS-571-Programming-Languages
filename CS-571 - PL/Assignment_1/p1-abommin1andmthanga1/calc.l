%option yylineno
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "calc.tab.h"
%}

digit         	  ([0-9])

%%

"main"            {return(TOK_MAIN);}

"print"           {return(TOK_PRINTLN);}


{digit}+	      {
		           sscanf(yytext, "%d", &yylval);
		           return TOK_NUM;
		          }
"="	              {return (TOK_EQUALS);}
";"	              {return(TOK_SEMICOLON);}

"+"	              {return(TOK_ADD);}
"-"			      {return(TOK_SUB);}
"*"			      {return(TOK_MUL);}

"{"			      {return(TOK_BRACKETOPEN);}
"}"			      {return(TOK_BRACKETCLOSE);}
"(" 		      {return(TOK_OPENROUND);}
")"				  {return(TOK_CLOSEROUND);}
[a-z][a-zA-Z0-9]* { 
		          sscanf(yytext, "%s", &(yylval.tok_id));return(TOK_ID); 
		          }

[ \n]             { }	
[ \t]	          { }

.                 {
	                printf("\nLexical analysis error: '%c'\n",yytext[0]);
                  }


%%

