/*============================= GROUP BY =====================================

    GROUP BY cümleciği bir SELECT ifadesinde satırları, sutunların değerlerine 
    göre özet olarak GRUPLAMAK için kullanılır. 
   
    GROUP BY cümleceği her grup başına bir satır döndürür. !!! ONEMLI !!! 
	yani neye gore gruplama yapiyorsa sadece o gelir
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonları ile birlikte kullanılır.
==============================================================================*/ 


create table insanlar(
id int primary key,
isim varchar(20),
soyisim varchar(20),
yas int,
cinsiyet char,
sehir varchar(20),
ulke varchar(20),
maas int
);


insert into insanlar values(200, 'Oguz', 'Kagan', '46', 'E', 'Berlin', 'Almanya', '32000');
insert into insanlar values(201, 'Burak', 'Ak', '30', 'E', 'Paris', 'Fransa', '50000');
insert into insanlar values(202, 'Funda', 'Nar', '30', 'K', 'Berlin', 'Almanya', '42000');
insert into insanlar values(203, 'Muhammet', 'Bir', '40', 'E', 'Paris', 'Fransa', '36000');
insert into insanlar values(204, 'Hasan',  'Ozay', '30', 'E', 'Izmir', 'Turkiye', '18000');
insert into insanlar values(205, 'Fatma', 'Yilmaz', '40', 'K', 'Istanbul', 'Turkiye', '20000');
insert into insanlar values(206, 'Resul', 'Demir', '35', 'E', 'Ankara', 'Turkiye', '21000');
insert into insanlar values(207, 'Elif', 'Can', '38', 'K', 'Isparta', 'Turkiye', '19000');
insert into insanlar values(208, 'Sinan', 'Burc', '32', 'E', 'Londra', 'Ingiltere', '60000');
insert into insanlar values(209, 'Hamza', 'Kul', '29', 'E', 'Londra', 'Ingiltere', '63000');
insert into insanlar values(210, 'Aylin', 'Van', '51', 'K', 'Roma', 'Italya', '38000');




select * from insanlar


-- SORU01: ulke'lere göre ortalama yas'ı listeleyiniz 

select ulke, round(avg(yas),2) as ortalama_yas from insanlar group by ulke;


-- SORU02: ulke'lere göre kaç çalışan olduğunu listeleyiniz.

select ulke, count(isim) as calisan_sayisi from insanlar group by ulke;


-- SORU03: cinsiyet'e göre maas ortalamasını listeleyiniz
select cinsiyet,round(avg(maas)) as ortalama_maas from insanlar group by cinsiyet; 


-- SORU04: ulke'lere göre ve sehir'lere göre gruplayarak listeleyiniz
select ulke, sehir from insanlar group by ulke, sehir;


-- SORU05: ulke'lere göre ve sehir'lere göre çalışan sayısını listeleyiniz.
select ulke, sehir, count(isim) as calisan_sayisi from insanlar group by ulke, sehir;


-- SORU06: ulke'lere göre ve cinsiyet'e göre çalışan sayısını ve yas ortalamasını listeleyiniz.
SELECT ulke, cinsiyet, count(isim) as calisan_sayisi, round(avg(yas),2) as ortalama_yas from insanlar group by ulke, cinsiyet;