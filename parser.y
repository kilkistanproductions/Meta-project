%{
#include <stdio.h>

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}

int yylex(void);
%}

%token INT MAIN LEFT_BRACE RIGHT_BRACE UNKNOWN_CHARACTER

%%

program: main_declaration
        ;

main_declaration: INT MAIN LEFT_BRACE RIGHT_BRACE
                    {
                        printf("Found a main function!\n");
                    }
                    ;

%%

int main() {
    yyparse();
    return 0;
}
