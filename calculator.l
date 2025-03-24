%{
#include "calculator.tab.h"
#include <stdlib.h>
#include <stdio.h>   // Standart çıktı için gerekli
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; } // Rakam dizilerini algılar
[ \t\n]+    { /* Boşlukları yok say */ } 
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIVIDE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
.           { printf("Hata: Geçersiz karakter: %s\n", yytext); return 0; }
%%

int yywrap() { return 1; }  // Lex’in dosyanın sonuna ulaştığını belirtmek için eklenmeli
