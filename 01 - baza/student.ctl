LOAD DATA
CHARACTERSET UTF8
INFILE 'student.csv'
BADFILE 'student.bad.txt'
DISCARDFILE 'student.dsc.txt'
REPLACE INTO TABLE studentt
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(student_ID,imie,nazwisko,PESEL,plec,region_ID,kraj_ID,grupa_ID)

