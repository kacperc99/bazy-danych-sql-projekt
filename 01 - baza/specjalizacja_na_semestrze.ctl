load data
CHARACTERSET UTF8
infile 'specjalizacja_na_semestrze.csv'
BADFILE 'specjalizacja_na_semestrze.bad.txt'
DISCARDFILE 'specjalizacja_na_semestrze.dsc.txt'
REPLACE INTO TABLE specjalizacja_na_semestrze
fields terminated by ','
TRAILING NULLCOLS
(specjalizacja_ID,semestr_ID)