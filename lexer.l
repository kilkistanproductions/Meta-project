%{
#include <stdio.h>
#include "parser.tab.h"  // Bison-generated header file
%}

%%
"int"        { printf("%s \t- KEYWORD\n", yytext); return INT; }
"main"       { printf("%s \t- KEYWORD\n", yytext); return MAIN; }
"{"          { printf("%s \t- KEYWORD\n", yytext); return LEFT_BRACE; }
"}"          { printf("%s \t- KEYWORD\n", yytext); return RIGHT_BRACE; }
"printf"     { printf("%s \t- KEYWORD\n", yytext); return PRINTF; }
"if"         { printf("%s \t- KEYWORD\n", yytext); return IF; }
"else"       { printf("%s \t- KEYWORD\n", yytext); return ELSE; }
"elif"       { printf("%s \t- KEYWORD\n", yytext); return ELSEIF; }
"("          { printf("%s \t- KEYWORD\n", yytext); return LEFT_PARENTH; }
")"          { printf("%s \t- KEYWORD\n", yytext); return RIGHT_PARENTH; }
"<"          { printf("%s \t- OPERATOR\n", yytext); return LESS; }          
">"          { printf("%s \t- OPERATOR\n", yytext); return MORE; }
"<="         { printf("%s \t- OPERATOR\n", yytext); return LET; }
">="         { printf("%s \t- OPERATOR\n", yytext); return MET; }
"<>"         { printf("%s \t- OPERATOR\n", yytext); return DIF; }
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
[-]?[0-9]+   { yylval.val = atoi(yytext); return NUM; }
[A-Za-z0-9]* { printf("%s \t- VARIABLE\n", yytext); return VAR; }
[ \t\n]      ;  // Ignore whitespace and newlines
.            { printf("%s \t- KEYWORD\n", yytext); return UNKNOWN_CHARACTER; } 
%%

int yywrap() {
    return 1;
}
