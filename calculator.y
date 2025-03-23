%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

/* Operatör Öncelik ve Bağlanma Kuralları */
%left PLUS MINUS
%left TIMES DIVIDE

%token NUMBER
%token PLUS MINUS TIMES DIVIDE LPAREN RPAREN

%%

expr:
      expr PLUS expr    { $$ = $1 + $3; printf("Sonuç: %d\n", $$); }
    | expr MINUS expr   { $$ = $1 - $3; printf("Sonuç: %d\n", $$); }
    | expr TIMES expr   { $$ = $1 * $3; printf("Sonuç: %d\n", $$); }
    | expr DIVIDE expr  { 
                          if ($3 == 0) {
                              printf("Hata: Sıfıra bölme hatası!\n");
                              exit(1);
                          } else {
                              $$ = $1 / $3;
                              printf("Sonuç: %d\n", $$);
                          }
                        }
    | LPAREN expr RPAREN { $$ = $2; }
    | NUMBER            { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Hata: %s\n", s);
}

int main() {
    printf("Bir matematiksel ifade girin (CTRL+D ile çıkabilirsiniz):\n");
    yyparse();
    return 0;
}
