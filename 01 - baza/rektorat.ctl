LOAD DATA
CHARACTERSET UTF8
INFILE 'rektorat.csv'
BADFILE 'rektorat.bad.txt'
DISCARDFILE 'rektorat.dsc.txt'
REPLACE INTO TABLE rektorat
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(rektorat_ID,imie_pracownika_rektoratu,nazwisko_pracownika_rektoratu,PESEL_pracownika_rektoratu,funkcja_pracownika_rektoratu,uczelnia_ID)
