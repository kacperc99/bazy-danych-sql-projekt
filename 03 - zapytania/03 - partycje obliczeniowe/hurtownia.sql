--zestawienie ocen studentów z danych grup ze œrednia grupy
SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT DISTINCT
    zaliczenie_h.student_id   AS "ID_STUDENT",
    zaliczenie_h.ocena        AS "OCENA",
    zaliczenie_h.grupa_id        AS "GRUPA",
    round(AVG(zaliczenie_h.ocena) OVER(
        PARTITION BY zaliczenie_h.grupa_id
    ), 2) AS "SREDNIA OCEN W GRUPACH"
FROM
    zaliczenie_h
ORDER BY
    zaliczenie_h.student_id,
    zaliczenie_h.ocena,
    zaliczenie_h.grupa_id);

SET TIMING OFF;
--zestawienie ocen studentów u prowadzacych w porownaniu do sredniej ocen wystawionych przez prowadzacych

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT DISTINCT
    zaliczenie_h.student_id              AS "ID_STUDENT",
    zaliczenie_h.prowadzacy_ID           AS "PROWADZACY",
    zaliczenie_h.ocena                   AS "OCENA",
    round(AVG(zaliczenie_h.ocena) OVER(
        PARTITION BY zaliczenie_h.prowadzacy_ID  
    ),2) AS "SREDNIA OCEN"
FROM
    zaliczenie_h
ORDER BY
    zaliczenie_h.student_id,
    zaliczenie_h.ocena,
    zaliczenie_h.prowadzacy_ID);

SET TIMING OFF;
--procent zaliczen w salach w terminach

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT DISTINCT
    zaliczenie_h.zaliczenie_id            AS "ID_ZALICZENIA",
    zaliczenie_h.sala_ID                    AS "SALA",
    zaliczenie_h.termin_ID   AS "TERMIN",
    round((100 * COUNT(zaliczenie_h.zaliczenie_id) OVER(
        PARTITION BY zaliczenie_h.zaliczenie_id, zaliczenie_h.sala_ID, zaliczenie_h.termin_ID
    ) / COUNT(zaliczenie_h.zaliczenie_id) OVER(
        PARTITION BY zaliczenie_h.sala_ID, zaliczenie_h.termin_ID
    )), 2) AS "PROCENT ZALICZEN"
FROM
    zaliczenie_h
ORDER BY
    zaliczenie_h.zaliczenie_id,
    zaliczenie_h.sala_ID,
    zaliczenie_h.termin_ID);

SET TIMING OFF;