%{
#include <stdio.h>

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}
int x = 0,y = 0,z = 0;
int yylex(void);
%}

%token LEFT_BRACE RIGHT_BRACE LEFT_PARENTH RIGHT_PARENTH UNKNOWN_CHARACTER
%token INT MAIN VAR SEMICOLON PRINTF
%token<val> NUM
%token EQ LESS MORE LET MET DIF NOT_EQ OR AND NOT
%token IF ELSE ELSEIF
%left '+''-'
%left '*''/'
%right '='
%%

program:main_declaration
        |if_statement
        |else_statment
        |else_if_statment
        ;

main_declaration:INT MAIN LEFT_BRACE RIGHT_BRACE
                    {
                        printf("Found a main function!\n");
                    }
                    ;
if_statement:
            IF LEFT_PARENTH exp RIGHT_PARENTH LEFT_BRACE then RIGHT_BRACE
            |IF LEFT_PARENTH exp RIGHT_PARENTH then
            |IF LEFT_PARENTH exp RIGHT_PARENTH LEFT_BRACE then RIGHT_BRACE
            |IF LEFT_PARENTH exp RIGHT_PARENTH LEFT_BRACE then RIGHT_BRACE ELSE LEFT_BRACE then RIGHT_BRACE
            ;            
else_if_statment: ELSEIF LEFT_PARENTH exp RIGHT_PARENTH LEFT_BRACE then RIGHT_BRACE
                ;
else_statment: ELSE LEFT_BRACE then RIGHT_BRACE
            ;
exp:
    NUM EQ NUM          {if( $1 == $3 ){$$ = 1;} else{$$ = 0;}}
    |NUM NOT_EQ NUM     {if( $1 != $3) {$$ = 1;} else{$$ = 0;}}
    |NOT NUM            {if( !$2 )     {$$ = 1;} else{$$ = 0;}}
    |NUM MET NUM        {if( $1 >= $3 ){$$ = 1;} else{$$ = 0;}}
    |NUM LET NUM        {if( $1 <= $3 ){$$ = 1;} else{$$ = 0;}}
    |NUM LESS NUM       {if( $1 < $3 ) {$$ = 1;} else{$$ = 0;}}
    |NUM MORE NUM       {if( $1 > $3 ) {$$ = 1;} else{$$ = 0;}}
    |NUM OR NUM         {if( $1 || $3) {$$ = 1;} else{$$ = 0;}}
    |NUM AND NUM        {if( $1 && $3) {$$ = 1;} else{$$ = 0;}}
    |VAR EQ VAR         {if( $1 == $3 ){$$ = 1;} else{$$ = 0;}}
    |VAR NOT_EQ VAR     {if( $1 != $3 ){$$ = 1;} else{$$ = 0;}}
    |NOT VAR            {if(!$2)       {$$ = 1;} else{$$ = 0;}}
    |VAR MET VAR        {if( $1 >= $3 ){$$ = 1;} else{$$ = 0;}}
    |VAR LET VAR        {if( $1 <= $3) {$$ = 1;} else{$$ = 0;}}
    |VAR LESS VAR       {if( $1 < $3 ) {$$ = 1;} else{$$ = 0;}}
    |VAR MORE VAR       {if( $1 > $3 ) {$$ = 1;} else{$$ = 0;}}
    |VAR OR VAR         {if( $1 || $3 ){$$ = 1;} else{$$ = 0;}}
    |VAR AND VAR        {if( $1 && $3 ){$$ = 1;} else{$$ = 0;}}
    ;
then:
    if(exp){}
    ;
%%

int main() {
    yyparse();
    return 0;
}
