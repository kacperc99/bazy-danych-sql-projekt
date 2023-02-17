--ranking osob z zaliczenia z matematyki we wszystkich podejsciach
SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    studentt.student_ID                 AS "ID_STUDENTA",
    termin_zaliczenia.numer_podejscia   AS "NUMER_PODEJSCIA",
    ROUND(AVG(zaliczenie.ocena),3) AS "SREDNIA_OCENA",
    DENSE_RANK() OVER(
        ORDER BY
            AVG(zaliczenie.ocena) DESC
    ) AS "RANKING"
FROM
    zaliczenie
    JOIN studentt ON studentt.student_id = zaliczenie.student_id
    JOIN termin_zaliczenia ON termin_zaliczenia.termin_id = zaliczenie.termin_id
    JOIN przedmiotek ON przedmiotek.przedmiot_ID=zaliczenie.przedmiot_ID
    WHERE przedmiotek.przedmiot_ID=1
GROUP BY
    studentt.student_ID,
    termin_zaliczenia.numer_podejscia);

SET TIMING OFF;
--ranking prowadzacych ze wzgledu na srednia ocen w grupach

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    prowadzacy.prowadzacy_ID           AS "PROWADZACY",
    ROUND(AVG(zaliczenie.ocena),3)              AS "SREDNIA_OCENA",
    grupkka.grupa_ID                   AS "ID_GRUPY",
    DENSE_RANK() OVER(
        ORDER BY
            AVG(zaliczenie.ocena) DESC
    ) AS "RANKING"
FROM
    zaliczenie
    JOIN stopien_prowadzacego ON stopien_prowadzacego.stopien_prowadzacego_id = zaliczenie.stopien_prowadzacego_id
    JOIN prowadzacy ON prowadzacy.prowadzacy_id = stopien_prowadzacego.prowadzacy_id
    JOIN studentt ON studentt.student_id = zaliczenie.student_id
    JOIN grupkka ON grupkka.grupa_id = studentt.grupa_id
GROUP BY
    prowadzacy.prowadzacy_ID,
    grupkka.grupa_ID);

SET TIMING OFF;
--ranking grup ze wzgledu na srednia ocene grupy z przedmiotow

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    grupkka.grupa_ID           AS "NUMER_GRUPY",
    round(AVG(zaliczenie.ocena), 3) AS "SREDNIA_OCENA",
    przedmiotek.przedmiot_ID   AS "PRZEDMIOT",
    DENSE_RANK() OVER(
        ORDER BY
            AVG(zaliczenie.ocena) DESC
    ) AS "RANKING"
FROM
    zaliczenie
    JOIN studentt ON studentt.student_id = zaliczenie.student_id
    JOIN grupkka ON grupkka.grupa_id = studentt.grupa_id
    JOIN przedmiotek ON przedmiotek.przedmiot_ID=zaliczenie.przedmiot_ID
GROUP BY
    grupkka.grupa_ID,
    przedmiotek.przedmiot_ID);

SET TIMING OFF;