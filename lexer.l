%{
#include <stdio.h>
#include "parser.tab.h"  // Bison-generated header file
#include"y.tab.h"
%}

%%
"int"        {printf("%s \t- KEYWORD\n", yytext) ;return INT; }
"main"       {printf("%s \t- KEYWORD\n", yytext) ;return MAIN; }
"{"          {printf("%s \t- KEYWORD\n", yytext) ;return LEFT_BRACE; }
"}"          {printf("%s \t- KEYWORD\n", yytext) ;return RIGHT_BRACE; }
[ \t\n]      ;  // Ignore whitespace and newlines
.            {printf("%s \t- KEYWORD\n", yytext) ;return UNKNOWN_CHARACTER; }
[\t ]   ; /*ignore white spaces*/

"while"   {return WHILE;}

"for"   {return FOR;}

[a-zA-Z]+  {return VAR;}

[0-9]+     {return NUMBER;}

'$'    {return 0;}

'\n'   {return '\n' ;}

.      {return yytext[0];}
%%

int yywrap() {
    return 1;
}