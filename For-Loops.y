%{
#include<stdio.h>
/parser for counting for loops/
extern int yyerror(char* error);
int for_count=0;
extern int yylex();
%}

%token NUMBER
%token VAR
%token FOR
%%

statement_list : /* empty */
        | statement_list statement opt_newlines '\n'
                ;
statement  :
        for_stmt '\n''{' statement_list '}'
            | VAR '=' NUMBER ';'
        ;
for_stmt :
        FOR '('condition')'     {for_count++;}
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
    printf("for count:%d\n",for_count);
}

int yyerror(char *s){
    printf("Error:%s\n",s);
    return 1;
}
