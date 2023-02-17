LOAD DATA
CHARACTERSET UTF8
INFILE 'dziekanat.csv'
BADFILE 'dziekanat.bad.txt'
DISCARDFILE 'dziekanat.dsc.txt'
REPLACE INTO TABLE dziekanat
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(dziekanat_ID,imie_pracownika,nazwisko_pracownika,PESEL_pracownika,funkcja__pracownika,rektorat_ID)