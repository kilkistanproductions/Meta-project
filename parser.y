%{
#include <stdio.h>

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}

int x = 0, y = 0, z = 0;

int yylex(void);
%}

%union {
    int integer;
    char *string;
}

%union {
    int val;
    int a;
}

%token LEFT_BRACE RIGHT_BRACE LEFT_PARENTH RIGHT_PARENTH UNKNOWN_CHARACTER
%token DATATYPE IDENTIFIER EQUALS INTEGER SEMICOLON STRING NUMERIC_DATATYPE
%token INT MAIN VAR PRINTF IF ELSE ELSEIF
%token<a> _VAR
%token<a> NUM
%type<a> cond
%type<a> then

%token _X _Y _Z 
%token EQ EQEQ LESS MORE LET MET DIF NOT_EQ OR AND NOT
%left '+''-'
%left '*''/'
%right EQ


%%
program: c-type-langueage
        ;

c-type-langueage: main_declaration
                | variables
                | init_variables
                | if_statement
                ;
                
main_declaration: INT MAIN LEFT_BRACE RIGHT_BRACE SEMICOLON
                    {
                        printf("Found a main function!\n");
                    }
                    ;

variables: variable_declaration_char
        | variable_declaration_int
        ;

variable_declaration_char:NUMERIC_DATATYPE IDENTIFIER EQUALS INTEGER SEMICOLON
                        {
                            printf("Numeric variable declaration");
                        }
                        ;

variable_declaration_int:DATATYPE IDENTIFIER EQUALS STRING SEMICOLON
                        {
                            printf("Char type variable declaration");
                        }
                        ;

init_variables:
                _X EQ NUM SEMICOLON { x = $3; }
                _Y EQ NUM SEMICOLON { y = $3; }
                ;

if_statement:
            IF LEFT_PARENTH cond RIGHT_PARENTH LEFT_BRACE then RIGHT_BRACE else_condition
            {
                { if ($3 == 1) { z = $6; } printf("\nz=%d\n", z); }
            }
            ;

else_condition: ELSE LEFT_BRACE then RIGHT_BRACE SEMICOLON { z = $3; }
            | ELSEIF LEFT_PARENTH cond RIGHT_PARENTH LEFT_BRACE then RIGHT_BRACE else_condition { if ($3 == 1) { z = $6; } }
            ;

then: _Z EQ NUM SEMICOLON { $$ = $3; }
    ;

cond: _X LESS NUM          { if (x < $3) { $$ = 1; } else { $$ = 0; } }
    | _X MORE NUM          { if (x > $3) { $$ = 1; } else { $$ = 0; } }
    | _X EQEQ NUM          { if (x == $3) { $$ = 1; } else { $$ = 0; } }
    | _X NOT_EQ NUM        { if (x != $3) { $$ = 1; } else { $$ = 0; } }

    | _X LESS _VAR         { if (x < $3) { $$ = 1; } else { $$ = 0; } }
    | _X MORE _VAR         { if (x > $3) { $$ = 1; } else { $$ = 0; } }
    | _X EQEQ _VAR         { if (x == $3) { $$ = 1; } else { $$ = 0; } }
    | _X NOT_EQ _VAR       { if (x != $3) { $$ = 1; } else { $$ = 0; } }

    | _Y LESS NUM          { if (y < $3) { $$ = 1; } else { $$ = 0; } }
    | _Y MORE NUM          { if (y > $3) { $$ = 1; } else { $$ = 0; } }
    | _Y EQEQ NUM          { if (y == $3) { $$ = 1; } else { $$ = 0; } }
    | _Y NOT_EQ NUM        { if (y != $3) { $$ = 1; } else { $$ = 0; } }

    | _Y LESS _VAR         { if (y < $3) { $$ = 1; } else { $$ = 0; } }
    | _Y MORE _VAR         { if (y > $3) { $$ = 1; } else { $$ = 0; } }
    | _Y EQEQ _VAR         { if (y == $3) { $$ = 1; } else { $$ = 0; } }
    | _Y NOT_EQ _VAR       { if (y != $3) { $$ = 1; } else { $$ = 0; } }
    ;
%%

int main() {
    yyparse();
    return 0;
}
