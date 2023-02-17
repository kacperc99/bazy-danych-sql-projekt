LOAD DATA
CHARACTERSET UTF8
INFILE 'data.csv'
BADFILE 'data.bad.txt'
DISCARDFILE 'data.dsc.txt'
REPLACE INTO TABLE termin_zaliczenia
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(termin_ID,termin_zaliczenia"TO_DATE(:termin_zaliczenia,'RRRR/MM/DD')",numer_podejscia)