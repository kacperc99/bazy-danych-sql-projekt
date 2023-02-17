--informacje o zaliczeniach ktore odbyly sie w lutym
SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT DISTINCT
    zaliczenie.zaliczenie_id              AS "ID_ZALICZENIA",
    zaliczenie.forma_zaliczenia           AS "FORMA_ZALICZENIA",
    zaliczenie.ocena                      AS "OCENA",
    termin_zaliczenia.termin_zaliczenia           AS "TERMIN_ZALICZENIA",
    przedmiotek.przedmiot_ID              AS "PRZEDMIOT"
FROM
    zaliczenie
    JOIN przedmiotek ON przedmiotek.przedmiot_id = zaliczenie.przedmiot_id
    JOIN termin_zaliczenia ON termin_zaliczenia.termin_id = zaliczenie.termin_id
                              AND EXTRACT(MONTH FROM termin_zaliczenia.termin_zaliczenia) BETWEEN 2 AND 2

ORDER BY
    zaliczenie.zaliczenie_id,
    zaliczenie.forma_zaliczenia,
    zaliczenie.ocena,
    termin_zaliczenia.termin_zaliczenia,
    przedmiotek.przedmiot_ID);

SET TIMING OFF;
--osoby ktore zdobyly ocene 4 z kolokwiow z fizyki i wyzej 20 lutego

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT DISTINCT
    zaliczenie.student_id                 AS "ID_STUDENTA",
    termin_zaliczenia.termin_zaliczenia   AS "TERMIN_ZALICZENIA",
    zaliczenie.ocena                      AS "OCENA",
    przedmiotek.przedmiot_ID          AS "PRZEDMIOT"
FROM
    zaliczenie
    JOIN przedmiotek ON przedmiotek.przedmiot_id = zaliczenie.przedmiot_id
    JOIN termin_zaliczenia ON termin_zaliczenia.termin_id = zaliczenie.termin_id
                              AND EXTRACT(DAY FROM termin_zaliczenia.termin_zaliczenia) BETWEEN 20 AND 20
WHERE
    zaliczenie.ocena >= 4
    AND przedmiotek.przedmiot_ID = 2
ORDER BY
    zaliczenie.student_id,
    termin_zaliczenia.termin_zaliczenia,
    zaliczenie.ocena,
    przedmiotek.przedmiot_ID);

SET TIMING OFF;
--profesorowie którzy robili zaliczenie pomiędzi 1 a 15 lutym

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT DISTINCT
    zaliczenie.zaliczenie_ID              AS "ID_ZALICZENIA",
    prowadzacy.prowadzacy_ID              AS "PROWADZACY",
    termin_zaliczenia.termin_zaliczenia           AS "TERMIN_ZALICZENIA"
FROM
    zaliczenie
    JOIN termin_zaliczenia ON termin_zaliczenia.termin_id = zaliczenie.termin_id
    JOIN stopien_prowadzacego ON stopien_prowadzacego.stopien_prowadzacego_id = zaliczenie.stopien_prowadzacego_id
    JOIN prowadzacy ON prowadzacy.prowadzacy_id = stopien_prowadzacego.prowadzacy_id
                       AND EXTRACT(DAY FROM termin_zaliczenia.termin_zaliczenia) BETWEEN 1 AND 15
ORDER BY
    zaliczenie.zaliczenie_id,
    prowadzacy.prowadzacy_ID,
    termin_zaliczenia.termin_zaliczenia);

SET TIMING OFF;