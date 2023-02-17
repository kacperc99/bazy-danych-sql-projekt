LOAD DATA
CHARACTERSET UTF8
INFILE 'stopien_naukowy.csv'
BADFILE 'stopien_naukowy.bad.txt'
DISCARDFILE 'stopien_naukowy.dsc.txt'
REPLACE INTO TABLE stopien_naukowy
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(stopien_naukowy_ID,nazwa_stopnia)
