LOAD DATA
CHARACTERSET UTF8
INFILE 'przedmiotek.csv'
BADFILE 'przedmiotek.bad.txt'
DISCARDFILE 'przedmiotek.dsc.txt'
REPLACE INTO TABLE przedmiotek
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(przedmiot_ID,nazwa_przedmiotu,punkty_ECTS,typ_przedmiotu,semestr_ID)
