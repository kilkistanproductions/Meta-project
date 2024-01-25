/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    LEFT_BRACE = 258,              /* LEFT_BRACE  */
    RIGHT_BRACE = 259,             /* RIGHT_BRACE  */
    LEFT_PARENTH = 260,            /* LEFT_PARENTH  */
    RIGHT_PARENTH = 261,           /* RIGHT_PARENTH  */
    UNKNOWN_CHARACTER = 262,       /* UNKNOWN_CHARACTER  */
    DATATYPE = 263,                /* DATATYPE  */
    IDENTIFIER = 264,              /* IDENTIFIER  */
    EQUALS = 265,                  /* EQUALS  */
    INTEGER = 266,                 /* INTEGER  */
    SEMICOLON = 267,               /* SEMICOLON  */
    STRING = 268,                  /* STRING  */
    NUMERIC_DATATYPE = 269,        /* NUMERIC_DATATYPE  */
    INT = 270,                     /* INT  */
    MAIN = 271,                    /* MAIN  */
    VAR = 272,                     /* VAR  */
    PRINTF = 273,                  /* PRINTF  */
    IF = 274,                      /* IF  */
    ELSE = 275,                    /* ELSE  */
    ELSEIF = 276,                  /* ELSEIF  */
    _VAR = 277,                    /* _VAR  */
    NUM = 278,                     /* NUM  */
    _X = 279,                      /* _X  */
    _Y = 280,                      /* _Y  */
    _Z = 281,                      /* _Z  */
    EQ = 282,                      /* EQ  */
    EQEQ = 283,                    /* EQEQ  */
    LESS = 284,                    /* LESS  */
    MORE = 285,                    /* MORE  */
    LET = 286,                     /* LET  */
    MET = 287,                     /* MET  */
    DIF = 288,                     /* DIF  */
    NOT_EQ = 289,                  /* NOT_EQ  */
    OR = 290,                      /* OR  */
    AND = 291,                     /* AND  */
    NOT = 292                      /* NOT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 13 "parser.y"

    int integer;
    char *string;
#line 18 "parser.y"

    int val;
    int a;

#line 110 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
