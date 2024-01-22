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
%token DATATYPE IDENTIFIER EQUALS INTEGER SEMICOLON
 
%%

program: main_declaration
        ;

main_declaration: INT MAIN LEFT_BRACE RIGHT_BRACE SEMICOLON
                    {
                        printf("Found a main function!\n");
                    }
                    ;

program: variable_declaration
        ;

variable_declaration:DATATYPE IDENTIFIER EQUALS INTEGER SEMICOLON
                        {
                            printf("Variable declaration");
                        }
                        ;
%%

int main() {
    yyparse();
    return 0;
}
