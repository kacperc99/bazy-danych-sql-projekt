--srednie oceny studentow z grup z przedmiotow
SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    nvl(to_char(zaliczenie_h.student_id), 'DLA WSZYSTKICH') AS "ID_STUDENTA",
    nvl(to_char(zaliczenie_h.grupa_id), 'CALA GRUPA') AS "NUMER_GRUPY",
    nvl(to_char(zaliczenie_h.przedmiot_id), 'CALY PRZEDMIOT') AS "PRZEDMIOT",
    round(AVG(ocena), 2) AS "SREDNIA_OCEN"
FROM
    zaliczenie_h
GROUP BY
    ROLLUP(zaliczenie_h.student_id,
           zaliczenie_h.grupa_id,
           zaliczenie_h.przedmiot_id)
);
SET TIMING OFF;
--do ilu zaliczeñ przystapili studenci z danych przedmiotow u poszczegolnych prowadzacych

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    nvl(to_char(zaliczenie_h.student_id), 'DLA WSZYSTKICH') AS "ID_STUDENTA",
    nvl(to_char(zaliczenie_h.zaliczenie_id), 'WSZYSTKIE TERMINY') AS "TERMIN",
    nvl(to_char(zaliczenie_h.przedmiot_id), 'CALA SALA') AS "SALA",
    nvl(to_char(zaliczenie_h.prowadzacy_id), 'WSZYSCY PROWADZACY') AS "PROWADZACY"
FROM
    zaliczenie_h
GROUP BY
    ROLLUP(zaliczenie_h.student_id,
           zaliczenie_h.zaliczenie_id,
           zaliczenie_h.przedmiot_id,
           zaliczenie_h.prowadzacy_id)
);
SET TIMING OFF;
--srednia ocen studentow z typow zaliczen w terminach

SET TIMING ON;
SELECT COUNT(*) FROM(
SELECT
    nvl(to_char(zaliczenie_h.student_id), 'DLA WSZYSTKICH') AS "STUDENT",
    nvl(to_char(zaliczenie_h.termin_id), 'CALY TERMIN') AS "TERMIN_ID",
    nvl(to_char(zaliczenie_h.forma_zaliczenia), 'CALA FORMA') AS "PRZEDMIOT",
    round(AVG(ocena), 2) AS "SREDNIA_OCEN"
FROM
    zaliczenie_h
GROUP BY
    ROLLUP(zaliczenie_h.student_id,
           zaliczenie_h.termin_id,
           zaliczenie_h.forma_zaliczenia)
);
SET TIMING OFF;