LOAD DATA
CHARACTERSET UTF8
INFILE 'kraj.csv'
BADFILE 'kraj.bad.txt'
DISCARDFILE 'kraj.dsc.txt'
REPLACE INTO TABLE kraj_pochodzenia
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(kraj_ID,nazwa_kraju)