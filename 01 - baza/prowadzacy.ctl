LOAD DATA
CHARACTERSET UTF8
INFILE 'prowadzacy.csv'
BADFILE 'prowadzacy.bad.txt'
DISCARDFILE 'prowadzacy.dsc.txt'
REPLACE INTO TABLE prowadzacy
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(prowadzacy_ID,imie_prowadzacego,nazwisko_prowadzacego,PESEL_prowadzacego)
