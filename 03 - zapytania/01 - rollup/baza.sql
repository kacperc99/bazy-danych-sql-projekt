--srednie oceny studentow z grup z przedmiotow
SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    nvl(to_char(zaliczenie.student_id), 'DLA WSZYSTKICH') AS "ID_STUDENTA",
    nvl(to_char(studentt.grupa_id), 'CALA GRUPA') AS "NUMER_GRUPY",
    nvl(to_char(przedmiotek.przedmiot_id), 'CALY PRZEDMIOT') AS "PRZEDMIOT",
    round(AVG(ocena), 2) AS "SREDNIA_OCEN"
FROM
    zaliczenie
    JOIN studentt ON studentt.student_id = zaliczenie.student_id
    JOIN przedmiotek ON przedmiotek.przedmiot_id = zaliczenie.przedmiot_id
GROUP BY
    ROLLUP(zaliczenie.student_id,
           studentt.grupa_id,
           przedmiotek.przedmiot_id)
);
SET TIMING OFF;
--do ilu zaliczeñ przystapili studenci z danych przedmiotow u poszczegolnych prowadzacych

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    nvl(to_char(studentt.student_id), 'DLA WSZYSTKICH') AS "ID_STUDENTA",
    nvl(to_char(zaliczenie.zaliczenie_id), 'WSZYSTKIE TERMINY') AS "TERMIN",
    nvl(to_char(przedmiotek.przedmiot_id), 'CALA SALA') AS "SALA",
    nvl(to_char(prowadzacy.prowadzacy_id), 'WSZYSCY PROWADZACY') AS "PROWADZACY"
FROM
    zaliczenie
    JOIN studentt ON studentt.student_id = zaliczenie.student_id
    JOIN przedmiotek ON przedmiotek.przedmiot_id = zaliczenie.przedmiot_id
    JOIN stopien_prowadzacego ON stopien_prowadzacego.stopien_prowadzacego_id = zaliczenie.stopien_prowadzacego_id
    JOIN prowadzacy ON prowadzacy.prowadzacy_id = stopien_prowadzacego.prowadzacy_id
GROUP BY
    ROLLUP(studentt.student_id,
           zaliczenie.zaliczenie_id,
           przedmiotek.przedmiot_id,
           prowadzacy.prowadzacy_id)
);
SET TIMING OFF;
--srednia ocen studentow z typow zaliczen w terminach

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    nvl(to_char(studentt.student_id), 'DLA WSZYSTKICH') AS "STUDENT",
    nvl(to_char(termin_zaliczenia.termin_id), 'CALY TERMIN') AS "TERMIN_ID",
    nvl(to_char(zaliczenie.forma_zaliczenia), 'CALA FORMA') AS "PRZEDMIOT",
    round(AVG(ocena), 2) AS "SREDNIA_OCEN"
FROM
    zaliczenie
    JOIN termin_zaliczenia ON termin_zaliczenia.termin_id = zaliczenie.termin_id
    JOIN studentt ON studentt.student_id = zaliczenie.student_id
GROUP BY
    ROLLUP(studentt.student_id,
           termin_zaliczenia.termin_id,
           zaliczenie.forma_zaliczenia)
);
SET TIMING OFF;