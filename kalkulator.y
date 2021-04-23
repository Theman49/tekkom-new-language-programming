%{
    #include <stdio.h>
    #include <stdlib.h>
    void yyerror(char *);
    int yylex(void);    /* main entry for lex */

<<<<<<< HEAD
    int sym[52];
=======
    int sym[26];    /* hanya dapat menyimpan single-character nama dari variable */
>>>>>>> 5f77a07bb819b791711140513c7fe365081d6726
%}

%token INTEGER VARIABLE
%token cetak perintah_keluar
%left '+' '-'
%left '*' '/'
%left '^'

%%

program:
        program statement '\n'
        | /* NULL */
        ;

statement:
        expression                      { printf("%d\n", $1); }
	| cetak expression		{ printf("Mencetak %d\n", $2); }
	| perintah_keluar		{ exit(EXIT_SUCCESS); } 
        | VARIABLE '=' expression       { sym[$1] = $3; }
        ;

expression:
        INTEGER
        | VARIABLE                      { $$ = sym[$1]; }
        | expression '+' expression     { $$ = $1 + $3; }
        | expression '-' expression     { $$ = $1 - $3; }
        | expression '*' expression     { $$ = $1 * $3; }
        | expression '/' expression     { $$ = $1 / $3; }
	| expression '^' 		{ $$ = $1 * $1; }
        | '(' expression ')'            { $$ = $2; }

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
}
