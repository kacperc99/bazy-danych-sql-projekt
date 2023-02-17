LOAD DATA
CHARACTERSET UTF8
INFILE 'kierunek_na_stopniu.csv'
BADFILE 'kierunek_na_stopniu.bad.txt'
DISCARDFILE 'kierunek_na_stopniu.dsc.txt'
REPLACE INTO TABLE kierunek_na_stopniu
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(kierunek_ID,stopien_ID)