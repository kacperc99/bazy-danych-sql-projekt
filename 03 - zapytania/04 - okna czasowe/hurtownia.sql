--informacje o zaliczeniach ktore odbyly sie w lutym
SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT DISTINCT
    zaliczenie_h.zaliczenie_id              AS "ID_ZALICZENIA",
    zaliczenie_h.forma_zaliczenia           AS "FORMA_ZALICZENIA",
    zaliczenie_h.ocena                      AS "OCENA",
    termin_zaliczenia_h.termin_zaliczenia           AS "TERMIN_ZALICZENIA",
    zaliczenie_h.przedmiot_ID              AS "PRZEDMIOT"
FROM
    zaliczenie_h
    JOIN termin_zaliczenia_h ON termin_zaliczenia_h.termin_id = zaliczenie_h.termin_id
                              AND EXTRACT(MONTH FROM termin_zaliczenia_h.termin_zaliczenia) BETWEEN 2 AND 2

ORDER BY
    zaliczenie_h.zaliczenie_id,
    zaliczenie_h.forma_zaliczenia,
    zaliczenie_h.ocena,
    termin_zaliczenia_h.termin_zaliczenia,
    zaliczenie_h.przedmiot_ID);

SET TIMING OFF;
--osoby ktore zdobyly ocene 4 z kolokwiow z fizyki i wyzej 20 lutego

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT DISTINCT
    zaliczenie_h.student_id                 AS "ID_STUDENTA",
    termin_zaliczenia_h.termin_zaliczenia   AS "TERMIN_ZALICZENIA",
    zaliczenie_h.ocena                      AS "OCENA",
    zaliczenie_h.przedmiot_ID          AS "PRZEDMIOT"
FROM
    zaliczenie_h
    JOIN termin_zaliczenia_h ON termin_zaliczenia_h.termin_id = zaliczenie_h.termin_id
                              AND EXTRACT(DAY FROM termin_zaliczenia_h.termin_zaliczenia) BETWEEN 20 AND 20
WHERE
    zaliczenie_h.ocena >= 4
    AND zaliczenie_h.przedmiot_ID = 2
ORDER BY
    zaliczenie_h.student_id,
    termin_zaliczenia_h.termin_zaliczenia,
    zaliczenie_h.ocena,
    zaliczenie_h.przedmiot_ID);

SET TIMING OFF;
--profesorowie którzy robili zaliczenie pomiędzi 1 a 15 lutym

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT DISTINCT
    zaliczenie_h.zaliczenie_ID              AS "ID_ZALICZENIA",
    zaliczenie_h.prowadzacy_ID              AS "PROWADZACY",
    termin_zaliczenia_h.termin_zaliczenia   AS "TERMIN_ZALICZENIA"
FROM
    zaliczenie_h
    JOIN termin_zaliczenia_h ON termin_zaliczenia_h.termin_id = zaliczenie_h.termin_id
                       AND EXTRACT(DAY FROM termin_zaliczenia_h.termin_zaliczenia) BETWEEN 1 AND 15
ORDER BY
    zaliczenie_h.zaliczenie_id,
    zaliczenie_h.prowadzacy_ID,
    termin_zaliczenia_h.termin_zaliczenia);

SET TIMING OFF;