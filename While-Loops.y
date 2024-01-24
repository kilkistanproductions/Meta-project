%{
#include<stdio.h>
/parser for counting while loops/
extern int yyerror(char* error);
int while_count=0;
extern int yylex();
%}

%token NUMBER
%token VAR
%token WHILE
%token RIGHT_BRACE
%token LEFT_BRACE
%%

statement_list : /* empty */
        | statement_list statement '\n'
                ;
statement  :
        while_stmt '\n''{' statement_list '}'
            | VAR '=' NUMBER ';'
        ;
while_stmt :
        WHILE '('condition')'     {while_count++;}
       ;

condition  :
             VAR cond_op VAR
            ;

cond_op   :  '>'
        | '<'
        | '=''='
            | '!''='
            ;

%%

int main(void){
    yyparse();
    printf("while count:%d\n",while_count);
}

int yyerror(char *s){
    printf("Error:%s\n",s);
    return 1;
}
