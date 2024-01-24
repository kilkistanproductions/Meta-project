%{
#include <stdio.h>
#include "parser.tab.h"  // Bison-generated header file
%}

%%
"char"       {printf("%s \t- DATATYPE\n", yytext) ;return DATATYPE; }
"string"      {printf("%s \t- DATATYPE\n", yytext) ;return DATATYPE; }
"float"      {printf("%s \t- NUMERIC_DATATYPE\n", yytext) ;return NUMERIC_DATATYPE; }
"int"        {printf("%s \t- NUMERIC_DATATYPE\n", yytext) ;return NUMERIC_DATATYPE; }
"double"     {printf("%s \t- NUMERIC_DATATYPE\n", yytext) ;return NUMERIC_DATATYPE; }
"long"       {printf("%s \t- NUMERIC_DATATYPE\n", yytext) ;return NUMERIC_DATATYPE; }
"short"      {printf("%s \t- NUMERIC_DATATYPE\n", yytext) ;return NUMERIC_DATATYPE; }
"signed"     {printf("%s \t- NUMERIC_DATATYPE\n", yytext) ;return NUMERIC_DATATYPE; }
"unsigned"   {printf("%s \t- NUMERIC_DATATYPE\n", yytext) ;return NUMERIC_DATATYPE; }

"main"       {printf("%s \t- KEYWORD\n", yytext) ;return MAIN; }
"{"          {printf("%s \t- KEYWORD\n", yytext) ;return LEFT_BRACE; }
"}"          {printf("%s \t- KEYWORD\n", yytext) ;return RIGHT_BRACE; }

;            {printf("%s \t- SEMICOLON DELIMITER\n", yytext); return SEMICOLON;}

"="          {printf("%s \t- EQUAL SIGN\n", yytext); return EQUALS;}

[a-zA-Z][a-zA-Z0-9]*    {printf("%s \t- IDENTIFIER\n", yytext); yylval.string = strdup(yytext); return IDENTIFIER; }
[0-9]+                  { yylval.integer = atoi(yytext); return INTEGER; }
\"[^\"\n]*\"            { yylval.string = strdup(yytext); return STRING; }              

[ \t\n]      ;  // Ignore whitespace and newlines
.            {printf("%s \t- KEYWORD\n", yytext) ;return UNKNOWN_CHARACTER; }
%%

int yywrap() {
    return 1;
}
