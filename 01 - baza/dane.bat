SET username=hr
SET password=hr
SET instation=localhost:1521/ORCL

sqlldr %username%/%password%@//%instation% control=uczelnia.ctl log=uczelnia.log direct=true

sqlldr %username%/%password%@//%instation% control=rektorat.ctl log=rektorat.log direct=true

sqlldr %username%/%password%@//%instation% control=dziekanat.ctl log=dziekanat.log direct=true

sqlldr %username%/%password%@//%instation% control=wydzial.ctl log=wydzial.log direct=true

sqlldr %username%/%password%@//%instation% control=stopien.ctl log=stopien.log direct=true

sqlldr %username%/%password%@//%instation% control=kierunek.ctl log=kierunek.log direct=true

sqlldr %username%/%password%@//%instation% control=kierunek_na_stopniu.ctl log=kierunek_na_stopniu.log direct=true

sqlldr %username%/%password%@//%instation% control=specjalizacja.ctl log=specjalizacja.log direct=true

sqlldr %username%/%password%@//%instation% control=semestr.ctl log=semestr.log direct=true

sqlldr %username%/%password%@//%instation% control=specjalizacja_na_semestrze.ctl log=specjalizacja_na_semestrze.log direct=true

sqlldr %username%/%password%@//%instation% control=przedmiotek.ctl log=przedmiotek.log direct=true

sqlldr %username%/%password%@//%instation% control=przedmiot_na_studiach.ctl log=przedmiot_na_studiach.log direct=true

sqlldr %username%/%password%@//%instation% control=stopien_naukowy.ctl log=stopien_naukowy.log direct=true

sqlldr %username%/%password%@//%instation% control=prowadzacy.ctl log=prowadzacy.log direct=true

sqlldr %username%/%password%@//%instation% control=stopien_prowadzacego.ctl log=stopien_prowadzacego.log direct=true

sqlldr %username%/%password%@//%instation% control=region.ctl log=region.log direct=true

sqlldr %username%/%password%@//%instation% control=kraj.ctl log=kraj.log direct=true

sqlldr %username%/%password%@//%instation% control=grupa.ctl log=grupa.log direct=true

sqlldr %username%/%password%@//%instation% control=student.ctl log=student.log direct=true

sqlldr %username%/%password%@//%instation% control=data.ctl log=data.log direct=true

sqlldr %username%/%password%@//%instation% control=sala.ctl log=sala.log direct=true

sqlldr %username%/%password%@//%instation% control= zaliczenie.ctl log=zaliczenie.log direct=true load=100000 rows=50

pause