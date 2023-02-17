LOAD DATA
CHARACTERSET UTF8
INFILE 'kierunek.csv'
BADFILE 'kierunek.bad.txt'
DISCARDFILE 'kierunek.dsc.txt'
REPLACE INTO TABLE kierunek
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(kierunek_ID,nazwa_kierunku)