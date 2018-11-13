%{

#include <math.h>
#include <stdio.h>
#include <ctype.h>
%}

%union
{
    float f;
}
%type <f> exp
%token <f> NUM

%left '+' '-'
%left '*' '/'
%left '^'

%%

input:    /* vacío */
        | input line
;

line:     '\n'
        | exp '\n'  { printf ("\t %f\n", $1); }
;

exp:      NUM              { $$ = $1;         }
        | exp '+' exp      { $$ = $1 + $3;    }
        | exp '-' exp      { $$ = $1 - $3;    }
        | exp '*' exp      { $$ = $1 * $3;    }
        | exp '/' exp      { $$ = $1 / $3;    }
        | exp '^' exp      { $$ = pow ($1, $3); }
        | '(' exp ')'      { $$= $2 ;}

;
%%

yyerror (s)  /* Llamada por yyparse ante un error */
     char *s;
{
  printf ("%s\n", s);
}

main ()
{
  yyparse ();
}
