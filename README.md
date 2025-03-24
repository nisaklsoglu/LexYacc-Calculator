# LexYacc-Calculator
Bu proje, Lex (Flex) ve Yacc (Bison) kullanılarak oluşturulmuş basit bir matematiksel hesap makinesidir. Projenin amacı, kullanıcıdan alınan aritmetik ifadeleri işleyerek sonucunu hesaplamaktır. 

---

## **İçindekiler**
- [Tasarım Kararları](#tasarım-kararları)
- [Çalıştırma](#çalıştırma)
- [Kod Açıklaması](#kod-açıklaması)
- [Örnek Kullanımlar](#örnek-kullanımlar)
- [Hata Yönetimi](#hata-yönetimi)

---

## **Tasarım Kararları**
Bu projede Lex ve Yacc kullanılarak matematiksel ifadelerin analiz edilmesi ve yorumlanması hedeflenmiştir. Lex, karakterleri ayrıştırarak anlamlı bileşenlere ayırırken, Yacc bu bileşenleri işleyerek ifadeyi çözümler.

### **Tasarım İlkeleri**
- **Hata Yönetimi**: Geçersiz karakterlerin tespit edilmesi ve sıfıra bölme gibi hataların önlenmesi sağlanmıştır.
- **Kullanıcı Dostu**: Programın temel dört işlem operatörlerini (+, -, *, /) ve parantezleri desteklemesi, kullanımını kolaylaştırmıştır.
- **İşlem Önceliği**: Çarpma ve bölme işlemlerinin toplama ve çıkarmaya göre öncelikli olması sağlanmıştır.

---

## **Çalıştırma**
1. Lex ve Yacc dosyalarını oluşturmak için aşağıdaki komutları çalıştırın:
```sh
flex calculator.l
bison -d calculator.y
```
2. Oluşan C dosyalarını derleyerek çalıştırın:
```sh
gcc lex.yy.c calculator.tab.c -o calculator -lm
./calculator
```
3. Bir matematiksel ifade girerek sonucu görebilirsiniz. Çıkmak için **CTRL+D (Linux/macOS)** veya **CTRL+Z (Windows)** tuş kombinasyonlarını kullanabilirsiniz.

---

## **Kod Açıklaması**
Bu projede Lex, kullanıcıdan alınan girdi üzerinde çalışarak ifadeyi ayrıştırır ve uygun token'leri oluşturur. Yacc ise bu token'leri kullanarak işlem önceliklerine göre ifadeyi işler ve sonucu hesaplar. Projede temel aritmetik operatörler desteklenmiş olup, hata yönetimi de sağlanmıştır. Program, sıfıra bölme gibi kritik hataları tespit ederek kullanıcıya bilgi verir ve işlemi güvenli hale getirir.

---

## **Uygulama Adımları**

**1. calculator.l (Lex Dosyası) Oluşturma**
   Sayılar ve operatörleri tanımlamak için düzenli ifadeler belirlenmiştir.
   Token değerleri atanarak parser’a iletilmesi sağlanmıştır.
   Boşluk karakterleri yok sayılmış ve geçersiz karakterler için hata kontrolü eklenmiştir.

**2. calculator.y (Yacc Dosyası) Oluşturma**
   Aritmetik ifadelerin dilbilgisi kuralları tanımlanmıştır.
   İfadelerin doğru şekilde işlenmesi için eylemler (actions) eklenmiştir.
   Öncelik kuralları eklenerek shift/reduce çakışmaları çözülmüştür.
   Sıfıra bölme hataları tespit edilerek uygun hata mesajları gösterilmiştir.
   İfadelerin anında değerlendirilip ekrana yazdırılması sağlanmıştır.

---

## **Örnek Kullanımlar**
### **Örnek 1: Toplama İşlemi**
#### **Girdi**
```
3 + 5
```
#### **Çıktı**
```
Sonuç: 8
```

### **Örnek 2: Çarpma İşlemi**
#### **Girdi**
```
4 * 2
```
#### **Çıktı**
```
Sonuç: 8
```

### **Örnek 3: Sıfıra Bölme Hatası**
#### **Girdi**
```
10 / 0
```
#### **Çıktı**
```
Hata: Sıfıra bölme hatası!
```
ve program sonlanır.

---

## **Hata Yönetimi**
Bu projede hata yönetimi iki şekilde ele alınmıştır:
- Geçersiz karakterler algılandığında kullanıcıya hata mesajı gösterilir.
- Sıfıra bölme gibi hatalar program tarafından tespit edilir ve kullanıcıya bilgilendirme yapılır.


