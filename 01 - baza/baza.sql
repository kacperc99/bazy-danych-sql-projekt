DROP TABLE zaliczenie;
DROP TABLE sala;
DROP TABLE termin_zaliczenia;
DROP TABLE studentt;
DROP TABLE grupkka;
DROP TABLE kraj_pochodzenia;
DROP TABLE region_zamieszkania;
DROP TABLE stopien_prowadzacego;
DROP TABLE prowadzacy;
DROP TABLE stopien_naukowy;
DROP TABLE przedmiot_na_studiach;
DROP TABLE przedmiotek;
DROP TABLE specjalizacja_na_semestrze;
DROP TABLE semestr;
DROP TABLE specjalizacja;
DROP TABLE kierunek_na_stopniu;
DROP TABLE kierunek;
DROP TABLE stopien_studiow;
DROP TABLE wydzial;
DROP TABLE dziekanat;
DROP TABLE rektorat;
DROP TABLE uczelnia;

CREATE TABLE uczelnia (uczelnia_ID NUMBER(1) CONSTRAINT uczelnia_pk PRIMARY KEY, 
nazwa_uczelni VARCHAR2(100), typ_uczelni VARCHAR2(20));
--
CREATE TABLE rektorat (rektorat_ID NUMBER(2) CONSTRAINT rektorat_pk PRIMARY KEY, 
imie_pracownika_rektoratu VARCHAR2(20), nazwisko_pracownika_rektoratu VARCHAR2(20), 
PESEL_pracownika_rektoratu NUMBER(9), funkcja_pracownika_rektoratu VARCHAR2(30), 
uczelnia_ID NUMBER(1), CONSTRAINT uczelnia_fk1 FOREIGN KEY (uczelnia_ID) REFERENCES uczelnia(uczelnia_ID));
--
CREATE TABLE dziekanat (dziekanat_ID NUMBER(2) CONSTRAINT dziekanat_pk PRIMARY KEY, 
imie_pracownika VARCHAR(20), nazwisko_pracownika VARCHAR(20), PESEL_pracownika NUMBER(9), 
funkcja__pracownika VARCHAR(30), rektorat_ID NUMBER(2), 
CONSTRAINT rektorat_fk2 FOREIGN KEY (rektorat_ID) REFERENCES rektorat(rektorat_ID));
--
CREATE TABLE wydzial (wydzial_ID NUMBER(2) CONSTRAINT wydzialek_pk PRIMARY KEY, nazwa_wydzialu VARCHAR2(100), 
adres_wydzialu VARCHAR2(100), uczelnia_ID NUMBER(1), dziekanat_ID NUMBER(2), 
CONSTRAINT p FOREIGN KEY (uczelnia_ID) REFERENCES uczelnia(uczelnia_ID),
CONSTRAINT q FOREIGN KEY (dziekanat_ID) REFERENCES dziekanat(dziekanat_ID));
--
CREATE TABLE stopien_studiow (stopien_ID NUMBER(2) CONSTRAINT stopien_pk PRIMARY KEY, 
numer_stopnia VARCHAR(20), typ_studiow VARCHAR(20), 
wydzial_ID NUMBER(2), CONSTRAINT wydzial_fk FOREIGN KEY (wydzial_ID) REFERENCES wydzial(wydzial_ID));
--
CREATE TABLE kierunek (kierunek_ID NUMBER(2) CONSTRAINT kierunekek_pk PRIMARY KEY, 
nazwa_kierunku VARCHAR2(100));
--
CREATE TABLE kierunek_na_stopniu (kierunek_ID NUMBER(2), stopien_ID NUMBER(2), 
CONSTRAINT kierunek_fk1 FOREIGN KEY (kierunek_ID) REFERENCES kierunek(kierunek_ID),
CONSTRAINT stopien_fk1 FOREIGN KEY (stopien_ID) REFERENCES stopien_studiow(stopien_ID));
--
CREATE TABLE specjalizacja (specjalizacja_ID NUMBER(2) CONSTRAINT specjalizacja_pk PRIMARY KEY, 
nazwa_specjalizacji VARCHAR2(100), kierunek_ID NUMBER(2),
CONSTRAINT kierunek_fk2 FOREIGN KEY (kierunek_ID) REFERENCES kierunek(kierunek_ID));
--
CREATE TABLE semestr (semestr_ID NUMBER(2) CONSTRAINT semestr_pk PRIMARY KEY, 
numer_semestru NUMBER(1) NOT NULL, wymagane_punkty_ECTS NUMBER(3) NOT NULL, 
status_zaliczenia_semestru VARCHAR(1) NOT NULL);
--
CREATE TABLE specjalizacja_na_semestrze (specjalizacja_ID NUMBER(2), semestr_ID NUMBER(2), 
CONSTRAINT specjalizacja_fk FOREIGN KEY (specjalizacja_ID) REFERENCES specjalizacja(specjalizacja_ID), 
CONSTRAINT semestr_fk1 FOREIGN KEY (semestr_ID) REFERENCES semestr(semestr_ID));
--
CREATE TABLE przedmiotek (przedmiot_ID NUMBER(2) CONSTRAINT przedmiotek_pk PRIMARY KEY, 
nazwa_przedmiotu VARCHAR2(100), punkty_ECTS NUMBER(2) NOT NULL, typ_przedmiotu VARCHAR(3) NOT NULL, 
semestr_ID NUMBER(2), CONSTRAINT semestr_fk2 FOREIGN KEY (semestr_ID) REFERENCES semestr(semestr_ID));
--
CREATE TABLE przedmiot_na_studiach (przedmiot_ID NUMBER(2), stopien_ID NUMBER(2), 
CONSTRAINT przedmiot1_fk FOREIGN KEY (przedmiot_ID) REFERENCES przedmiotek(przedmiot_ID), 
CONSTRAINT stopien_fk2 FOREIGN KEY (stopien_ID) REFERENCES stopien_studiow(stopien_ID));
--
CREATE TABLE stopien_naukowy (stopien_naukowy_ID NUMBER(1) CONSTRAINT stopien_naukowy_pk PRIMARY KEY, 
nazwa_stopnia VARCHAR2(100));
--
CREATE TABLE prowadzacy (prowadzacy_ID NUMBER(2) CONSTRAINT prowadzacy_pk PRIMARY KEY, 
imie_prowadzacego VARCHAR2(20), nazwisko_prowadzacego VARCHAR2(20), PESEL_prowadzacego NUMBER(9));
--
CREATE TABLE stopien_prowadzacego (stopien_prowadzacego_ID NUMBER(2) CONSTRAINT stopien_prowadzacego_pk PRIMARY KEY, 
stopien_naukowy_ID NUMBER(2), prowadzacy_ID NUMBER(2), 
CONSTRAINT stopien_naukowy_fk FOREIGN KEY (stopien_naukowy_ID) REFERENCES stopien_naukowy(stopien_naukowy_ID), 
CONSTRAINT prowadzacy_fk FOREIGN KEY (prowadzacy_ID) REFERENCES prowadzacy(prowadzacy_ID));
--
CREATE TABLE region_zamieszkania (region_ID NUMBER(2) CONSTRAINT region_pk PRIMARY KEY, 
wojewodztwo VARCHAR(20), powiat VARCHAR(20), gmina VARCHAR(20), miejscowosc VARCHAR(20));
--
CREATE TABLE kraj_pochodzenia (kraj_ID NUMBER(3) CONSTRAINT kraj_pk PRIMARY KEY, nazwa_kraju VARCHAR2(50));
--
CREATE TABLE grupkka (grupa_ID NUMBER(2) CONSTRAINT grupkka_pk PRIMARY KEY, nazwa_grupy VARCHAR(10));
--
CREATE TABLE studentt (student_ID NUMBER(3) CONSTRAINT studentt_pk PRIMARY KEY, imie VARCHAR(20), 
nazwisko VARCHAR(20), PESEL NUMBER(9), plec VARCHAR(1) NOT NULL, 
region_ID NUMBER(2), kraj_ID NUMBER(3), grupa_ID NUMBER(2),
CONSTRAINT region_fk FOREIGN KEY (region_ID) REFERENCES region_zamieszkania(region_ID), 
CONSTRAINT kraj_fk FOREIGN KEY (kraj_ID) REFERENCES kraj_pochodzenia(kraj_ID), 
CONSTRAINT grupa_fk FOREIGN KEY (grupa_ID) REFERENCES grupkka(grupa_ID));
--
CREATE TABLE termin_zaliczenia (termin_ID NUMBER(2) CONSTRAINT termin_pk PRIMARY KEY, 
termin_zaliczenia DATE, numer_podejscia NUMBER(1));
--
CREATE TABLE sala (sala_ID NUMBER(2) CONSTRAINT sala_pk PRIMARY KEY, numer_sali VARCHAR(10));
--
CREATE TABLE zaliczenie (zaliczenie_ID NUMBER(6) CONSTRAINT zaliczenie_pk PRIMARY KEY, data_zaliczenia DATE, 
ocena NUMBER(1), forma_zaliczenia VARCHAR(20), termin_ID NUMBER(2), 
sala_ID NUMBER(2), przedmiot_ID NUMBER(2), student_ID NUMBER(3), stopien_prowadzacego_ID NUMBER(2), 
CONSTRAINT termin_fk FOREIGN KEY (termin_ID) REFERENCES termin_zaliczenia(termin_ID),
CONSTRAINT sala_fk FOREIGN KEY (sala_ID) REFERENCES sala(sala_ID),
CONSTRAINT przedmiot2_fk FOREIGN KEY (przedmiot_ID) REFERENCES przedmiotek(przedmiot_ID),
CONSTRAINT student_fk FOREIGN KEY (student_ID) REFERENCES studentt(student_ID),
CONSTRAINT stopien_prowadzacego_fk FOREIGN KEY (stopien_prowadzacego_ID) REFERENCES stopien_prowadzacego(stopien_prowadzacego_ID));

SELECT * FROM przedmiotek;