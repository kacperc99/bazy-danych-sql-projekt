LOAD DATA
CHARACTERSET UTF8
INFILE 'specjalizacja.csv'
BADFILE 'specjalizacja.bad.txt'
DISCARDFILE 'specjalizacja.dsc.txt'
REPLACE INTO TABLE specjalizacja
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(specjalizacja_ID,nazwa_specjalizacji,kierunek_ID)
