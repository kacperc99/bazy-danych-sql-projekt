--zestawienie ocen studentów z danych grup ze œrednia grupy
SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT DISTINCT
    zaliczenie.student_id   AS "ID_STUDENT",
    zaliczenie.ocena        AS "OCENA",
    grupkka.grupa_id        AS "GRUPA",
    round(AVG(zaliczenie.ocena) OVER(
        PARTITION BY grupkka.grupa_id
    ), 2) AS "SREDNIA OCEN W GRUPACH"
FROM
    zaliczenie
    JOIN studentt ON studentt.student_id = zaliczenie.student_id
    JOIN grupkka ON grupkka.grupa_id = studentt.grupa_id
ORDER BY
    zaliczenie.student_id,
    zaliczenie.ocena,
    grupkka.grupa_id);

SET TIMING OFF;
--zestawienie ocen studentów u prowadzacych w porownaniu do sredniej ocen wystawionych przez prowadzacych

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT DISTINCT
    zaliczenie.student_id              AS "ID_STUDENT",
    prowadzacy.prowadzacy_ID           AS "PROWADZACY",
    zaliczenie.ocena                   AS "OCENA",
    round(AVG(zaliczenie.ocena) OVER(
        PARTITION BY prowadzacy.prowadzacy_ID  
    ),2) AS "SREDNIA OCEN"
FROM
    zaliczenie
    JOIN stopien_prowadzacego ON stopien_prowadzacego.stopien_prowadzacego_id = zaliczenie.stopien_prowadzacego_id
    JOIN prowadzacy ON prowadzacy.prowadzacy_id = stopien_prowadzacego.prowadzacy_id
    JOIN studentt ON studentt.student_id = zaliczenie.student_id
ORDER BY
    zaliczenie.student_id,
    zaliczenie.ocena,
    prowadzacy.prowadzacy_ID);

SET TIMING OFF;
--procent zaliczen w salach w terminach

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT DISTINCT
    zaliczenie.zaliczenie_id            AS "ID_ZALICZENIA",
    sala.sala_ID                    AS "SALA",
    termin_zaliczenia.termin_ID   AS "TERMIN",
    round((100 * COUNT(zaliczenie.zaliczenie_id) OVER(
        PARTITION BY zaliczenie.zaliczenie_id, sala.sala_ID, termin_zaliczenia.termin_ID
    ) / COUNT(zaliczenie.zaliczenie_id) OVER(
        PARTITION BY sala.sala_ID, termin_zaliczenia.termin_ID
    )), 2) AS "PROCENT ZALICZEN"
FROM
    zaliczenie
    JOIN sala ON sala.sala_id = zaliczenie.sala_id
    JOIN termin_zaliczenia ON termin_zaliczenia.termin_id = zaliczenie.termin_id
ORDER BY
    zaliczenie.zaliczenie_id,
    sala.sala_ID,
    termin_zaliczenia.termin_ID);

SET TIMING OFF;