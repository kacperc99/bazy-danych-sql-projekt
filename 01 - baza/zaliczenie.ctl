LOAD DATA
CHARACTERSET UTF8
INFILE 'zaliczenie.csv'
BADFILE 'zaliczenie.bad.txt'
DISCARDFILE 'zaliczenie.dsc.txt'
REPLACE INTO TABLE zaliczenie
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(zaliczenie_ID,data_zaliczenia"TO_DATE(:data_zaliczenia,'RRRR/MM/DD')",ocena,forma_zaliczenia,termin_ID,sala_ID,przedmiot_ID,student_ID,stopien_prowadzacego_ID)