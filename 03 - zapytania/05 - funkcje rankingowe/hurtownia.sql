--ranking osob z zaliczenia z matematyki we wszystkich podejsciach
SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    zaliczenie_h.student_ID                 AS "ID_STUDENTA",
    termin_zaliczenia_h.numer_podejscia                  AS "NUMER_PODEJSCIA",
    ROUND(AVG(zaliczenie_h.ocena),3)        AS "SREDNIA_OCENA",
    DENSE_RANK() OVER( 
        ORDER BY
            AVG(zaliczenie_h.ocena) DESC
    ) AS "RANKING"
FROM
    zaliczenie_h JOIN termin_zaliczenia_h ON termin_zaliczenia_h.termin_id = zaliczenie_h.termin_id
    WHERE zaliczenie_h.przedmiot_ID=1
GROUP BY
    zaliczenie_h.student_ID,
    termin_zaliczenia_h.numer_podejscia);

SET TIMING OFF;
--ranking prowadzacych ze wzgledu na srednia ocen w grupach

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    zaliczenie_h.prowadzacy_ID           AS "PROWADZACY",
    ROUND(AVG(zaliczenie_h.ocena),3)              AS "SREDNIA_OCENA",
    zaliczenie_h.grupa_ID                   AS "ID_GRUPY",
    DENSE_RANK() OVER(
        ORDER BY
            AVG(zaliczenie_h.ocena) DESC
    ) AS "RANKING"
FROM
    zaliczenie_h
GROUP BY
    zaliczenie_h.prowadzacy_ID,
    zaliczenie_h.grupa_ID);

SET TIMING OFF;
--ranking grup ze wzgledu na srednia ocene grupy z przedmiotow

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    zaliczenie_h.grupa_ID           AS "NUMER_GRUPY",
    round(AVG(zaliczenie_h.ocena), 3) AS "SREDNIA_OCENA",
    zaliczenie_h.przedmiot_ID   AS "PRZEDMIOT",
    DENSE_RANK() OVER(
        ORDER BY
            AVG(zaliczenie_h.ocena) DESC
    ) AS "RANKING"
FROM
    zaliczenie_h
GROUP BY
    zaliczenie_h.grupa_ID,
    zaliczenie_h.przedmiot_ID);

SET TIMING OFF;