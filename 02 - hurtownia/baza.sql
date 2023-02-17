DROP TABLE zaliczenie_h;
DROP TABLE grupa_h;
DROP TABLE prowadzacy_h;
DROP TABLE student_h;
DROP TABLE przedmiot_h;
DROP TABLE sala_h;
DROP TABLE termin_zaliczenia_h;

CREATE TABLE termin_zaliczenia_h (termin_ID NUMBER(2) CONSTRAINT termin_h_pk PRIMARY KEY, 
termin_zaliczenia DATE, numer_podejscia NUMBER(1));
--
CREATE TABLE sala_h (sala_ID NUMBER(2) CONSTRAINT sala_h_pk PRIMARY KEY, numer_sali VARCHAR(10));
--
CREATE TABLE przedmiot_h (przedmiot_ID NUMBER(2) CONSTRAINT przedmiot_h_pk PRIMARY KEY, 
nazwa_przedmiotu VARCHAR2(100), punkty_ECTS NUMBER(2) NOT NULL, typ_przedmiotu VARCHAR(3) NOT NULL);
--
CREATE TABLE student_h (student_ID NUMBER(3) CONSTRAINT student_h_pk PRIMARY KEY, imie VARCHAR(20), 
nazwisko VARCHAR(20), PESEL NUMBER(9), plec VARCHAR(1) NOT NULL);
--
CREATE TABLE prowadzacy_h (prowadzacy_ID NUMBER(2) CONSTRAINT prowadzacy_h_pk PRIMARY KEY, 
imie_prowadzacego VARCHAR2(20), nazwisko_prowadzacego VARCHAR2(20), PESEL_prowadzacego NUMBER(9));
--
CREATE TABLE grupa_h (grupa_ID NUMBER(2) CONSTRAINT grupa_h_pk PRIMARY KEY, nazwa_grupy VARCHAR(10));
--
CREATE TABLE zaliczenie_h (zaliczenie_ID NUMBER(6) CONSTRAINT zaliczenie_h_pk PRIMARY KEY,
data_zaliczenia DATE, 
ocena NUMBER(1), 
forma_zaliczenia VARCHAR(20), 
termin_ID NUMBER(2), 
sala_ID NUMBER(2), 
przedmiot_ID NUMBER(2), 
student_ID NUMBER(3), 
prowadzacy_ID NUMBER(2), 
grupa_ID NUMBER(2),
CONSTRAINT termin_h_fk FOREIGN KEY (termin_ID) REFERENCES termin_zaliczenia_h(termin_ID),
CONSTRAINT sala_h_fk FOREIGN KEY (sala_ID) REFERENCES sala_h(sala_ID),
CONSTRAINT przedmiot_h_fk FOREIGN KEY (przedmiot_ID) REFERENCES przedmiot_h(przedmiot_ID),
CONSTRAINT student_h_fk FOREIGN KEY (student_ID) REFERENCES student_h(student_ID),
CONSTRAINT prowadzacy_h_fk FOREIGN KEY (prowadzacy_ID) REFERENCES prowadzacy_h(prowadzacy_ID),
CONSTRAINT grupa_h_fk FOREIGN KEY (grupa_ID) REFERENCES grupa_h(grupa_ID)
);

SELECT * FROM zaliczenie_h
ORDER BY termin_ID;