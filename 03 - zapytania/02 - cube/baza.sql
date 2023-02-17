--iloœc zaliczeñ przeprowadzonych przez danych prowadzacych w danej sali z danych przedmiotow (zestawienie)
SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    nvl(to_char(zaliczenie.zaliczenie_id), 'WSZYSTKO') AS "ID_ZALICZENIA",
    nvl(to_char(prowadzacy.prowadzacy_id), 'WSZYSCY PROWADZACY') AS "PROWADZACY",
    nvl(to_char(sala.sala_id), 'WSZYSTKIE SALE') AS "SALA",
    nvl(to_char(przedmiotek.przedmiot_id), 'WSZYSTKIE PRZEDMIOTY') AS "PRZEDMIOT"
FROM
    zaliczenie
    JOIN przedmiotek ON przedmiotek.przedmiot_id = zaliczenie.przedmiot_id
    JOIN sala ON sala.sala_id = zaliczenie.sala_id
    JOIN stopien_prowadzacego ON stopien_prowadzacego.stopien_prowadzacego_id = zaliczenie.stopien_prowadzacego_id
    JOIN prowadzacy ON prowadzacy.prowadzacy_id = stopien_prowadzacego.prowadzacy_id
GROUP BY
    CUBE(zaliczenie.zaliczenie_id,
         prowadzacy.prowadzacy_id,
         sala.sala_id,
         przedmiotek.przedmiot_id)
);
SET TIMING OFF;
--œrednia ocen studentow u danego prowadzacego z przedmiotow

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    nvl(to_char(studentt.student_id), 'DLA WSZYSTKICH') AS "ID_STUDENTA",
    nvl(to_char(prowadzacy.prowadzacy_id), 'WSZYSCY') AS "PROWADZACY",
    nvl(to_char(przedmiotek.przedmiot_id), 'WSZYSTKIE PRZEDMIOTY') AS "PRZEDMIOT",
    round(AVG(ocena), 2) AS "SREDNIA_OCEN"
FROM
    zaliczenie
    JOIN stopien_prowadzacego ON stopien_prowadzacego.stopien_prowadzacego_id = zaliczenie.stopien_prowadzacego_id
    JOIN prowadzacy ON prowadzacy.prowadzacy_id = stopien_prowadzacego.prowadzacy_id
    JOIN przedmiotek ON przedmiotek.przedmiot_id = zaliczenie.przedmiot_id
    JOIN studentt ON studentt.student_id = zaliczenie.student_id
GROUP BY
    CUBE(studentt.student_id,
         prowadzacy.prowadzacy_id,
         przedmiotek.przedmiot_id)
);
SET TIMING OFF;
--œrednio iloœæ punktów ECTS u studentów z danych grup 

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    nvl(to_char(studentt.student_id), 'DLA WSZYSTKICH') AS "ID_STUDENTA",
    nvl(to_char(grupkka.grupa_ID), 'WSZYSTKIE GRUPY') AS "GRUPA",
    round(AVG(punkty_ects), 2) AS "SREDNIA_PUNKTOW"
FROM
    zaliczenie
    JOIN studentt ON studentt.student_id = zaliczenie.student_id
    JOIN grupkka ON grupkka.grupa_id = studentt.grupa_id
    JOIN przedmiotek ON przedmiotek.przedmiot_id = zaliczenie.przedmiot_id
GROUP BY
    CUBE(studentt.student_id,
         grupkka.grupa_ID)
);
SET TIMING OFF;