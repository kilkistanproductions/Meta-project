%{
#include <stdio.h>
#include <string.h>
#include "parser.tab.h"  // Bison-generated header file
%}

%%
"char"       { printf("%s \t- DATATYPE\n", yytext); return DATATYPE; }
"string"     { printf("%s \t- DATATYPE\n", yytext); return DATATYPE; }
"float"      { printf("%s \t- NUMERIC_DATATYPE\n", yytext); return NUMERIC_DATATYPE; }
"int"        { printf("%s \t- NUMERIC_DATATYPE\n", yytext); return NUMERIC_DATATYPE; }
"double"     { printf("%s \t- NUMERIC_DATATYPE\n", yytext); return NUMERIC_DATATYPE; }
"long"       { printf("%s \t- NUMERIC_DATATYPE\n", yytext); return NUMERIC_DATATYPE; }
"short"      { printf("%s \t- NUMERIC_DATATYPE\n", yytext); return NUMERIC_DATATYPE; }
"signed"     { printf("%s \t- NUMERIC_DATATYPE\n", yytext); return NUMERIC_DATATYPE; }
"unsigned"   { printf("%s \t- NUMERIC_DATATYPE\n", yytext); return NUMERIC_DATATYPE; }

"main"       { printf("%s \t- KEYWORD\n", yytext); return MAIN; }
"{"          { printf("%s \t- KEYWORD\n", yytext); return LEFT_BRACE; }
"}"          { printf("%s \t- KEYWORD\n", yytext); return RIGHT_BRACE; }
"("          { printf("%s \t- KEYWORD\n", yytext); return LEFT_PARENTH; }
")"          { printf("%s \t- KEYWORD\n", yytext); return RIGHT_PARENTH; }

"printf"     { printf("%s \t- KEYWORD\n", yytext); return PRINTF; }
"if"         { printf("%s \t- KEYWORD\n", yytext); return IF; }
"else"       { printf("%s \t- KEYWORD\n", yytext); return ELSE; }
"elseif"     { printf("%s \t- KEYWORD\n", yytext); return ELSEIF; }

"<"          { printf("%s \t- OPERATOR\n", yytext); return LESS; }          
">"          { printf("%s \t- OPERATOR\n", yytext); return MORE; }
"<="         { printf("%s \t- OPERATOR\n", yytext); return LET; }
">="         { printf("%s \t- OPERATOR\n", yytext); return MET; }
"=="         { printf("%s \t- OPERATOR\n", yytext); return EQEQ; }
"="          { printf("%s \t- OPERATOR\n", yytext); return EQ; }
"!="         { printf("%s \t- OPERATOR\n", yytext); return NOT_EQ; }
"||"         { printf("%s \t- OPERATOR\n", yytext); return OR; }
"&&"         { printf("%s \t- OPERATOR\n", yytext); return AND; }
"!"          { printf("%s \t- OPERATOR\n", yytext); return NOT; }

"x"          { return _X; }
"y"          { return _Y; }
"z"          { return _Z; }
";"          { return SEMICOLON; }

[-]?[0-9]+   { yylval.integer = atoi(yytext); return NUM; }

[A-Za-z][a-zA-Z0-9]* { printf("%s \t- VARIABLE\n", yytext); yylval.string = strdup(yytext); return VAR; }

[ \t\n]      ;  // Ignore whitespace and newlines
.            { printf("%s \t- UNKNOWN CHARACTER\n", yytext); return UNKNOWN_CHARACTER; } 
%%

int yywrap() {
    return 1;
}
