%{
    #include <stdio.h>
    #include <stdlib.h>
    void yyerror(char *);
    int yylex(void);

    int sym[52];
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
