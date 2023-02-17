LOAD DATA
CHARACTERSET UTF8
INFILE 'stopien_prowadzacego.csv'
BADFILE 'stopien_prowadzacego.bad.txt'
DISCARDFILE 'stopien_prowadzacego.dsc.txt'
REPLACE INTO TABLE stopien_prowadzacego
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(stopien_prowadzacego_ID,stopien_naukowy_ID,prowadzacy_ID)
