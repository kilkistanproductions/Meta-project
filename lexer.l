%{
#include <stdio.h>
#include "parser.tab.h"  // Bison-generated header file
%}

%%
"int"        {printf("%s \t- KEYWORD\n", yytext) ;return INT; }
"main"       {printf("%s \t- KEYWORD\n", yytext) ;return MAIN; }
"{"          {printf("%s \t- KEYWORD\n", yytext) ;return LEFT_BRACE; }
"}"          {printf("%s \t- KEYWORD\n", yytext) ;return RIGHT_BRACE; }
[ \t\n]      ;  // Ignore whitespace and newlines
.            {printf("%s \t- KEYWORD\n", yytext) ;return UNKNOWN_CHARACTER; }
%%

int yywrap() {
    return 1;
}