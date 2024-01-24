%{
#include <stdio.h>

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}

int yylex(void);
%}

%union {
    int integer;
    char *string;
}

%token INT MAIN LEFT_BRACE RIGHT_BRACE UNKNOWN_CHARACTER
%token DATATYPE IDENTIFIER EQUALS INTEGER SEMICOLON STRING NUMERIC_DATATYPE
 
%%

program: c-type-langueage
        ;

c-type-langueage: main_declaration
                | variables
                
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
%%

int main() {
    yyparse();
    return 0;
}
