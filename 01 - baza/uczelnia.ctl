LOAD DATA
CHARACTERSET UTF8
INFILE 'uczelnia.csv'
BADFILE 'uczelnia.bad.txt'
DISCARDFILE 'uczelnia.dsc.txt'
REPLACE INTO TABLE uczelnia
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(uczelnia_ID,nazwa_uczelni,typ_uczelni)
