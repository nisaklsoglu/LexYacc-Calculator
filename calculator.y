%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s); //hata mesajlarını göstermek için tanımlanır.
int yylex(void); //fonksiyonu, Lex tarafından sağlanan token’leri almak için çağrılır.
%}

/* Operatör Öncelik ve Bağlanma Kuralları */
%left PLUS MINUS //+ ve - işlemleri eşit önceliklidir ve soldan bağlanır.
%left TIMES DIVIDE //* ve / işlemleri de aynı şekilde eşit önceliklidir ama + ve -'ten daha yüksek önceliğe sahiptir.

%token NUMBER //Sayıları temsil eder.
%token PLUS MINUS TIMES DIVIDE //Dört işlem operatörlerini temsil eder.
%token LPAREN RPAREN //Parantezleri temsil eder.

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
    yyparse(); //fonksiyonunu çağırarak ifadeyi işler.
    return 0;
}
