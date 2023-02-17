INSERT INTO grupa_h(grupa_ID, nazwa_grupy)
SELECT grupa_ID, nazwa_grupy
FROM grupkka;

INSERT INTO student_h(student_ID, imie, nazwisko, PESEL, plec)
SELECT student_ID, imie, nazwisko, pesel, plec
FROM studentt;

INSERT INTO termin_zaliczenia_h(termin_ID, termin_zaliczenia, numer_podejscia)
SELECT termin_ID, termin_zaliczenia, numer_podejscia
FROM termin_zaliczenia;

INSERT INTO sala_h(sala_ID, numer_sali)
SELECT sala_ID, numer_sali
FROM sala;

INSERT INTO przedmiot_h(przedmiot_ID, nazwa_przedmiotu, punkty_ECTS, typ_przedmiotu)
SELECT przedmiot_ID, nazwa_przedmiotu, punkty_ECTS, typ_przedmiotu
FROM przedmiotek;

INSERT INTO prowadzacy_h(prowadzacy_ID, imie_prowadzacego, nazwisko_prowadzacego, PESEL_prowadzacego)
SELECT prowadzacy_ID, imie_prowadzacego, nazwisko_prowadzacego, PESEL_prowadzacego
FROM prowadzacy;
--
CREATE OR REPLACE PROCEDURE zaliczenie_loader
IS
CURSOR zaliczenie_kursor IS
SELECT 
Z.zaliczenie_ID AS zaliczenie_ID, 
Z.data_zaliczenia AS data_zaliczenia, 
Z.ocena AS ocena, 
Z.forma_zaliczenia AS forma_zaliczenia, 
Z.termin_ID AS termin_ID, 
Z.sala_ID AS sala_ID, 
Z.przedmiot_ID AS przedmiot_ID, 
Z.student_ID AS student_ID, 
SP.prowadzacy_ID AS prowadzacy_ID,
S.grupa_ID AS grupa_ID
FROM 
zaliczenie Z 
JOIN stopien_prowadzacego SP ON SP.stopien_prowadzacego_ID=Z.stopien_prowadzacego_ID
--JOIN prowadzacy P ON P.prowadzacy_ID=SP.prowadzacy_ID
JOIN studentt S ON S.student_ID=Z.student_ID; 
--JOIN grupkka G ON G.grupa_ID=S.grupa_ID;
BEGIN
FOR z in zaliczenie_kursor LOOP
INSERT INTO zaliczenie_h(zaliczenie_ID,data_zaliczenia,ocena,forma_zaliczenia,termin_ID,sala_ID,przedmiot_ID,student_ID,prowadzacy_ID,grupa_ID)
VALUES (
z.zaliczenie_ID,
z.data_zaliczenia, 
z.ocena, 
z.forma_zaliczenia, 
z.termin_ID, 
z.sala_ID, 
z.przedmiot_ID, 
z.student_ID, 
z.prowadzacy_ID, 
z.grupa_ID
);
END LOOP;
END;
CALL zaliczenie_loader();

