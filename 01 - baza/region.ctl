LOAD DATA
CHARACTERSET UTF8
INFILE 'region.csv'
BADFILE 'region.bad.txt'
DISCARDFILE 'region.dsc.txt'
REPLACE INTO TABLE region_zamieszkania
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(region_ID,wojewodztwo,powiat,gmina,miejscowosc)
