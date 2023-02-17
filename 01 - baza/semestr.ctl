LOAD DATA
CHARACTERSET UTF8
INFILE 'semestr.csv'
BADFILE 'semestr.bad.txt'
DISCARDFILE 'semestr.dsc.txt'
REPLACE INTO TABLE semestr
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(semestr_ID,numer_semestru,wymagane_punkty_ECTS,status_zaliczenia_semestru)
