LOAD DATA
CHARACTERSET UTF8
INFILE 'wydzial.csv'
BADFILE 'wydzial.bad.txt'
DISCARDFILE 'wydzial.dsc.txt'
REPLACE INTO TABLE wydzial
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(wydzial_ID,nazwa_wydzialu,adres_wydzialu,uczelnia_ID,dziekanat_ID)

