LOAD DATA
CHARACTERSET UTF8
INFILE 'przedmiot_na_studiach.csv'
BADFILE 'przedmiot_na_studiach.bad.txt'
DISCARDFILE 'przedmiot_na_studiach.dsc.txt'
REPLACE INTO TABLE przedmiot_na_studiach
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(przedmiot_ID,stopien_ID)