LOAD DATA
CHARACTERSET UTF8
INFILE 'stopien.csv'
BADFILE 'stopien.bad.txt'
DISCARDFILE 'stopien.dsc.txt'
REPLACE INTO TABLE stopien_studiow
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(stopien_ID,numer_stopnia,typ_studiow,wydzial_ID)
