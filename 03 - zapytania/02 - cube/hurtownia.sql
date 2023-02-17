--iloœc zaliczeñ przeprowadzonych przez danych prowadzacych w danej sali z danych przedmiotow (zestawienie)
SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    nvl(to_char(zaliczenie_h.zaliczenie_id), 'WSZYSTKO') AS "ID_ZALICZENIA",
    nvl(to_char(zaliczenie_h.prowadzacy_id), 'WSZYSCY PROWADZACY') AS "PROWADZACY",
    nvl(to_char(zaliczenie_h.sala_id), 'WSZYSTKIE SALE') AS "SALA",
    nvl(to_char(zaliczenie_h.przedmiot_id), 'WSZYSTKIE PRZEDMIOTY') AS "PRZEDMIOT"
FROM
    zaliczenie_h
GROUP BY
    CUBE(zaliczenie_h.zaliczenie_id,
         zaliczenie_h.prowadzacy_id,
         zaliczenie_h.sala_id,
         zaliczenie_h.przedmiot_id)
);
SET TIMING OFF;
--œrednia ocen studentow u danego prowadzacego z przedmiotow

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    nvl(to_char(zaliczenie_h.student_id), 'DLA WSZYSTKICH') AS "ID_STUDENTA",
    nvl(to_char(zaliczenie_h.prowadzacy_id), 'WSZYSCY') AS "PROWADZACY",
    nvl(to_char(zaliczenie_h.przedmiot_id), 'WSZYSTKIE PRZEDMIOTY') AS "PRZEDMIOT",
    round(AVG(ocena), 2) AS "SREDNIA_OCEN"
FROM
    zaliczenie_h
GROUP BY
    CUBE(zaliczenie_h.student_id,
         zaliczenie_h.prowadzacy_id,
         zaliczenie_h.przedmiot_id)
);
SET TIMING OFF;
--œrednio iloœæ punktów ECTS u studentów z danych grup 

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    nvl(to_char(zaliczenie_h.student_id), 'DLA WSZYSTKICH') AS "ID_STUDENTA",
    nvl(to_char(zaliczenie_h.grupa_ID), 'WSZYSTKIE GRUPY') AS "GRUPA",
    round(AVG(punkty_ects), 2) AS "SREDNIA_PUNKTOW"
FROM
    zaliczenie_h JOIN przedmiot_h ON przedmiot_h.przedmiot_id = zaliczenie_h.przedmiot_id
GROUP BY
    CUBE(zaliczenie_h.student_id,
         zaliczenie_h.grupa_ID)
);
SET TIMING OFF;