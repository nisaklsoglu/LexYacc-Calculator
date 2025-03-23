%{
#include "calculator.tab.h"
#include <stdlib.h>
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t\n]+    { /* Boşlukları yok say */ }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIVIDE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
.           { printf("Hata: Geçersiz karakter: %s\n", yytext); return 0; }
%%
