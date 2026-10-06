DROP TABLE membrii;
DROP TABLE antrenori;
DROP TABLE abonamente;
DROP TABLE plati;
DROP TABLE cursuri;

CREATE TABLE membrii 
(id_membru NUMBER(4) CONSTRAINT PKey_membrii PRIMARY KEY,
nume_membru VARCHAR2(50) NOT NULL,
prenume_membru VARCHAR2(50) NOT NULL,
gen_membru VARCHAR2(10) CONSTRAINT Fgen_membru_CK check(gen_membru IN ('M', 'F', 'Altul')) NOT NULL,
nrTelefon VARCHAR(15) NOT NULL,
data_inscrierii DATE NOT NULL,
id_abonament NUMBER(4),
CONSTRAINT FK_id_abonament FOREIGN KEY (id_abonament) REFERENCES abonamente (id_abonament)
);
 
CREATE TABLE abonamente
(id_abonament NUMBER(4) CONSTRAINT PKey_abonamente PRIMARY KEY,
tip_abonament VARCHAR2(10)CONSTRAINT Ftip_abonament_CK check (tip_abonament IN ('Anual','Lunar','Premium')) NOT NULL,
pret_abonament NUMBER(8,2) NOT NULL,
tip_acces VARCHAR2(50) CONSTRAINT Ftip_acces_CK check (tip_acces IN ('Toate zonele','Fitness','Fitness și Cardio','Cardio'))NOT NULL,
id_plata NUMBER(4),
CONSTRAINT FK_id_plata FOREIGN KEY (id_plata) REFERENCES plati (id_plata)
);

CREATE TABLE antrenori 
(id_antrenor NUMBER(4) CONSTRAINT PKEY_id_antrenor PRIMARY KEY,
nume_antrenor VARCHAR2(50) NOT NULL,
specializare VARCHAR2(20) NOT NULL,
programAntrenor VARCHAR2(20) CONSTRAINT FprogramAntrenor_CK check ( programAntrenor IN ('Full-time','Part-time')) NOT NULL,
experientaAntrenor NUMBER(2) NOT NULL,
salariuAntrenor NUMBER(8,2) NOT NULL,
id_membru NUMBER(4),
CONSTRAINT FK_id_membru FOREIGN KEY (id_membru) REFERENCES membrii (id_membru)
);

CREATE TABLE cursuri
(id_curs NUMBER(4) CONSTRAINT Pkey_cursuri PRIMARY KEY,
nume_curs VARCHAR2(50) NOT NULL,
ora_incepere VARCHAR2(30) NOT NULL,
zile_curs VARCHAR2(50) NOT NULL,
nivel_dificultate VARCHAR2(20) CONSTRAINT Fnivel_dificultate_CK check ( nivel_dificultate IN ('Începători','Intermediar','Avansat'))NOT NULL,
id_antrenor NUMBER(4),
CONSTRAINT FK_id_antrenor FOREIGN KEY (id_antrenor) REFERENCES antrenori(id_antrenor)
);

CREATE TABLE plati
(id_plata NUMBER(4) CONSTRAINT PKey_plati PRIMARY KEY,
suma_platita NUMBER(8,2) NOT NULL,
data_platii DATE NOT NULL,
metoda_plata VARCHAR2(20) CONSTRAINT Fmetoda_plata_CK check (metoda_plata IN ('Cash','Card','Transfer bancar')) NOT NULL,
status_plata VARCHAR2(20) CONSTRAINT Fstatus_plata_CK check (status_plata IN ('Platit','Restant'))NOT NULL
);



INSERT INTO membrii (id_membru, nume_membru, prenume_membru, gen_membru, nrTelefon, data_inscrierii, id_abonament)
VALUES (1, 'Dragotoiu','Andrei', 'M', '0786712345', TO_DATE('2021-06-08', 'YYYY-MM-DD'),5);
INSERT INTO membrii (id_membru, nume_membru, prenume_membru, gen_membru, nrTelefon, data_inscrierii, id_abonament)
VALUES (2, 'Cotoi','Denisa', 'F', '0785732145', TO_DATE('2022-05-28', 'YYYY-MM-DD'),8);
INSERT INTO membrii (id_membru, nume_membru, prenume_membru, gen_membru, nrTelefon, data_inscrierii, id_abonament)
VALUES (3, 'Gavrilescu','Alexandra', 'F', '0756312745', TO_DATE('2021-11-23', 'YYYY-MM-DD'),3);
INSERT INTO membrii (id_membru, nume_membru, prenume_membru, gen_membru, nrTelefon, data_inscrierii, id_abonament)
VALUES (4, 'Cotoi','Daniela', 'F', '0756512545', TO_DATE('2024-01-04', 'YYYY-MM-DD'),9);
INSERT INTO membrii (id_membru, nume_membru, prenume_membru, gen_membru, nrTelefon, data_inscrierii, id_abonament)
VALUES (5, 'Firulescu','Daniel', 'M', '0776717347', TO_DATE('2021-03-09', 'YYYY-MM-DD'),10);
INSERT INTO membrii (id_membru, nume_membru, prenume_membru, gen_membru, nrTelefon, data_inscrierii, id_abonament)
VALUES (6, 'Buzărin','Marius', 'M', '0766717349', TO_DATE('2024-11-08', 'YYYY-MM-DD'),2);
INSERT INTO membrii (id_membru, nume_membru, prenume_membru, gen_membru, nrTelefon, data_inscrierii, id_abonament)
VALUES (7, 'Coman','Aiana', 'F', '0744712442', TO_DATE('2024-03-11', 'YYYY-MM-DD'),1);
INSERT INTO membrii (id_membru, nume_membru, prenume_membru, gen_membru, nrTelefon, data_inscrierii, id_abonament)
VALUES (8, 'Vijulan','Darius', 'M', '0732714348', TO_DATE('2024-12-03', 'YYYY-MM-DD'),4);
INSERT INTO membrii (id_membru, nume_membru, prenume_membru, gen_membru, nrTelefon, data_inscrierii, id_abonament)
VALUES (9, 'Breazu','Mihai', 'M', '0736222345', TO_DATE('2023-02-16', 'YYYY-MM-DD'),7);
INSERT INTO membrii (id_membru, nume_membru, prenume_membru, gen_membru, nrTelefon, data_inscrierii, id_abonament)
VALUES (10, 'Popescu','Raluca', 'F', '0786416347', TO_DATE('2022-10-28', 'YYYY-MM-DD'),6);


SELECT * FROM membrii;

INSERT INTO antrenori (id_antrenor, nume_antrenor, specializare, programAntrenor, experientaAntrenor, salariuAntrenor, id_membru)
VALUES (1, 'Daniel Pasăre', 'Fitness', 'Full-time',3, 4040,1);
INSERT INTO antrenori (id_antrenor, nume_antrenor, specializare, programAntrenor, experientaAntrenor, salariuAntrenor, id_membru)
VALUES (2, 'Giugă Andreea', 'Yoga', 'Part-time',2, 3090.45,2);
INSERT INTO antrenori (id_antrenor, nume_antrenor, specializare, programAntrenor, experientaAntrenor, salariuAntrenor, id_membru)
VALUES (3, 'Patricia Crăciun', 'Gimnastică', 'Full-time',6,5800.23,3);
INSERT INTO antrenori (id_antrenor, nume_antrenor, specializare, programAntrenor, experientaAntrenor, salariuAntrenor, id_membru)
VALUES (4, 'Robert Buzărin', 'Aerobic', 'Full-time',5,4567,4);
INSERT INTO antrenori (id_antrenor, nume_antrenor, specializare, programAntrenor, experientaAntrenor, salariuAntrenor, id_membru)
VALUES (5, 'Alexandru Achim', 'Gimnastică', 'Part-time',3, 3452.76,5);
INSERT INTO antrenori (id_antrenor, nume_antrenor, specializare, programAntrenor, experientaAntrenor, salariuAntrenor, id_membru)
VALUES (6, 'Cristina Gorun', 'Fitness', 'Part-time',3,4563.56,6);
INSERT INTO antrenori (id_antrenor, nume_antrenor, specializare, programAntrenor, experientaAntrenor, salariuAntrenor, id_membru)
VALUES (7, 'Maria Dragu', 'Aerobic', 'Full-time',6,6784.56,7);
INSERT INTO antrenori (id_antrenor, nume_antrenor, specializare, programAntrenor, experientaAntrenor, salariuAntrenor, id_membru)
VALUES (8, 'Georgiana Ciupercă', 'Yoga', 'Part-time',4,3456.34,8);
INSERT INTO antrenori (id_antrenor, nume_antrenor, specializare, programAntrenor, experientaAntrenor, salariuAntrenor, id_membru)
VALUES (9, 'Ana Diaconescu', 'Fitness', 'Full-time',6,7645.23,9);
INSERT INTO antrenori (id_antrenor, nume_antrenor, specializare, programAntrenor, experientaAntrenor, salariuAntrenor, id_membru)
VALUES (10, 'Ioana Sosoi', 'Fitness', 'Part-time',5,4567.45,10);


SELECT * FROM antrenori;

INSERT INTO cursuri (id_curs, nume_curs, id_antrenor, ora_incepere, zile_curs, nivel_dificultate)
VALUES (1, 'Curs Fitness', 1, '10:00', 'Luni, Miercuri, Vineri','Avansat');
INSERT INTO cursuri (id_curs, nume_curs, id_antrenor, ora_incepere, zile_curs, nivel_dificultate)
VALUES (2, 'Curs Yoga', 2, '08:00', 'Marți, Joi','Intermediar');
INSERT INTO cursuri (id_curs, nume_curs, id_antrenor, ora_incepere, zile_curs, nivel_dificultate)
VALUES (3, 'Curs Gimnastică', 3, '12:00', 'Luni, Miercuri','Intermediar');
INSERT INTO cursuri (id_curs, nume_curs, id_antrenor, ora_incepere, zile_curs, nivel_dificultate)
VALUES (4, 'Curs Aerobic', 4, '11:00', 'Marți, Miercuri','Începători');
INSERT INTO cursuri (id_curs, nume_curs, id_antrenor, ora_incepere, zile_curs, nivel_dificultate)
VALUES (5, 'Curs Aerobic', 7, '14:00', 'Luni, Joi','Avansat');
INSERT INTO cursuri (id_curs, nume_curs, id_antrenor, ora_incepere, zile_curs, nivel_dificultate)
VALUES (6, 'Curs Fitness', 6, '07:30', 'Luni, Miercuri,Vineri','Intermediar');
INSERT INTO cursuri (id_curs, nume_curs, id_antrenor, ora_incepere, zile_curs, nivel_dificultate)
VALUES (7, 'Curs Fitness', 9, '17:00', 'Luni, Vineri','Începători');
INSERT INTO cursuri (id_curs, nume_curs, id_antrenor, ora_incepere, zile_curs, nivel_dificultate)
VALUES (8, 'Curs Yoga', 8, '10:00', 'Luni, Marți, Miercuri','Avansat');
INSERT INTO cursuri (id_curs, nume_curs, id_antrenor, ora_incepere, zile_curs, nivel_dificultate)
VALUES (9, 'Curs Fitness', 10, '09:00', 'Marți, Joi','Începători');
INSERT INTO cursuri (id_curs, nume_curs, id_antrenor, ora_incepere, zile_curs, nivel_dificultate)
VALUES (10, 'Curs Yoga', 5, '12:00', 'Miercuri, Joi','Intermediar');

SELECT * FROM cursuri;

INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (1, 200.00, TO_DATE('2025-01-01', 'YYYY-MM-DD'), 'Card', 'Platit');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (2, 100.00, TO_DATE('2025-01-05', 'YYYY-MM-DD'), 'Cash', 'Restant');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (3, 150.00, TO_DATE('2025-01-07', 'YYYY-MM-DD'), 'Transfer bancar', 'Platit');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (4, 130.00, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 'Card', 'Platit');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (5, 120.00, TO_DATE('2023-08-16', 'YYYY-MM-DD'), 'Cash', 'Platit');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (6, 110.00, TO_DATE('2024-05-12', 'YYYY-MM-DD'), 'Transfer bancar', 'Restant');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (7, 7200.00, TO_DATE('2024-09-09', 'YYYY-MM-DD'), 'Transfer bancar', 'Restant');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (8, 210.00, TO_DATE('2024-03-07', 'YYYY-MM-DD'), 'Cash', 'Platit');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (9, 180.00, TO_DATE('2023-06-12', 'YYYY-MM-DD'), 'Card', 'Platit');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (10, 190.00, TO_DATE('2024-10-07', 'YYYY-MM-DD'), 'Cash', 'Platit');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (11, 167.00, TO_DATE('2023-10-29', 'YYYY-MM-DD'), 'Transfer bancar', 'Restant');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (12, 56.00, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 'Transfer bancar', 'Restant');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (13, 89.00, TO_DATE('2024-03-28', 'YYYY-MM-DD'), 'Card', 'Platit');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (14, 43.00, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 'Card', 'Platit');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (15, 180.00, TO_DATE('2023-01-23', 'YYYY-MM-DD'), 'Card', 'Platit');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (16, 200.00, TO_DATE('2024-05-12', 'YYYY-MM-DD'), 'Cash', 'Platit');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (17, 400.00, TO_DATE('2024-08-19', 'YYYY-MM-DD'), 'Cash', 'Platit');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (18, 321.00, TO_DATE('2024-01-07', 'YYYY-MM-DD'), 'Transfer bancar', 'Restant');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (19, 270.00, TO_DATE('2024-08-11', 'YYYY-MM-DD'), 'Transfer bancar', 'Platit');
INSERT INTO plati (id_plata, suma_platita, data_platii, metoda_plata, status_plata)
VALUES (20, 150.00, TO_DATE('2024-05-16', 'YYYY-MM-DD'), 'Card', 'Platit');


SELECT * FROM plati;

INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(1, 'Anual',799.99,'Toate zonele',7);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(2, 'Premium',999.99,'Toate zonele',8);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(3, 'Lunar',210.99,'Fitness',4);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(4, 'Lunar',270.99,'Fitness și Cardio',3);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(5, 'Anual',799.99,'Toate zonele',1);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(6, 'Anual',799.99,'Toate zonele',10);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(7, 'Premium',999.99,'Toate zonele',2);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(8, 'Lunar',199.99,'Cardio',5);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(9, 'Anual',599.99,'Fitness',6);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(10, 'Anual',999.99,'Toate zonele',9);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(11, 'Anual',999.99,'Toate zonele',15);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(12, 'Lunar',249.99,'Fitness',19);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(13, 'Anual',499.99,'Cardio',13);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(14, 'Lunar',199.99,'Cardio',11);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(15, 'Premium',699.99,'Fitness și Cardio',20);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(16, 'Lunar',999.99,'Fitness și Cardio',18);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(17, 'Anual',399.99,'Cardio',12);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(18, 'Lunar',270.99,'Fitness și Cardio',14);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(19, 'Anual',799.99,'Toate zonele',17);
INSERT INTO abonamente (id_abonament, tip_abonament, pret_abonament, tip_acces, id_plata)
VALUES(20,'Premium',699.99,'Fitness și Cardio',16);

SELECT * FROM abonamente;

UPDATE antrenori
SET salariuAntrenor = salariuAntrenor * 1.10
WHERE experientaAntrenor > 5;
SELECT * FROM antrenori;

UPDATE cursuri
SET zile_curs = 'Marți, Joi, Sâmbătă'
WHERE id_curs = 5;
SELECT * FROM cursuri;

UPDATE abonamente
SET pret_abonament = pret_abonament - 50
WHERE tip_abonament = 'Anual';
SELECT * FROM abonamente;


SELECT nume_antrenor, salariuAntrenor 
FROM antrenori
WHERE salariuAntrenor > 4000;

SELECT nume_antrenor FROM antrenori WHERE nume_antrenor LIKE 'A%';

SELECT nume_membru, prenume_membru
FROM membrii
WHERE data_inscrierii < TO_DATE('01-JAN-2023', 'DD-MON-YYYY');

SELECT nume_curs FROM cursuri WHERE zile_curs LIKE '%Luni%';

SELECT nume_curs, ora_incepere
FROM cursuri
WHERE ora_incepere BETWEEN '08:00' AND '12:00';

SELECT metoda_plata, SUM(suma_platita) AS total_plata
FROM plati
GROUP BY metoda_plata;

SELECT nume_antrenor, experientaAntrenor,
       CASE 
           WHEN experientaAntrenor BETWEEN 0 AND 3 THEN 'Mediu'
           WHEN experientaAntrenor BETWEEN 4 AND 6 THEN 'Avansat'
           ELSE 'Expert'
       END nivel_experienta
FROM antrenori;

SELECT id_plata, suma_platita, status_plata,
       CASE 
           WHEN status_plata = 'Restant' THEN suma_platita * 1.10  
           ELSE suma_platita 
       END Penalizare
FROM plati;

SELECT tip_acces, SUM(pret_abonament) AS suma_totala_abonamente
FROM abonamente
GROUP BY tip_acces;

SELECT specializare, AVG(salariuAntrenor) AS salariu_mediu
FROM antrenori
GROUP BY specializare;

CREATE OR REPLACE VIEW nume_antrenor
AS SELECT * FROM antrenori
WHERE programAntrenor='Full-time';
SELECT * FROM nume_antrenor;
UPDATE nume_antrenor
SET salariuAntrenor= salariuAntrenor + 100;

SELECT * FROM nume_antrenor;

SELECT * FROM membrii WHERE nume_membru= 'Cotoi';

CREATE INDEX idx_numeMembru ON membrii(nume_membru);
SELECT * FROM membrii WHERE nume_membru= 'Cotoi';






