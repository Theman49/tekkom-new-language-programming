    /* kalkulator sederhana */
%{
	/* import library yang dibutuhkan  */
    #include "kalkulator.tab.h"		/* dihasilkan setelah men-compile kalkulator.y  */
    #include <stdlib.h>			/* standard library C */
    #include <stdio.h>
    void yyerror(char *);		/* fungsi untuk menampilkan warning ketika terjadi error  */
%}

%%
	/* cetak */
"cetak"		{ return cetak;  }
	/* keluar  */
"keluar"	{ return perintah_keluar; }
	/* variables */
[a-zA-Z]+       {
                yylval = *yytext;
                return VARIABLE;
                }

	/* integers */
[0-9]+      {
                yylval = atoi(yytext);
                return INTEGER;
            }

	/* operators  */
[-+()=/*^\n]     { return *yytext; }

	/* skip whitespace  */
[ \t]   ;       /* skip whitespace */

	/* anything else is an error  */
.               yyerror("karakter tidak sesuai");

%%

int yywrap(void) {
    return 1;
}
