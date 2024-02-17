%{
    #include <stdio.h>
    #include <string.h>

    struct symboltable
	{
		char name[100];
		char type[100];
		int length;
	}ST[1001];

	struct constanttable
	{
		char name[100];
		char type[100];
		int length;
	}CT[1001];

    void yyerror(const char* s) {
        fprintf(stderr, "Error: %s\n", s);
    }

    int x = 0, y = 0, z = 0;

    int hash(char *str)
	{
		int value = 0;
		for(int i = 0 ; i < strlen(str) ; i++)
		{
			value = 10 * value + (str[i] - 'A');
			value = value % 1001;
			while(value < 0)
				value = value + 1001;
		}
		return value;
	}

	int lookupST(char *str)
	{
		int value = hash(str);
		if(ST[value].length == 0)
		{
			return 0;
		}
		else if(strcmp(ST[value].name,str)==0)
		{
			return 1;
		}
		else
		{
			for(int i = value + 1 ; i!=value ; i = (i+1)%1001)
	    	{
	    		if(strcmp(ST[i].name,str)==0)
	    		{
	    			return 1;
	    		}
	    	}
	    	return 0;
	    }
	}

	int lookupCT(char *str)
	{
		int value = hash(str);
		if(CT[value].length == 0)
			return 0;
		else if(strcmp(CT[value].name,str)==0)
			return 1;
		else
		{
			for(int i = value + 1 ; i!=value ; i = (i+1)%1001)
			{
				if(strcmp(CT[i].name,str)==0)
				{
					return 1;
				}
			}
			return 0;
		}
	}

	void insertST(char *str1, char *str2)
	{
		if(lookupST(str1))
		{
		    return;
	    }
		else
		{
			int value = hash(str1);
			if(ST[value].length == 0)
			{
				strcpy(ST[value].name,str1);
				strcpy(ST[value].type,str2);
				ST[value].length = strlen(str1);
				return;
			}

			int pos = 0;

			for (int i = value + 1 ; i!=value ; i = (i+1)%1001)
			{
				if(ST[i].length == 0)
				{
					pos = i;
					break;
				}
			}

			strcpy(ST[pos].name,str1);
			strcpy(ST[pos].type,str2);
			ST[pos].length = strlen(str1);
		}
	}

	void insertCT(char *str1, char *str2)
	{
		if(lookupCT(str1))
			return;
		else
		{
			int value = hash(str1);
			if(CT[value].length == 0)
			{
				strcpy(CT[value].name,str1);
				strcpy(CT[value].type,str2);
				CT[value].length = strlen(str1);
				return;
			}

			int pos = 0;

			for (int i = value + 1 ; i!=value ; i = (i+1)%1001)
			{
				if(CT[i].length == 0)
				{
					pos = i;
					break;
				}
			}

			strcpy(CT[pos].name,str1);
			strcpy(CT[pos].type,str2);
			CT[pos].length = strlen(str1);
		}
	}

	void printST()
	{
		for(int i = 0 ; i < 1001 ; i++)
		{
			if(ST[i].length == 0)
			{
				continue;
			}

			printf("%s\t%s\n",ST[i].name, ST[i].type);
		}
	}

	void printCT()
	{
		for(int i = 0 ; i < 1001 ; i++)
		{
			if(CT[i].length == 0)
				continue;

			printf("%s\t%s\n",CT[i].name, CT[i].type);
		}
	}

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
%type<string> DATATYPE NUMERIC_DATATYPE

%token _X _Y _Z 
%token EQ EQEQ LESS MORE LET MET DIF NOT_EQ OR AND NOT
%left '+''-'
%left '*''/'
%right EQ


%%
program: var_type MAIN LEFT_BRACE body return RIGHT_BRACE 
        ;

body: main_declaration
                | variables
                | init_variables
                | if_statement
                ;

var_type: DATATYPE { insertCT($1, "string");}
        | NUMERIC_DATATYPE { insertCT($1, "numeric_datatype");}
        ;

return: 

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
    int main(int argc , char **argv){

		printf("====================================================================\n");

		int i;
		for (i=0;i<1001;i++){
			ST[i].length=0;
			CT[i].length=0;
		}
		
		yyin = fopen(argv[1],"r");
		yylex();
		
		printf("\n\nSYMBOL TABLE\n\n");
		printST();
		printf("\n\nCONSTANT TABLE\n\n");
		printCT();
    }

    int yywrap(){
        return 1;
    }
}
