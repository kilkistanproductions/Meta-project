%{
#include <stdio.h>
#include "parser.tab.h"  // Bison-generated header file
%}

%%
"char"       {printf("%s \t- DATATYPE\n", yytext) ;return DATATYPE; }
"float"      {printf("%s \t- DATATYPE\n", yytext) ;return DATATYPE; }
"int"        {printf("%s \t- DATATYPE\n", yytext) ;return DATATYPE; }
"double"     {printf("%s \t- DATATYPE\n", yytext) ;return DATATYPE; }
"long"       {printf("%s \t- DATATYPE\n", yytext) ;return DATATYPE; }
"short"      {printf("%s \t- DATATYPE\n", yytext) ;return DATATYPE; }
"signed"     {printf("%s \t- DATATYPE\n", yytext) ;return DATATYPE; }
"unsigned"   {printf("%s \t- DATATYPE\n", yytext) ;return DATATYPE; }

"main"       {printf("%s \t- KEYWORD\n", yytext) ;return MAIN; }
"{"          {printf("%s \t- KEYWORD\n", yytext) ;return LEFT_BRACE; }
"}"          {printf("%s \t- KEYWORD\n", yytext) ;return RIGHT_BRACE; }

;            {printf("%s \t- SEMICOLON DELIMITER\n", yytext); return SEMICOLON;}

"="          {printf("%s \t- EQUAL SIGN\n", yytext); return EQUALS;}

[0-9]+               { yylval.integer = atoi(yytext); return INTEGER; }
[a-zA-Z][a-zA-Z0-9]* { yylval.string = strdup(yytext); return IDENTIFIER; }

[ \t\n]      ;  // Ignore whitespace and newlines
.            {printf("%s \t- KEYWORD\n", yytext) ;return UNKNOWN_CHARACTER; }
%%

int yywrap() {
    return 1;
}
