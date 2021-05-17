--CREATE DATABASE MagazynGier;
/*CREATE TABLE Gry_INFO
(
IDgry int UNIQUE NOT NULL,
gra char(55),
liczba_gier_w_magazynie int NOT NULL,
rok_produkcji VARCHAR(4) NOT NULL,
wielkosc_pudelka char(6) NOT NULL,
zainteresowanie_w_swiecie char(8) NOT NULL,
nazwa_producenta char(10) NOT NULL,
PRIMARY KEY (IDgry)
);*/

/*INSERT INTO Gry_INFO VALUES (1,'Monopoly',30,1935,'30x30','du¿e','Hasbro');
INSERT INTO Gry_INFO VALUES (2,'Kolejka',44,1980,'20x20','œrednie','Omega');
INSERT INTO Gry_INFO VALUES (3,'Galaktyka: Gra o Tron',11,1960,'25x25','znikome','Granna');
INSERT INTO Gry_INFO VALUES (4,'5 sekund',120,2006,'35x35','du¿e','Granna');
INSERT INTO Gry_INFO VALUES (5,'Dixit',13,2001,'21x32','ma³e','Omega');
INSERT INTO Gry_INFO VALUES (6,'Spartakus Krew i Zdrada',11,2010,'32x34','œrednie','Granna');
INSERT INTO Gry_INFO VALUES (7,'Taboo',16,2017,'24x24','znikome','Omega');
INSERT INTO Gry_INFO VALUES (8,'Scythe',13,1999,'21x32','du¿e','Hasbro');
INSERT INTO Gry_INFO VALUES (9,'Ego',19,2010,'32x34','ma³e','Omega');
INSERT INTO Gry_INFO VALUES (10,'Robinson Crusoe: Przygoda na przeklêtej wyspie',16,2017,'24x24','œrednie','Hasbro');
*/
/*CREATE TRIGGER pierwszyTrigger ON dbo.Gry_INFO AFTER UPDATE
AS
if UPDATE(rok_produkcji)
BEGIN

raiserror('Nie mo¿na zmieniæ roku produkcji gry!',0,0)
rollback

END*/
/*UPDATE Gry_INFO
SET rok_produkcji=1965 WHERE IDgry=1*/

/*CREATE TABLE ProducenciGier
(
IDProducenta int UNIQUE NOT NULL,
nazwa_producenta char(10) NOT NULL,
produkowane_gry  varchar(130) NOT NULL,
rynki_zbytu char(50) NOT NULL,
PRIMARY KEY (IDProducenta)
);*/

/*CREATE TRIGGER trzeciTrigger ON ProducenciGier AFTER INSERT
AS
BEGIN 
print('Dokonano zmian w tabeli o godzinie '+FORMAT(GETDATE(),'hh:mm'))
END
*/


/*INSERT INTO ProducenciGier VALUES(01,'Hasbro','Monopoly, Robinson Crusoe: Przygoda na przeklêtej wyspie, Scythe','Europa, Azja');
INSERT INTO ProducenciGier VALUES(02,'Granna','Galaktyka: Gra o Tron,Spartakus Krew i Zdrada,5 sekund','Europa, Australia, Ameryka Pó³nocna');
INSERT INTO ProducenciGier VALUES(03,'Omega','Taboo, Kolejka, Ego, Dixit','Europa, Australia, Ameryka Pó³nocna, Antaktyda');
*/

/*CREATE VIEW [V1] 
AS
SELECT rok_produkcji, minimalna_liczba_graczy FROM Gry_INFO, Wiecej_INFORMACJI
WHERE (Gry_INFO.IDgry = Wiecej_INFORMACJI.IDgry) AND (minimalna_liczba_graczy >=2) AND (zainteresowanie_w_swiecie ='du¿e')
*/

--SELECT * FROM [V1]

/*CREATE TABLE Monopoly
(
minimalna_liczba_graczy int NOT NULL,
zasady char(800) NOT NULL,
zainteresowanie_klientow_w_tygodniu char(15) NOT NULL,
min_wiek_graczy int NOT NULL,
czas_gry_w_minutach int NOT NULL,
IDgry int NOT NULL,
FOREIGN KEY (IDgry) REFERENCES Gry_INFO(IDgry)
);

INSERT INTO Monopoly VALUES(2,'Gra polega na handlu.Zwyciê¿a zawodnik, który doprowadzi do bankructwa pozosta³ych graczy.','przeciêtne',8,60,1);

CREATE TABLE Kolejka
(
minimalna_liczba_graczy int NOT NULL,
zasady char(800) NOT NULL,
zainteresowanie_klientow_w_tygodniu char(15) NOT NULL,
min_wiek_graczy int NOT NULL,
czas_gry_w_minutach int NOT NULL,
IDgry int NOT NULL,
FOREIGN KEY (IDgry) REFERENCES Gry_INFO(IDgry)
);

INSERT INTO Kolejka VALUES(3,'Gra nawi¹zuje do kolejek po podstawowe produkty w sklepach w okresie PRL.','przeciêtne',12,60,2);

CREATE TABLE piec_sekund
(
minimalna_liczba_graczy int NOT NULL,
zasady char(800) NOT NULL,
zainteresowanie_klientow_w_tygodniu char(15) NOT NULL,
min_wiek_graczy int NOT NULL,
czas_gry_w_minutach int NOT NULL,
IDgry int NOT NULL,
FOREIGN KEY (IDgry) REFERENCES Gry_INFO(IDgry)
);

INSERT INTO piec_sekund VALUES(3,'Ka¿dy Gracz tylko 5 sekund, aby odpowiedzieæ na pytanie.','du¿e',8,25,4);

CREATE TABLE Spartakus_Krew_i_Zdrada
(
minimalna_liczba_graczy int NOT NULL,
zasady char(800) NOT NULL,
zainteresowanie_klientow_w_tygodniu char(15) NOT NULL,
min_wiek_graczy int NOT NULL,
czas_gry_w_minutach int NOT NULL,
IDgry int NOT NULL,
FOREIGN KEY (IDgry) REFERENCES Gry_INFO(IDgry)
);

INSERT INTO Spartakus_Krew_i_Zdrada VALUES(3,'Gra nawi¹zuje tamatyk¹ do buntu Spartakusa w staro¿ytnym Rzymie.','ma³e',17,150,6);


CREATE TABLE Taboo
(
minimalna_liczba_graczy int NOT NULL,
zasady char(800) NOT NULL,
zainteresowanie_klientow_w_tygodniu char(15) NOT NULL,
min_wiek_graczy int NOT NULL,
czas_gry_w_minutach int NOT NULL,
IDgry int NOT NULL,
FOREIGN KEY (IDgry) REFERENCES Gry_INFO(IDgry)
);

INSERT INTO Taboo VALUES(4,'W ka¿dej rundzie jeden gracz bierze podstawkê z kartami i w okreœlonym czasie stara siê opisaæ jak najwiêcej hase³.','du¿e',12,60,7);

CREATE TABLE Scythe
(
minimalna_liczba_graczy int NOT NULL,
zasady char(800) NOT NULL,
zainteresowanie_klientow_w_tygodniu char(15) NOT NULL,
min_wiek_graczy int NOT NULL,
czas_gry_w_minutach int NOT NULL,
IDgry int NOT NULL,
FOREIGN KEY (IDgry) REFERENCES Gry_INFO(IDgry)
);

INSERT INTO Scythe VALUES(1,'Celem gracza jest sprawiæ, by jego frakcja sta³a siê najbogatsza i najsilniejsza we Wschodniej Europie.','du¿e',14,85,8);

CREATE TABLE Ego
(
minimalna_liczba_graczy int NOT NULL,
zasady char(800) NOT NULL,
zainteresowanie_klientow_w_tygodniu char(15) NOT NULL,
min_wiek_graczy int NOT NULL,
czas_gry_w_minutach int NOT NULL,
IDgry int NOT NULL,
FOREIGN KEY (IDgry) REFERENCES Gry_INFO(IDgry)
);

INSERT INTO Ego VALUES(2,'Zadaniem graczy jest odgadniêcie odpowiedzi rozgrywaj¹ce na wylosowane pytanie.','ma³e',14,40,9);

CREATE TABLE GalaktaGraoTron
(
minimalna_liczba_graczy int NOT NULL,
zasady char(800) NOT NULL,
zainteresowanie_klientow_w_tygodniu char(15) NOT NULL,
min_wiek_graczy int NOT NULL,
czas_gry_w_minutach int NOT NULL,
IDgry int NOT NULL,
FOREIGN KEY (IDgry) REFERENCES Gry_INFO(IDgry)
);

INSERT INTO GalaktaGraoTron VALUES(3,'W Grze o Tron gracze obejmuj¹ w³adzê nad jednym z szeœciu wielkich Rodów. Mobilizuj¹ armie, podbijaj¹ przyleg³e ziemie i zawieraj¹ przymierza','przeciêtne',14,180,3);

CREATE TABLE RobinsonCrusoe_Przygodanaprzekletejwyspie
(
minimalna_liczba_graczy int NOT NULL,
zasady char(800) NOT NULL,
zainteresowanie_klientow_w_tygodniu char(15) NOT NULL,
min_wiek_graczy int NOT NULL,
czas_gry_w_minutach int NOT NULL,
IDgry int NOT NULL,
FOREIGN KEY (IDgry) REFERENCES Gry_INFO(IDgry)
);

INSERT INTO RobinsonCrusoe_Przygodanaprzekletejwyspie VALUES(1,'Wciel siê w rolê jednego z czterech cz³onków za³ogi statku (kucharza, stolarza, odkrywcy lub ¿o³nierza), jego zadaniem jest prze¿ycie.','przweciêtne',10,97,10);

CREATE TABLE Dixit
(
minimalna_liczba_graczy int NOT NULL,
zasady char(800) NOT NULL,
zainteresowanie_klientow_w_tygodniu char(15) NOT NULL,
min_wiek_graczy int NOT NULL,
czas_gry_w_minutach int NOT NULL,
IDgry int NOT NULL,
FOREIGN KEY (IDgry) REFERENCES Gry_INFO(IDgry)
);

INSERT INTO Dixit VALUES(3,'Ka¿dy z pozosta³ych graczy wybiera teraz w sekrecie jedn¹ ze swoich 6 kart, którajego zdaniem najlepiej ilustruje skojarzenie wypowiedziane przez narratora. ','ma³e',8,60,5);
*/


/*CREATE TABLE Wiecej_INFORMACJI
(
minimalna_liczba_graczy int NOT NULL,
zasady char(800) NOT NULL,
zainteresowanie_klientow_w_tygodniu char(15) NOT NULL,
min_wiek_graczy int NOT NULL,
czas_gry_w_minutach int NOT NULL,
IDgry int NOT NULL,
FOREIGN KEY (IDgry) REFERENCES Gry_INFO(IDgry)
);
*/


/*CREATE PROCEDURE DODAJ_GRY
AS
BEGIN
INSERT INTO Wiecej_INFORMACJI
SELECT * FROM Monopoly

INSERT INTO Wiecej_INFORMACJI
SELECT * FROM Kolejka

INSERT INTO Wiecej_INFORMACJI
SELECT * FROM piec_sekund

INSERT INTO Wiecej_INFORMACJI
SELECT * FROM Spartakus_Krew_i_Zdrada

INSERT INTO Wiecej_INFORMACJI
SELECT * FROM Taboo

INSERT INTO Wiecej_INFORMACJI
SELECT * FROM Scythe

INSERT INTO Wiecej_INFORMACJI
SELECT * FROM Ego

INSERT INTO Wiecej_INFORMACJI
SELECT * FROM GalaktaGraoTron

INSERT INTO Wiecej_INFORMACJI
SELECT * FROM RobinsonCrusoe_Przygodanaprzekletejwyspie

INSERT INTO Wiecej_INFORMACJI
SELECT * FROM Dixit

END

GO
*/

--EXEC DODAJ_GRY

/*CREATE PROCEDURE POKAZ_STARE_I_POPULARNE_GRY
AS
SELECT IDgry,gra FROM Gry_INFO
WHERE rok_produkcji<2000 AND zainteresowanie_w_swiecie='du¿e';
GO
*/

--EXEC POKAZ_STARE_I_POPULARNE_GRY

/*CREATE PROCEDURE AKTUALIZACJA @producent char(50), @nowy_rynek char(50)
AS

BEGIN
UPDATE ProducenciGier SET rynki_zbytu=@nowy_rynek
WHERE nazwa_producenta=@producent
END*/

--EXEC AKTUALIZACJA @producent = 'Hasbro', @nowy_rynek = 'Antarktyda'

--SELECT rynki_zbytu FROM ProducenciGier;

/*CREATE FUNCTION POKAZ_ILOSC_GIER (@wartosc AS INT)
RETURNS INT
AS

BEGIN

DECLARE @ilosc AS INT
SET @ilosc=0
SELECT @ilosc+=liczba_gier_w_magazynie FROM dbo.Gry_INFO; 

RETURN @ilosc;

END

GO*/

--SELECT dbo.POKAZ_ILOSC_GIER(1) 

/*CREATE FUNCTION ROZMIAR(@nazwa varchar(55))
RETURNS char(20)
AS
BEGIN
        declare @wynik char(20)
        set @wynik =  (select wielkosc_pudelka from Gry_INFO where gra like @nazwa);
        return @wynik;
END
go*/

--SELECT dbo.ROZMIAR('Kolejka')

/*CREATE FUNCTION CZY_DYSTRYBUCJA_W_AFRYCE(@id int)
RETURNS char(50)
AS
BEGIN
declare @k2 char(50);
declare @k3 char(50);
set @k3 = 'Gra jest dystrybouwana równie¿ w Afryce'
set @k2 = (SELECT IDProducenta FROM ProducenciGier WHERE @id = IDProducenta AND rynki_zbytu LIKE '%Afryka%');
	return @k3;

END
go*/

--SELECT dbo.CZY_DYSTRYBUCJA_W_AFRYCE(1)



/*CREATE TRIGGER drugiTrigger ON dbo.Wiecej_INFORMACJI 
FOR DELETE
AS
DELETE FROM Wiecej_INFORMACJI
print('pomyœlnie usuniêto dane')*/

--DELETE FROM Wiecej_INFORMACJI WHERE IDgry = 3; 


/*CREATE VIEW [V2]
AS
SELECT IDgry,gra,rynki_zbytu 
FROM Gry_INFO,ProducenciGier
WHERE (Gry_INFO.nazwa_producenta = ProducenciGier.nazwa_producenta) AND (Gry_INFO.wielkosc_pudelka NOT LIKE '%20%');
*/
--SELECT * FROM [V2]


/*CREATE VIEW [V3] 
AS
SELECT IDProducenta,nazwa_producenta,rynki_zbytu FROM ProducenciGier
WHERE nazwa_producenta NOT LIKE '%Hasbro%'
*/

SELECT * FROM [V3]

