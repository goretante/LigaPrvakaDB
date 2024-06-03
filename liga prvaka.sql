/* 
   -------------------------
       Stvaranje tablica
   -------------------------
*/

CREATE TABLE Organizacija (
  ID_organizacije 		CHAR(11) PRIMARY KEY,
  predsjednik			CHAR(50),
  ime 					CHAR(50),
  web_stranica 			CHAR(100),
  adresa 				CHAR(100),
  br_zaposlenih 		INT,
  nositelj_naslova 		CHAR(50)
);

CREATE TABLE Tim (
  ID_tima 				CHAR(11) PRIMARY KEY,
  naziv 				CHAR(50),
  ID_organizacije 		CHAR(11) REFERENCES Organizacija(ID_organizacije)
);

CREATE TABLE Igrac (
  ID_igraca 			CHAR(11) PRIMARY KEY,
  ime 					CHAR(30),
  prezime 				CHAR(30),
  pozicija 				CHAR(50),
  datum_rodenja 		DATE,
  nacionalnost 			CHAR(50)
);

CREATE TABLE Trener (
  ID_trenera 			CHAR(11) PRIMARY KEY,
  ime 					CHAR(30),
  prezime 				CHAR(30),
  datum_rodenja 		DATE,
  nacionalnost 			CHAR(50)
);

CREATE TABLE Utakmica (
  ID_utakmice 			CHAR(11) PRIMARY KEY,
  datum_vrijeme 		TIMESTAMP,
  faza 					CHAR(50),
  broj_golova 			INT,
  ID_organizacije 		CHAR(11) REFERENCES Organizacija(ID_organizacije)
);

CREATE TABLE Sudac (
  ID_suca 				CHAR(11) PRIMARY KEY,
  ime 					CHAR(30),
  prezime 				CHAR(30),
  datum_rodenja			DATE,
  nacionalnost 			CHAR(50),
  ID_organizacije 		CHAR(11) REFERENCES Organizacija(ID_organizacije)
);

CREATE TABLE TimIgrac (
  ID_tima             CHAR(11) REFERENCES Tim(ID_tima),
  ID_igraca           CHAR(11) REFERENCES Igrac(ID_igraca),
  datum_pocetka       DATE,
  datum_zavrsetka     DATE,
  PRIMARY KEY         (ID_tima, ID_igraca)
);

CREATE TABLE TimTrener (
  ID_tima             CHAR(11) REFERENCES Tim(ID_tima),
  ID_trenera          CHAR(11) REFERENCES Trener(ID_trenera),
  datum_pocetka       DATE,
  datum_zavrsetka     DATE,
  PRIMARY KEY         (ID_tima, ID_trenera)
);

CREATE TABLE TimUtakmica (
  ID_tima 				CHAR(11) REFERENCES Tim(ID_tima),
  ID_utakmice 			CHAR(11) REFERENCES Utakmica(ID_utakmice),
  domaci 				BOOLEAN,
  gost 					BOOLEAN,
  PRIMARY KEY 			(ID_tima, ID_utakmice)
);

CREATE TABLE IgracUtakmica (
  ID_igraca 			CHAR(11) REFERENCES Igrac(ID_igraca),
  ID_utakmice 			CHAR(11) REFERENCES Utakmica(ID_utakmice),
  br_golova 			INT,
  br_u_okvir 			INT,
  br_prema_golu 		INT,
  br_obrana 			INT,
  br_prekrsaja 			INT,
  br_zaleda 			INT,
  br_zutih 				INT,
  br_crvenih 			INT,
  vrijeme_ulaska 		TIME,
  vrijeme_izlaska 		TIME,
  PRIMARY KEY 			(ID_igraca, ID_utakmice)
);

CREATE TABLE UtakmicaSudac (
  ID_utakmice 			CHAR(11) REFERENCES Utakmica(ID_utakmice),
  ID_suca 				CHAR(11) REFERENCES Sudac(ID_suca),
  uloga 				CHAR(50),
  PRIMARY KEY 			(ID_utakmice, ID_suca)
);

/*
   ------------------------------------
       Brisanje čitavih tablica
   ------------------------------------
*/
   
   DROP TABLE igrac, igracutakmica, organizacija, sudac, tim, timigrac, timtrener, timutakmica, trener, utakmica, utakmicasudac
  
/* 
   ------------------------------------
       Brisanje podataka iz tablica
   ------------------------------------
*/


TRUNCATE TABLE TimIgrac, TimTrener, TimUtakmica, IgracUtakmica, UtakmicaSudac, Igrac, Trener, Sudac, Tim, Utakmica, Organizacija;
TRUNCATE TABLE IgracUtakmica;

/* 
   -------------------------------
       Unos podataka u tablice
   -------------------------------
*/


-- ORGANIZACIJA
INSERT INTO Organizacija (ID_organizacije, predsjednik, ime, web_stranica, adresa, br_zaposlenih, nositelj_naslova)
VALUES
('ORG00000001', 'Aleksander Čeferin', 'UEFA', 'www.uefa.com', 'Nyon, Switzerland', 1000, 'Manchester City');


-- TIMOVI
INSERT INTO Tim (ID_tima, naziv, ID_organizacije)
VALUES
('TIM00000001', 'Bayern München', 'ORG00000001'),
('TIM00000002', 'Paris Saint-Germain', 'ORG00000001'),
('TIM00000003', 'Manchester City', 'ORG00000001'),
('TIM00000004', 'Borrusia Dortmund', 'ORG00000001'),
('TIM00000005', 'Liverpool', 'ORG00000001'),
('TIM00000006', 'Real Madrid', 'ORG00000001'),
('TIM00000007', 'Chelsea', 'ORG00000001'),
('TIM00000008', 'Porto', 'ORG00000001');


-- IGRAČI
INSERT INTO Igrac (ID_igraca, ime, prezime, pozicija, datum_rodenja, nacionalnost)
VALUES
-- BAYERN MUNCHEN
('PLR00000001', 'Manuel', 'Neuer', 'Goalkeeper', '1986-03-27', 'Germany'),
('PLR00000002', 'Lucas', 'Hernández', 'Defender', '1996-02-14', 'France'),
('PLR00000003', 'David', 'Alaba', 'Defender', '1992-06-24', 'Austria'),
('PLR00000004', 'Niklas', 'Süle', 'Defender', '1995-09-30', 'Germany'),
('PLR00000005', 'Benjamin', 'Pavard', 'Defender', '1996-03-28', 'France'),
('PLR00000006', 'Leon', 'Goretzka', 'Midfielder', '1995-02-06', 'Germany'),
('PLR00000007', 'Joshua', 'Kimmich', 'Midfielder', '1995-02-08', 'Germany'),
('PLR00000008', 'Kingsley', 'Coman', 'Midfielder', '1996-06-13', 'France'),
('PLR00000009', 'Thomas', 'Müller', 'Midfielder', '1989-09-13', 'Germany'),
('PLR00000010', 'Leroy', 'Sané', 'Midfielder', '1996-03-28', 'Germany'),
('PLR00000011', 'Eric Maxim', 'Choupo-Moting', 'Forward', '1989-03-23', 'Cameroon'),
('PLR00000012', 'Alphonso', 'Davies', 'Defender', '2000-11-02', 'Canada'),
('PLR00000013', 'Jérôme', 'Boateng', 'Defender', '1988-09-03', 'Germany'),
('PLR00000014', 'Alexander', 'Nübel', 'Goalkeeper', '1996-09-30', 'Germany'),
('PLR00000015', 'Bouna', 'Sarr', 'Defender', '1992-01-31', 'Senegal'),
('PLR00000016', 'Tanguy', 'Nianzou', 'Defender', '2002-06-07', 'France'),
('PLR00000017', 'Jamal', 'Musiala', 'Midfielder', '2003-02-26', 'Germany'),
('PLR00000018', 'Javi', 'Martínez', 'Midfielder', '1988-09-02', 'Spain'),

-- PSG
('PLR00000019', 'Keylor', 'Navas', 'Goalkeeper', '1986-12-15', 'Costa Rica'),
('PLR00000020', 'Abdou', 'Diallo', 'Defender', '1996-05-04', 'Senegal'),
('PLR00000021', 'Presnel', 'Kimpembe', 'Defender', '1995-08-13', 'France'),
('PLR00000022', 'Marcos Aoás', 'Corrêa Marquinhos', 'Defender', '1994-05-14', 'Brazil'),
('PLR00000023', 'Colin', 'Dagba', 'Defender', '1998-09-09', 'France'),
('PLR00000024', 'Idrissa', 'Gueye', 'Midfielder', '1989-09-26', 'Senegal'),
('PLR00000025', 'Danilo', 'Pereira', 'Defender', '1991-09-09', 'Portugal'),
('PLR00000026', 'Julian', 'Draxler', 'Midfielder', '1993-09-20', 'Germany'),
('PLR00000027', 'Neymar', 'da Silva Santos Júnior', 'Midfielder', '1992-02-05', 'Brazil'),
('PLR00000028', 'Ángel', 'Di María', 'Midfielder', '1988-02-14', 'Argentina'),
('PLR00000029', 'Kylian', 'Mbappé', 'Forward', '1998-12-20', 'France'),
('PLR00000030', 'Ander', 'Herrera', 'Midfielder', '1989-08-14', 'Spain'),
('PLR00000031', 'Mitchel', 'Bakker', 'Midfielder', '2000-06-20', 'Netherlands'),
('PLR00000032', 'Moise', 'Kean', 'Forward', '2000-02-28', 'Italy'),
('PLR00000033', 'Rafinha', 'Alcântara', 'Midfielder', '1993-02-12', 'Brazil'),
('PLR00000034', 'Alexandre', 'Letellier', 'Goalkeeper', '1990-12-11', 'France'),
('PLR00000035', 'Sergio', 'Rico', 'Goalkeeper', '1993-09-01', 'Spain'),
('PLR00000036', 'Thilo', 'Kehrer', 'Midfielder', '1996-09-21', 'Germany'),
('PLR00000037', 'Leandro', 'Paredes', 'Midfielder', '1994-06-19', 'Argentina'),

-- MANCHESTER CITY
('PLR00000038', 'Ederson', 'Santana de Moraes', 'Goalkeeper', '1993-08-17', 'Brazil'),
('PLR00000039', 'Kyle', 'Walker', 'Defender', '1990-05-28', 'England'),
('PLR00000040', 'John', 'Stones', 'Defender', '1994-05-28', 'England'),
('PLR00000041', 'Rúben', 'Dias', 'Defender', '1997-05-14', 'Portugal'),
('PLR00000042', 'João', 'Cancelo', 'Defender', '1994-05-27', 'Portugal'),
('PLR00000043', 'Rodrigo', 'Hernández Cascante', 'Midfielder', '1996-06-22', 'Spain'),
('PLR00000044', 'İlkay', 'Gündoğan', 'Midfielder', '1990-10-24', 'Germany'),
('PLR00000045', 'Riyad', 'Mahrez', 'Midfielder', '1991-02-21', 'Algeria'),
('PLR00000046', 'Kevin', 'De Bruyne', 'Midfielder', '1991-06-28', 'Belgium'),
('PLR00000047', 'Phil', 'Foden', 'Midfielder', '2000-05-28', 'England'),
('PLR00000048', 'Bernardo', 'Silva', 'Midfielder', '1994-08-10', 'Portugal'),
('PLR00000049', 'Gabriel', 'Jesus', 'Forward', '1997-04-03', 'Brazil'),
('PLR00000050', 'James', 'Trafford', 'Goalkeeper', '2002-10-10', 'England'),
('PLR00000051', 'Zack', 'Steffen', 'Goalkeeper', '1995-04-02', 'United States of America'),
('PLR00000052', 'Nathan', 'Aké', 'Defender', '1995-02-18', 'Netherlands'),
('PLR00000053', 'Aymeric', 'Laporte', 'Defender', '1994-05-27', 'Spain'),
('PLR00000054', 'Benjamin', 'Mendy', 'Defender', '1994-07-17', 'France'),
('PLR00000055', 'Oleksandr', 'Zinchenko', 'Defender', '1996-12-15', 'Ukraine'),
('PLR00000056', 'Eric', 'García', 'Defender', '2001-01-09', 'Spain'),
('PLR00000075', 'Raheem', 'Sterling', 'Midfielder', '1994-12-08', 'England'),

-- BORRUSIA DORTMUND
('PLR00000057', 'Marwin', 'Hitz', 'Goalkeeper', '1987-09-18', 'Switzerland'),
('PLR00000058', 'Raphaël', 'Guerreiro', 'Defender', '1993-12-22', 'Portugal'),
('PLR00000059', 'Mats', 'Hummels', 'Defender', '1988-12-16', 'Germany'),
('PLR00000060', 'Manuel', 'Akanji', 'Defender', '1995-07-19', 'Switzerland'),
('PLR00000061', 'Mateu', 'Morey', 'Defender', '2000-03-02', 'Spain'),
('PLR00000062', 'Mahmoud', 'Dahoud', 'Midfielder', '1996-01-01', 'Syria'),
('PLR00000063', 'Emre', 'Can', 'Midfielder', '1994-01-12', 'Germany'),
('PLR00000064', 'Jude', 'Bellingham', 'Midfielder', '2003-07-29', 'England'),
('PLR00000065', 'Marco', 'Reus', 'Midfielder', '1989-05-31', 'Germany'),
('PLR00000066', 'Erling', 'Haaland', 'Forward', '2000-07-21', 'Norway'),
('PLR00000067', 'Ansgar', 'Knauff', 'Defender', '2002-01-10', 'Germany'),
('PLR00000068', 'Giovanni', 'Reyna', 'Midfielder', '2002-11-13', 'United States of America'),
('PLR00000069', 'Thomas', 'Meunier', 'Defender', '1991-09-12', 'Belgium'),
('PLR00000070', 'Thomas', 'Delaney', 'Midfielder', '1991-09-03', 'Denmark'),
('PLR00000071', 'Roman', 'Bürki', 'Goalkeeper', '1990-11-14', 'Switzerland'),
('PLR00000072', 'Stefan', 'Drljača', 'Goalkeeper', '1999-04-20', 'Germany'),
('PLR00000073', 'Łukasz', 'Piszczek', 'Defender', '1985-06-03', 'Poland'),
('PLR00000074', 'Nico', 'Schulz', 'Defender', '1993-04-01', 'Germany'),
('PLR00000076', 'Steffen', 'Tigges', 'Forward', '1998-07-31', 'Germany'),
('PLR00000077', 'Thorgan', 'Hazard', 'Forward', '1993-03-29', 'Belgium'),
('PLR00000078', 'Julian', 'Brandt', 'Midfielder', '1996-05-02', 'Germany'),

-- LIVERPOOL
('PLR00000079', 'Alisson Ramses', 'Becker', 'Goalkeeper', '1992-10-02', 'Brazil'),
('PLR00000080', 'Andrew', 'Robertson', ' Defender', '1994-03-11', 'Scotland'),
('PLR00000081', 'Ozan', 'Kabak', 'Defender', '2000-03-25', 'Turkey'),
('PLR00000082', 'Nathaniel', 'Phillips', 'Defender', '1997-03-21', 'England'),
('PLR00000083', 'Trent', 'Alexander-Arnold', 'Defender', '1998-10-07', 'England'),
('PLR00000084', 'Georginio', 'Wijnaldum', 'Midfielder', '1990-11-11', 'Netherlands'),
('PLR00000085', 'Fabinho', 'Tavares', 'Midfielder', '1993-10-23', 'Brazil'),
('PLR00000086', 'Naby', 'Keïta', 'Midfielder', '1995-02-10', 'Guinea'),
('PLR00000087', 'Sadio', 'Mané', 'Forward', '1992-04-10', 'Senegal'),
('PLR00000088', 'Diogo', 'Jota', 'Forward', '1996-12-04', 'Portugal'),
('PLR00000089', 'Mohamed', 'Salah', 'Forward', '1992-06-15', 'Egypt'),
('PLR00000090', 'Thiago', 'Alcântara', 'Midfielder', '1991-04-11', 'Spain'),
('PLR00000091', 'Xherdan', 'Shaqiri', 'Midfielder', '1991-10-10', 'Switzerland'),
('PLR00000092', 'Roberto', 'Firmino', 'Forward', '1991-10-02', 'Brazil'),
('PLR00000093', 'Adrian', 'San Miguel', 'Goalkeeper', '1987-01-03', 'Spain'),
('PLR00000094', 'Harvey', 'Davies', 'Goalkeeper', '2003-09-03', 'England'),
('PLR00000095', 'Konstantinos', 'Tsimikas', 'Defender', '1996-05-12', 'Greece'),
('PLR00000112', 'James', 'Milner', 'Midfielder', '1986-01-04', 'England'),
('PLR00000113', 'Alex', 'Oxlade-Chamberlain', 'Midfielder', '1993-08-15', 'England'),

-- REAL MADRID
('PLR00000096', 'Thibaut', 'Courtois', 'Goalkeeper', '1992-05-11', 'Belgium'),
('PLR00000097', 'Lucas', 'Vázquez', 'Defender', '1991-07-01', 'Spain'),
('PLR00000098', 'Éder', 'Militão', 'Defender', '1998-01-18', 'Brazil'),
('PLR00000099', 'Nacho', 'Fernández', 'Defender', '1990-01-18', 'Spain'),
('PLR00000100', 'Ferland', 'Mendy', 'Defender', '1995-06-08', 'France'),
('PLR00000101', 'Luka', 'Modrić', 'Midfielder', '1985-09-09', 'Croatia'),
('PLR00000102', 'Casemiro', 'Tavares', 'Midfielder', '1992-02-23', 'Brazil'),
('PLR00000103', 'Toni', 'Kroos', 'Midfielder', '1990-01-04', 'Germany'),
('PLR00000104', 'Marco', 'Asensio', 'Forward', '1996-01-21', 'Spain'),
('PLR00000105', 'Karim', 'Benzema', 'Forward', '1987-12-19', 'France'),
('PLR00000106', 'Vinícius', 'Júnior', 'Forward', '2000-07-12', 'Brazil'),
('PLR00000107', 'Federico', 'Valverde', 'Midfielder', '1998-07-22', 'Uruguay'),
('PLR00000108', 'Rodrygo', 'Goes', 'Forward', '2001-01-09', 'Brazil'),
('PLR00000109', 'Andriy', 'Lunin', 'Goalkeeper', '1999-02-11', 'Ukraine'),
('PLR00000110', 'Diego', 'Altube', 'Goalkeeper', '2000-02-22', 'Spain'),
('PLR00000111', 'Marcelo', 'Vieira', 'Defender', '1988-05-12', 'Brazil'),
('PLR00000114', 'Álvaro', 'Odriozola', 'Defender', '1995-12-14', 'Spain'),
('PLR00000115', 'Francisco', 'Suárez', 'Midfielder', '1992-04-21', 'Spain'),

-- CHELSEA
('PLR00000116', 'Édouard', 'Mendy', 'Goalkeeper', '1992-03-01', 'Senegal'),
('PLR00000117', 'Antonio', 'Rüdiger', 'Defender', '1993-03-03', 'Germany'),
('PLR00000118', 'Thiago', 'Silva', 'Defender', '1984-09-22', 'Brazil'),
('PLR00000119', 'César', 'Azpilicueta', 'Defender', '1989-08-28', 'Spain'),
('PLR00000120', 'Andreas', 'Christensen', 'Defender', '1996-04-10', 'Denmark'),
('PLR00000121', 'Ben', 'Chilwell', 'Defender', '1996-12-21', 'England'),
('PLR00000122', 'Reece', 'James', 'Defender', '1999-12-08', 'England'),
('PLR00000123', 'Jorginho', 'Frello', 'Midfielder', '1991-12-20', 'Italy'),
('PLR00000124', 'Ngolo', 'Kanté', 'Midfielder', '1991-03-29', 'France'),
('PLR00000125', 'Mateo', 'Kovačić', 'Midfielder', '1994-05-06', 'Croatia'),
('PLR00000126', 'Mason', 'Mount', 'Midfielder', '1999-01-10', 'England'),
('PLR00000127', 'Kai', 'Havertz', 'Midfielder', '1999-06-11', 'Germany'),
('PLR00000128', 'Christian', 'Pulisic', 'Forward', '1998-09-18', 'United States of America'),
('PLR00000129', 'Timo', 'Werner', 'Forward', '1996-03-06', 'Germany'),
('PLR00000130', 'Olivier', 'Giroud', 'Forward', '1986-09-30', 'France'),
('PLR00000131', 'Hakim', 'Ziyech', 'Midfielder', '1993-03-19', 'Morocco'),
('PLR00000132', 'Callum', 'Hudson-Odoi', 'Midfielder', '2000-11-07', 'England'),
('PLR00000133', 'Kepa', 'Arrizabalaga', 'Goalkeeper', '1994-10-03', 'Spain'),

-- PORTO
('PLR00000134', 'Agustín', 'Marchesín', 'Goalkeeper', '1988-03-16', 'Argentina'),
('PLR00000135', 'Pepe', 'Ferreira', 'Defender', '1983-02-26', 'Portugal'),
('PLR00000136', 'Chancel', 'Mbemba', 'Defender', '1994-08-08', 'DR Congo'),
('PLR00000137', 'Zaidu', 'Sanusi', 'Defender', '1997-06-13', 'Nigeria'),
('PLR00000138', 'Wilson', 'Manafá', 'Defender', '1994-07-23', 'Portugal'),
('PLR00000139', 'Mateus', 'Uribe', 'Midfielder', '1991-03-21', 'Colombia'),
('PLR00000140', 'Sérgio', 'Oliveira', 'Midfielder', '1992-06-02', 'Portugal'),
('PLR00000141', 'Jesús', 'Corona', 'Midfielder', '1993-01-06', 'Mexico'),
('PLR00000142', 'Otávio', 'Monteiro', 'Midfielder', '1995-02-09', 'Portugal'),
('PLR00000143', 'Moussa', 'Marega', 'Forward', '1991-04-14', 'Mali'),
('PLR00000144', 'Luis', 'Díaz', 'Forward', '1997-01-13', 'Colombia'),
('PLR00000145', 'Mehdi', 'Taremi', 'Forward', '1992-07-18', 'Iran'),
('PLR00000146', 'Cláudio', 'Ramos', 'Goalkeeper', '1991-11-16', 'Portugal'),
('PLR00000147', 'Iván', 'Marcano', 'Defender', '1987-06-23', 'Spain'),
('PLR00000148', 'Fábio', 'Vieira', 'Midfielder', '2000-05-30', 'Portugal'),
('PLR00000149', 'Toni', 'Martínez', 'Forward', '1997-06-30', 'Spain');

-- TRENERI
INSERT INTO Trener (ID_trenera, ime, prezime, datum_rodenja, nacionalnost)
VALUES
('COA00000001', 'Hans-Dieter', 'Flick', '1965-02-24', 'Germany'),
('COA00000002', 'Mauricio', 'Pochettino', '1972-03-02', 'Argentina'),
('COA00000003', 'Pep', 'Guardiola', '1971-01-18', 'Spain'),
('COA00000004', 'Edin', 'Terzić', '1982-08-30', 'Germany'),
('COA00000005', 'Jürgen', 'Klopp', '1967-06-16', 'Germany'),
('COA00000006', 'Zinedine', 'Zidane', '1972-06-23', 'France'),
('COA00000007', 'Thomas', 'Tuchel', '1973-08-29', 'Germany'),
('COA00000008', 'Sérgio', 'Conceição', '1974-11-15', 'Portugal');


-- UTAKMICE
INSERT INTO Utakmica (ID_utakmice, datum_vrijeme, faza, broj_golova, ID_organizacije)
VALUES
-- Quarterfinals
('MAT00000001', '2021-04-07 19:00:00', 'Quarterfinal', 5, 'ORG00000001'), -- Bayern Munich 2-3 Paris Saint-Germain
('MAT00000002', '2021-04-13 19:00:00', 'Quarterfinal', 1, 'ORG00000001'), -- Paris Saint-Germain 0-1 Bayern Munich
('MAT00000003', '2021-04-06 19:00:00', 'Quarterfinal', 3, 'ORG00000001'), -- Manchester City 2-1 Borussia Dortmund
('MAT00000004', '2021-04-14 19:00:00', 'Quarterfinal', 3, 'ORG00000001'), -- Borussia Dortmund 1-2 Manchester City
('MAT00000005', '2021-04-06 20:00:00', 'Quarterfinal', 4, 'ORG00000001'), -- Real Madrid 3-1 Liverpool
('MAT00000006', '2021-04-14 20:00:00', 'Quarterfinal', 0, 'ORG00000001'), -- Liverpool 0-0 Real Madrid
('MAT00000007', '2021-04-07 20:00:00', 'Quarterfinal', 4, 'ORG00000001'), -- Porto 0-2 Chelsea
('MAT00000008', '2021-04-13 20:00:00', 'Quarterfinal', 3, 'ORG00000001'), -- Chelsea 0-1 Porto
-- Semifinals
('MAT00000009', '2021-04-27 19:00:00', 'Semifinal', 3, 'ORG00000001'), -- Real Madrid 1-1 Chelsea
('MAT00000010', '2021-05-05 19:00:00', 'Semifinal', 4, 'ORG00000001'), -- Chelsea 2-0 Real Madrid
('MAT00000011', '2021-04-28 19:00:00', 'Semifinal', 3, 'ORG00000001'), -- Paris Saint-Germain 1-2 Manchester City
('MAT00000012', '2021-05-04 19:00:00', 'Semifinal', 4, 'ORG00000001'), -- Manchester City 2-0 Paris Saint-Germain
-- Final
('MAT00000013', '2021-05-29 19:00:00', 'Final', 1, 'ORG00000001'); -- Manchester City 0-1 Chelsea


-- SUCI
INSERT INTO Sudac (ID_suca, ime, prezime, datum_rodenja, nacionalnost, ID_organizacije)
VALUES
-- Quarterfinals
('REF00000001', 'Antonio Miguel Mateu', 'Lahoz', '1977-03-12', 'Spain', 'ORG00000001'), -- Bayern Munich vs Paris Saint-Germain (07/04/2021)
('REF00000002', 'Pau', 'Cebrián Devis', '1977-05-01', 'Spain', 'ORG00000001'), -- Assistant referee
('REF00000003', 'Roberto', 'Díaz Pérez Del Palomar', '1976-04-29', 'Spain', 'ORG00000001'), -- Assistant referee
('REF00000004', 'Daniele', 'Orsato', '1975-11-23', 'Italy', 'ORG00000001'), -- Paris Saint-Germain vs Bayern Munich (13/04/2021)
('REF00000005', 'Alessandro', 'Giallatini', '1975-07-04', 'Italy', 'ORG00000001'), -- Assistant referee
('REF00000006', 'Fabiano', 'Preti', '1978-02-24', 'Italy', 'ORG00000001'), -- Assistant referee
('REF00000007', 'Ovidiu', 'Haţegan', '1980-07-14', 'Romania', 'ORG00000001'), -- Manchester City vs Borussia Dortmund (06/04/2021)
('REF00000008', 'Octavian', 'Șovre', '1973-07-19', 'Romania', 'ORG00000001'), -- Assistant referee
('REF00000009', 'Sebastian', 'Gheorghe', '1976-03-07', 'Romania', 'ORG00000001'), -- Assistant referee
('REF00000010', 'Carlos', 'del Cerro Grande', '1976-03-13', 'Spain', 'ORG00000001'), -- Borussia Dortmund vs Manchester City (14/04/2021)
('REF00000011', 'Juan Carlos', 'Yuste', '1975-09-25', 'Spain', 'ORG00000001'), -- Assistant referee
('REF00000012', 'Roberto Alonso', 'Fernández', '1976-09-18', 'Spain', 'ORG00000001'), -- Assistant referee
('REF00000013', 'Felix', 'Brych', '1975-08-03', 'Germany', 'ORG00000001'), -- Real Madrid vs Liverpool (06/04/2021)
('REF00000014', 'Mark', 'Borsch', '1977-03-29', 'Germany', 'ORG00000001'), -- Assistant referee
('REF00000015', 'Stefan', 'Lupp', '1978-09-09', 'Germany', 'ORG00000001'), -- Assistant referee
('REF00000016', 'Björn', 'Kuipers', '1973-03-28', 'Netherlands', 'ORG00000001'), -- Liverpool vs Real Madrid (14/04/2021)
('REF00000017', 'Sander', 'van Roekel', '1974-12-19', 'Netherlands', 'ORG00000001'), -- Assistant referee
('REF00000018', 'Erwin', 'Zeinstra', '1977-01-31', 'Netherlands', 'ORG00000001'), -- Assistant referee
('REF00000019', 'Slavko', 'Vincic', '1979-11-25', 'Slovenia', 'ORG00000001'), -- Porto vs Chelsea (07/04/2021)
('REF00000020', 'Tomaž', 'Klančnik', '1980-08-20', 'Slovenia', 'ORG00000001'), -- Assistant referee
('REF00000021', 'Andraž', 'Kovačič', '1981-05-02', 'Slovenia', 'ORG00000001'), -- Assistant referee
('REF00000022', 'Clement', 'Turpin', '1982-05-16', 'France', 'ORG00000001'), -- Chelsea vs Porto (13/04/2021)
('REF00000023', 'Nicolas', 'Danos', '1981-01-21', 'France', 'ORG00000001'), -- Assistant referee
('REF00000024', 'Cyril', 'Gringore', '1980-12-06', 'France', 'ORG00000001'), -- Assistant referee
-- Semifinals
('REF00000025', 'Danny', 'Makkelie', '1983-01-28', 'Netherlands', 'ORG00000001'), -- Real Madrid vs Chelsea (27/04/2021)
('REF00000026', 'Mario', 'Diks', '1977-10-02', 'Netherlands', 'ORG00000001'), -- Assistant referee
('REF00000027', 'Hessel', 'Steegstra', '1980-09-29', 'Netherlands', 'ORG00000001'), -- Assistant referee
('REF00000028', 'Daniele', 'Orsato', '1975-11-23', 'Italy', 'ORG00000001'), -- Chelsea vs Real Madrid (05/05/2021)
('REF00000029', 'Alessandro', 'Giallatini', '1975-07-04', 'Italy', 'ORG00000001'), -- Assistant referee
('REF00000030', 'Fabiano', 'Preti', '1978-02-24', 'Italy', 'ORG00000001'), -- Assistant referee
('REF00000031', 'Björn', 'Kuipers', '1973-03-28', 'Netherlands', 'ORG00000001'), -- Paris Saint-Germain vs Manchester City (28/04/2021)
('REF00000032', 'Sander', 'van Roekel', '1974-12-19', 'Netherlands', 'ORG00000001'), -- Assistant referee
('REF00000033', 'Erwin', 'Zeinstra', '1977-01-31', 'Netherlands', 'ORG00000001'), -- Assistant referee
('REF00000034', 'Felix', 'Brych', '1975-08-03', 'Germany', 'ORG00000001'), -- Manchester City vs Paris Saint-Germain (04/05/2021)
('REF00000035', 'Mark', 'Borsch', '1977-03-29', 'Germany', 'ORG00000001'), -- Assistant referee
('REF00000036', 'Stefan', 'Lupp', '1978-09-09', 'Germany', 'ORG00000001'), -- Assistant referee
-- Final
('REF00000037', 'Antonio Miguel Mateu', 'Lahoz', '1977-03-12', 'Spain', 'ORG00000001'), -- Manchester City vs Chelsea (29/05/2021)
('REF00000038', 'Pau', 'Cebrián Devis', '1977-05-01', 'Spain', 'ORG00000001'), -- Assistant referee
('REF00000039', 'Roberto', 'Díaz Pérez Del Palomar', '1976-04-29', 'Spain', 'ORG00000001'); -- Assistant referee


-- VEZA N:M IZMEĐU TIMOVA I IGRAČA
INSERT INTO TimIgrac (ID_tima, ID_igraca, datum_pocetka, datum_zavrsetka)
VALUES
-- IGRAČI BAYERNA
('TIM00000001', 'PLR00000001', '2011-06-01', NULL),				-- Bayern, Manuel Neuer
('TIM00000001', 'PLR00000002', '2019-07-01', '2023-07-09'),		-- Bayern, Lucas Hernández
('TIM00000001', 'PLR00000003', '2010-07-01', '2021-07-01'),		-- Bayern, David Alaba
('TIM00000001', 'PLR00000004', '2017-07-01', '2022-07-01'),		-- Bayern, Niklas Süle
('TIM00000001', 'PLR00000005', '2019-07-01', '2023-08-30'),		-- Bayern, Benjamin Pavard
('TIM00000001', 'PLR00000006', '2018-07-01', NULL),				-- Bayern, Leon Goretzka
('TIM00000001', 'PLR00000007', '2015-07-02', NULL),				-- Bayern, Joshua Kimmich
('TIM00000001', 'PLR00000008', '2015-08-30', NULL),				-- Bayern, Kingsley Coman
('TIM00000001', 'PLR00000009', '2009-07-01', NULL),				-- Bayern, Thomas Müller
('TIM00000001', 'PLR00000010', '2020-07-15', NULL),				-- Bayern, Leroy Sané
('TIM00000001', 'PLR00000011', '2020-10-05', '2024-07-01'),		-- Bayern, Eric Maxim Choupo-Moting
('TIM00000001', 'PLR00000012', '2019-01-01', NULL),				-- Bayern, Alphonso Davies
('TIM00000001', 'PLR00000013', '2011-07-14', '2021-09-01'),		-- Bayern, Jérôme Boateng
('TIM00000001', 'PLR00000014', '2020-07-01', '2023-07-25'),		-- Bayern, Alexander Nübel
('TIM00000001', 'PLR00000015', '2020-10-05', '2024-07-01'),		-- Bayern, Bouna Sarr
('TIM00000001', 'PLR00000016', '2020-07-01', '2022-08-17'),		-- Bayern, Tanguy Nianzou
('TIM00000001', 'PLR00000017', '2020-07-01', NULL),				-- Bayern, Jamal Musiala
('TIM00000001', 'PLR00000018', '2012-08-29', '2021-07-07'),		-- Bayern, Javi Martínez


-- IGRAČI PSGA
('TIM00000002', 'PLR00000019', '2019-09-02', '2024-07-01'),		-- PSG, Keylor Navas
('TIM00000002', 'PLR00000020', '2019-07-16', '2023-08-15'),		-- PSG, Abdou Diallo
('TIM00000002', 'PLR00000021', '2015-07-01', NULL),				-- PSG, Presnel Kimpembe
('TIM00000002', 'PLR00000022', '2013-07-19', NULL),				-- PSG, Marcos Aoás Corrêa Marquinhos
('TIM00000002', 'PLR00000023', '2018-07-01', NULL),				-- PSG, Colin Dagba
('TIM00000002', 'PLR00000024', '2019-07-30', '2022-09-01'),		-- PSG, Idrissa Gueye
('TIM00000002', 'PLR00000025', '2020-08-05', NULL),				-- PSG, Danilo Pereira
('TIM00000002', 'PLR00000026', '2017-01-03', '2023-09-18'),		-- PSG, Julian Draxler
('TIM00000002', 'PLR00000027', '2017-08-03', '2023-08-15'),		-- PSG, Neymar da Silva Santos Júnior
('TIM00000002', 'PLR00000028', '2015-08-06', '2022-07-08'),		-- PSG, Ángel Di María
('TIM00000002', 'PLR00000029', '2017-08-31', '2024-07-01'),		-- PSG, Kylian Mbappé
('TIM00000002', 'PLR00000030', '2019-07-04', '2023-01-31'),		-- PSG, Ander Herrera
('TIM00000002', 'PLR00000031', '2019-07-07', '2021-07-12'),		-- PSG, Mitchel Bakker
('TIM00000002', 'PLR00000032', '2020-10-04', '2021-07-30'),		-- PSG, Moise Kean
('TIM00000002', 'PLR00000033', '2020-05-10', '2022-09-03'),		-- PSG, Rafinha Alcântara
('TIM00000002', 'PLR00000034', '2020-09-25', NULL),				-- PSG, Alexandre Letellier
('TIM00000002', 'PLR00000035', '2020-09-05', NULL),				-- PSG, Sergio Rico
('TIM00000002', 'PLR00000036', '2018-08-16', '2022-08-17'),		-- PSG, Thilo Kehrer
('TIM00000002', 'PLR00000037', '2019-01-29', '2023-08-16'),		-- PSG, Leandro Paredes


-- IGRAČI MAN CITYJA
('TIM00000003', 'PLR00000038', '2017-07-01', NULL),				-- Manchester City, Ederson Santana de Moraes
('TIM00000003', 'PLR00000039', '2017-07-14', NULL),				-- Manchester City, Kyle Walker
('TIM00000003', 'PLR00000040', '2019-09-02', NULL),				-- Manchester City, John Stones
('TIM00000003', 'PLR00000041', '2020-09-29', NULL),				-- Manchester City, Rúben Dias
('TIM00000003', 'PLR00000042', '2019-08-07', NULL),				-- Manchester City, João Cancelo
('TIM00000003', 'PLR00000043', '2019-07-04', NULL),				-- Manchester City, Rodrigo Hernández Cascante
('TIM00000003', 'PLR00000044', '2016-07-01', '2023-07-01'),		-- Manchester City, İlkay Gündoğan
('TIM00000003', 'PLR00000045', '2018-07-10', '2023-07-28'),		-- Manchester City, Riyad Mahrez
('TIM00000003', 'PLR00000046', '2015-08-30', NULL),				-- Manchester City, Kevin De Bruyne
('TIM00000003', 'PLR00000047', '2017-07-01', NULL),				-- Manchester City, Phil Foden
('TIM00000003', 'PLR00000048', '2017-07-01', NULL),				-- Manchester City, Bernardo Silva
('TIM00000003', 'PLR00000049', '2017-01-01', '2022-07-04'),		-- Manchester City, Gabriel Jesus
('TIM00000003', 'PLR00000050', '2019-07-01', '2023-07-20'),		-- Manchester City, James Trafford
('TIM00000003', 'PLR00000051', '2019-07-09', '2024-01-31'),		-- Manchester City, Zack Steffen
('TIM00000003', 'PLR00000052', '2020-08-05', NULL),				-- Manchester City, Nathan Aké
('TIM00000003', 'PLR00000053', '2018-01-30', '2023-08-24'),		-- Manchester City, Aymeric Laporte
('TIM00000003', 'PLR00000054', '2017-07-24', '2023-07-19'),		-- Manchester City, Benjamin Mendy
('TIM00000003', 'PLR00000055', '2016-07-04', '2022-07-22'),		-- Manchester City, Oleksandr Zinchenko
('TIM00000003', 'PLR00000056', '2019-07-01', '2021-07-01'),		-- Manchester City, Eric García
('TIM00000003', 'PLR00000075', '2015-07-14', '2022-07-13'),		-- Manchester City, Raheem Sterling

-- IGRAČI BORRUSIJE
('TIM00000004', 'PLR00000057', '2018-07-01', '2022-07-01'),		-- Borrusia Dortmund, Marwin Hitz
('TIM00000004', 'PLR00000058', '2016-07-01', '2023-07-01'),		-- Borrusia Dortmund, Raphaël Guerreiro
('TIM00000004', 'PLR00000059', '2019-07-01', NULL),				-- Borrusia Dortmund, Mats Hummels
('TIM00000004', 'PLR00000060', '2018-01-15', '2022-09-01'),		-- Borrusia Dortmund, Manuel Akanji
('TIM00000004', 'PLR00000061', '2019-07-01', '2024-07-01'),		-- Borrusia Dortmund, Mateu Morey
('TIM00000004', 'PLR00000062', '2017-07-01', '2023-01-01'),		-- Borrusia Dortmund, Mahmoud Dahoud
('TIM00000004', 'PLR00000063', '2020-01-31', NULL),				-- Borrusia Dortmund, Emre Can
('TIM00000004', 'PLR00000064', '2020-07-23', '2023-07-01'),		-- Borrusia Dortmund, Jude Bellingham
('TIM00000004', 'PLR00000065', '2012-07-01', '2024-07-01'),		-- Borrusia Dortmund, Marco Reus
('TIM00000004', 'PLR00000066', '2020-07-01', '2022-07-01'),		-- Borrusia Dortmund, Erling Haaland
('TIM00000004', 'PLR00000067', '2016-07-01', '2023-07-01'),		-- Borrusia Dortmund, Ansgar Knauff
('TIM00000004', 'PLR00000068', '2019-07-01', NULL),				-- Borrusia Dortmund, Giovanni Reyna
('TIM00000004', 'PLR00000069', '2020-07-01', '2024-02-07'),		-- Borrusia Dortmund, Thomas Meunier
('TIM00000004', 'PLR00000070', '2018-07-01', '2021-08-25'),		-- Borrusia Dortmund, Thomas Delaney
('TIM00000004', 'PLR00000071', '2015-07-01', '2022-07-01'),		-- Borrusia Dortmund, Roman Bürki
('TIM00000004', 'PLR00000072', '2020-07-15', '2022-07-01'),		-- Borrusia Dortmund, Stefan Drljača
('TIM00000004', 'PLR00000073', '2010-07-01', '2021-07-01'),		-- Borrusia Dortmund, Łukasz Piszczek
('TIM00000004', 'PLR00000074', '2019-07-01', '2023-07-20'),		-- Borrusia Dortmund, Nico Schulz
('TIM00000004', 'PLR00000076', '2019-07-01', '2022-07-01'),		-- Borrusia Dortmund, Steffen Tigges
('TIM00000004', 'PLR00000077', '2019-07-01', '2023-07-06'),		-- Borrusia Dortmund, Thorgan Hazard
('TIM00000004', 'PLR00000078', '2019-07-01', NULL),				-- Borrusia Dortmund, Julian Brandt

-- IGRAČI LIVERPOOLA
('TIM00000005', 'PLR00000079', '2018-07-19', NULL), 			-- Liverpool, Alisson Ramses Becker
('TIM00000005', 'PLR00000080', '2017-07-21', NULL), 			-- Liverpool, Andrew Robertson
('TIM00000005', 'PLR00000081', '2021-02-01', '2021-06-30'), 	-- Liverpool, Ozan Kabak
('TIM00000005', 'PLR00000082', '2016-07-01', NULL), 			-- Liverpool, Nathaniel Phillips
('TIM00000005', 'PLR00000083', '2016-10-25', NULL), 			-- Liverpool, Trent Alexander-Arnold
('TIM00000005', 'PLR00000084', '2016-07-22', '2021-06-30'), 	-- Liverpool, Georginio Wijnaldum
('TIM00000005', 'PLR00000085', '2018-07-01', '2023-07-30'), 	-- Liverpool, Fabinho
('TIM00000005', 'PLR00000086', '2018-07-01', '2023-06-30'), 	-- Liverpool, Naby Keita
('TIM00000005', 'PLR00000087', '2016-06-28', '2022-06-22'), 	-- Liverpool, Sadio Mane
('TIM00000005', 'PLR00000088', '2020-09-19', NULL), 			-- Liverpool, Diogo Jota
('TIM00000005', 'PLR00000089', '2017-07-01', NULL), 			-- Liverpool, Mohamed Salah
('TIM00000005', 'PLR00000090', '2020-09-18', NULL), 			-- Liverpool, Thiago Alcantara
('TIM00000005', 'PLR00000091', '2018-07-13', '2021-08-23'), 	-- Liverpool, Xherdan Shaqiri
('TIM00000005', 'PLR00000092', '2015-07-01', '2023-07-03'), 	-- Liverpool, Roberto Firmino
('TIM00000005', 'PLR00000093', '2019-08-05', NULL), 			-- Liverpool, Adrian
('TIM00000005', 'PLR00000094', '2020-11-01', '2023-06-30'), 	-- Liverpool, Harvey Davies
('TIM00000005', 'PLR00000095', '2020-08-11', NULL), 			-- Liverpool, Konstantinos Tsimikas
('TIM00000005', 'PLR00000112', '2015-06-04', '2023-06-30'),     -- Liverpool, James Milner
('TIM00000005', 'PLR00000113', '2017-08-31', '2023-08-11'),     -- Liverpool, Alex Oxlade-Chamberlain

-- IGRAČI REALA
('TIM00000006', 'PLR00000096', '2018-08-01', NULL), 			-- Real Madrid, Thibaut Courtois
('TIM00000006', 'PLR00000097', '2015-07-01', NULL), 			-- Real Madrid, Lucas Vázquez
('TIM00000006', 'PLR00000098', '2019-07-14', NULL), 			-- Real Madrid, Éder Militão
('TIM00000006', 'PLR00000099', '2001-07-01', NULL), 			-- Real Madrid, Nacho Fernández
('TIM00000006', 'PLR00000100', '2019-07-01', NULL), 			-- Real Madrid, Ferland Mendy
('TIM00000006', 'PLR00000101', '2012-08-27', NULL), 			-- Real Madrid, Luka Modrić
('TIM00000006', 'PLR00000102', '2013-07-01', '2022-08-21'), 	-- Real Madrid, Casemiro
('TIM00000006', 'PLR00000103', '2014-07-17', NULL), 			-- Real Madrid, Toni Kroos
('TIM00000006', 'PLR00000104', '2015-12-01', '2023-07-05'), 	-- Real Madrid, Marco Asensio
('TIM00000006', 'PLR00000105', '2009-07-01', '2023-06-30'), 	-- Real Madrid, Karim Benzema
('TIM00000006', 'PLR00000106', '2018-07-20', NULL), 			-- Real Madrid, Vinícius Júnior
('TIM00000006', 'PLR00000107', '2016-07-22', NULL), 			-- Real Madrid, Federico Valverde
('TIM00000006', 'PLR00000108', '2019-06-15', NULL), 			-- Real Madrid, Rodrygo
('TIM00000006', 'PLR00000109', '2018-07-22', NULL), 			-- Real Madrid, Andriy Lunin
('TIM00000006', 'PLR00000110', '2020-09-21', '2022-07-17'), 	-- Real Madrid, Diego Altube
('TIM00000006', 'PLR00000111', '2007-01-01', '2022-06-12'), 	-- Real Madrid, Marcelo
('TIM00000006', 'PLR00000114', '2018-07-18', '2023-08-31'),     -- Real Madrid, Álvaro Odriozola
('TIM00000006', 'PLR00000115', '2013-06-27', '2022-07-06');     -- Real Madrid, Isco

-- IGRAČI CHELSEA
('TIM00000007', 'PLR00000116', '2020-09-24', NULL),              -- Chelsea, Édouard Mendy
('TIM00000007', 'PLR00000117', '2017-07-09', '2022-07-01'),      -- Chelsea, Antonio Rüdiger
('TIM00000007', 'PLR00000118', '2020-08-28', NULL),              -- Chelsea, Thiago Silva
('TIM00000007', 'PLR00000119', '2012-08-24', NULL),              -- Chelsea, César Azpilicueta
('TIM00000007', 'PLR00000120', '2014-07-01', '2022-07-01'),      -- Chelsea, Andreas Christensen
('TIM00000007', 'PLR00000121', '2020-08-26', NULL),              -- Chelsea, Ben Chilwell
('TIM00000007', 'PLR00000122', '2019-07-01', NULL),              -- Chelsea, Reece James
('TIM00000007', 'PLR00000123', '2018-07-14', NULL),              -- Chelsea, Jorginho Frello
('TIM00000007', 'PLR00000124', '2016-07-16', NULL),              -- Chelsea, Ngolo Kanté
('TIM00000007', 'PLR00000125', '2018-08-08', NULL),              -- Chelsea, Mateo Kovačić
('TIM00000007', 'PLR00000126', '2019-07-01', NULL),              -- Chelsea, Mason Mount
('TIM00000007', 'PLR00000127', '2020-09-04', NULL),              -- Chelsea, Kai Havertz
('TIM00000007', 'PLR00000128', '2019-07-01', NULL),              -- Chelsea, Christian Pulisic
('TIM00000007', 'PLR00000129', '2020-07-01', '2022-07-01'),      -- Chelsea, Timo Werner
('TIM00000007', 'PLR00000130', '2018-01-31', '2021-07-01'),      -- Chelsea, Olivier Giroud
('TIM00000007', 'PLR00000131', '2020-07-01', NULL),              -- Chelsea, Hakim Ziyech
('TIM00000007', 'PLR00000132', '2018-08-11', NULL),              -- Chelsea, Callum Hudson-Odoi
('TIM00000007', 'PLR00000133', '2018-08-08', NULL),              -- Chelsea, Kepa Arrizabalaga

-- IGRAČI PORTO
('TIM00000008', 'PLR00000134', '2019-07-01', NULL),              -- Porto, Agustín Marchesín
('TIM00000008', 'PLR00000135', '2019-07-01', NULL),              -- Porto, Pepe Ferreira
('TIM00000008', 'PLR00000136', '2018-07-01', NULL),              -- Porto, Chancel Mbemba
('TIM00000008', 'PLR00000137', '2020-07-01', NULL),              -- Porto, Zaidu Sanusi
('TIM00000008', 'PLR00000138', '2018-07-01', NULL),              -- Porto, Wilson Manafá
('TIM00000008', 'PLR00000139', '2019-08-01', NULL),              -- Porto, Mateus Uribe
('TIM00000008', 'PLR00000140', '2015-07-01', '2022-07-01'),      -- Porto, Sérgio Oliveira
('TIM00000008', 'PLR00000141', '2015-08-31', '2022-07-01'),      -- Porto, Jesús Corona
('TIM00000008', 'PLR00000142', '2014-09-01', NULL),              -- Porto, Otávio Monteiro
('TIM00000008', 'PLR00000143', '2017-07-01', '2021-07-01'),      -- Porto, Moussa Marega
('TIM00000008', 'PLR00000144', '2019-07-01', NULL),              -- Porto, Luis Díaz
('TIM00000008', 'PLR00000145', '2020-08-31', NULL),              -- Porto, Mehdi Taremi
('TIM00000008', 'PLR00000146', '2020-07-01', NULL),              -- Porto, Cláudio Ramos
('TIM00000008', 'PLR00000147', '2018-07-01', NULL),              -- Porto, Iván Marcano
('TIM00000008', 'PLR00000148', '2019-07-01', NULL),              -- Porto, Fábio Vieira
('TIM00000008', 'PLR00000149', '2020-07-01', NULL);              -- Porto, Toni Martínez

-- VEZA IZMEĐU TIMOVA I TRENERA
INSERT INTO TimTrener (ID_tima, ID_trenera, datum_pocetka, datum_zavrsetka)
VALUES
-- Bayern München, Hans-Dieter Flick
('TIM00000001', 'COA00000001', '2019-11-03', '2021-07-01'),
-- Paris Saint-Germain, Mauricio Pochettino
('TIM00000002', 'COA00000002', '2021-01-02', '2022-07-05'),
-- Manchester City, Pep Guardiola
('TIM00000003', 'COA00000003', '2016-07-01', NULL),
-- Borrusia Dortmund, Edin Terzić
('TIM00000004', 'COA00000004', '2020-12-29', NULL),
-- Liverpool, Jürgen Klopp
('TIM00000005', 'COA00000005', '2015-10-08', NULL),
-- Real Madrid, Zinedine Zidane
('TIM00000006', 'COA00000006', '2016-01-04', '2021-05-27'),
-- Chelsea, Thomas Tuchel
('TIM00000007', 'COA00000007', '2021-01-26', '2022-09-07'),
-- Porto, Sérgio Conceição
('TIM00000008', 'COA00000008', '2017-06-08', NULL);


-- IZMEĐU TIMOVA I UTAKMICA
INSERT INTO TimUtakmica (ID_tima, ID_utakmice, domaci, gost)
VALUES
-- Quarterfinals
('TIM00000001', 'MAT00000001', TRUE, FALSE), -- Bayern München vs Paris Saint-Germain (07/04/2021)
('TIM00000002', 'MAT00000001', FALSE, TRUE),
('TIM00000002', 'MAT00000002', TRUE, FALSE), -- Paris Saint-Germain vs Bayern München (13/04/2021)
('TIM00000001', 'MAT00000002', FALSE, TRUE),
('TIM00000003', 'MAT00000003', TRUE, FALSE), -- Manchester City vs Borussia Dortmund (06/04/2021)
('TIM00000004', 'MAT00000003', FALSE, TRUE),
('TIM00000004', 'MAT00000004', TRUE, FALSE), -- Borussia Dortmund vs Manchester City (14/04/2021)
('TIM00000003', 'MAT00000004', FALSE, TRUE),
('TIM00000006', 'MAT00000005', TRUE, FALSE), -- Real Madrid vs Liverpool (06/04/2021)
('TIM00000005', 'MAT00000005', FALSE, TRUE),
('TIM00000005', 'MAT00000006', TRUE, FALSE), -- Liverpool vs Real Madrid (14/04/2021)
('TIM00000006', 'MAT00000006', FALSE, TRUE),
('TIM00000007', 'MAT00000007', TRUE, FALSE), -- Porto vs Chelsea (07/04/2021)
('TIM00000008', 'MAT00000007', FALSE, TRUE),
('TIM00000008', 'MAT00000008', TRUE, FALSE), -- Chelsea vs Porto (13/04/2021)
('TIM00000007', 'MAT00000008', FALSE, TRUE),
-- Semifinals
('TIM00000006', 'MAT00000009', TRUE, FALSE), -- Real Madrid vs Chelsea (27/04/2021)
('TIM00000007', 'MAT00000009', FALSE, TRUE),
('TIM00000007', 'MAT00000010', TRUE, FALSE), -- Chelsea vs Real Madrid (05/05/2021)
('TIM00000006', 'MAT00000010', FALSE, TRUE),
('TIM00000002', 'MAT00000011', TRUE, FALSE), -- Paris Saint-Germain vs Manchester City (28/04/2021)
('TIM00000003', 'MAT00000011', FALSE, TRUE),
('TIM00000003', 'MAT00000012', TRUE, FALSE), -- Manchester City vs Paris Saint-Germain (04/05/2021)
('TIM00000002', 'MAT00000012', FALSE, TRUE),
-- Final
('TIM00000003', 'MAT00000013', TRUE, FALSE), -- Manchester City vs Chelsea (29/05/2021)
('TIM00000007', 'MAT00000013', FALSE, TRUE);


-- VEZA IZMEĐU IGRAČA I UTAKMICA
INSERT INTO IgracUtakmica (ID_igraca, ID_utakmice, br_golova, br_u_okvir, br_prema_golu, br_obrana, br_prekrsaja, br_zaleda, br_zutih, br_crvenih, vrijeme_ulaska, vrijeme_izlaska)
VALUES
-- UTAKMICA 7.4.'21. BAYERN - PSG
('PLR00000001', 'MAT00000001', 0, 0, 0, 1, 0, 0, 0, 0, '00:00:00', '01:30:00'), 	-- Bayern, Manuel Neuer
('PLR00000002', 'MAT00000001', 0, 1, 1, 0, 2, 0, 1, 0, '00:00:00', '01:30:00'), 	-- Bayern, Lucas Hernández
('PLR00000003', 'MAT00000001', 0, 1, 5, 0, 2, 0, 0, 0, '00:00:00', '01:30:00'), 	-- Bayern, David Alaba
('PLR00000004', 'MAT00000001', 0, 0, 1, 0, 0, 0, 0, 0, '00:00:00', '00:42:00'), 	-- Bayern, Niklas Süle
('PLR00000005', 'MAT00000001', 0, 2, 3, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'), 	-- Bayern, Benjamin Pavard
('PLR00000006', 'MAT00000001', 0, 1, 3, 0, 1, 0, 0, 0, '00:00:00', '00:33:00'),		-- Bayern, Leon Goretzka
('PLR00000007', 'MAT00000001', 0, 1, 2, 0, 2, 0, 1, 0, '00:00:00', '01:30:00'),		-- Bayern, Joshua Kimmich
('PLR00000008', 'MAT00000001', 0, 1, 4, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'), 	-- Bayern, Kingsley Coman
('PLR00000009', 'MAT00000001', 1, 3, 5, 0, 2, 1, 0, 0, '00:00:00', '01:30:00'), 	-- Bayern, Thomas Müller
('PLR00000010', 'MAT00000001', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'), 	-- Bayern, Bayern, Leroy Sané
('PLR00000011', 'MAT00000001', 1, 2, 5, 0, 2, 0, 1, 0, '00:00:00', '01:30:00'), 	-- Bayern, Eric Maxim Choupo-Moting
('PLR00000012', 'MAT00000001', 0, 0, 0, 0, 0, 0, 0, 0, '00:33:00', '01:30:00'), 	-- Bayern, Alphonso Davies
('PLR00000013', 'MAT00000001', 0, 0, 0, 0, 1, 0, 1, 0, '00:42:00', '01:30:00'), 	-- Bayern, Jérôme Boateng

('PLR00000019', 'MAT00000001', 0, 0, 0, 10, 0, 0, 0, 0, '00:00:00', '01:30:00'), 	-- PSG, Keylor Navas
('PLR00000020', 'MAT00000001', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '00:45:00'), 	-- PSG, Abdou Diallo
('PLR00000021', 'MAT00000001', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'), 	-- PSG, Presnel Kimpembe
('PLR00000022', 'MAT00000001', 1, 1, 1, 0, 0, 0, 0, 0, '00:00:00', '00:30:00'), 	-- PSG, Marcos Aoás Corrêa Marquinhos
('PLR00000023', 'MAT00000001', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'), 	-- PSG, Colin Dagba
('PLR00000024', 'MAT00000001', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'), 	-- PSG, Idrissa Gueye
('PLR00000025', 'MAT00000001', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'), 	-- PSG, Danilo Pereira
('PLR00000026', 'MAT00000001', 0, 0, 1, 0, 3, 0, 1, 0, '00:00:00', '01:30:00'), 	-- PSG, Julian Draxler
('PLR00000027', 'MAT00000001', 0, 1, 1, 0, 0, 3, 0, 0, '00:00:00', '01:30:00'), 	-- PSG, Neymar da Silva Santos Júnior
('PLR00000028', 'MAT00000001', 0, 0, 1, 0, 1, 0, 0, 0, '00:00:00', '01:11:00'), 	-- PSG, Ángel Di María
('PLR00000029', 'MAT00000001', 2, 2, 2, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'), 	-- PSG, Kylian Mbappé
('PLR00000030', 'MAT00000001', 0, 0, 0, 0, 0, 0, 0, 0, '00:30:00', '01:30:00'), 	-- PSG, Ander Herrera
('PLR00000031', 'MAT00000001', 0, 0, 0, 0, 0, 0, 0, 0, '00:45:00', '01:30:00'), 	-- PSG, Mitchel Bakker
('PLR00000032', 'MAT00000001', 0, 0, 0, 0, 0, 0, 0, 0, '01:11:00', '01:30:00'), 	-- PSG, Moise Kean
('PLR00000033', 'MAT00000001', 0, 0, 0, 0, 0, 0, 0, 0, '01:30:00', '01:33:00'), 	-- PSG, Rafinha Alcântara

-- UTAKMICA 7.4.'21. BAYERN - PSG
('PLR00000001', 'MAT00000002', 0, 0, 0, 3, 0, 0, 0, 0, '00:00:00', '01:30:00'), 	-- Bayern, Manuel Neuer
('PLR00000002', 'MAT00000002', 0, 0, 1, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'), 	-- Bayern, Lucas Hernández
('PLR00000003', 'MAT00000002', 0, 2, 3, 0, 4, 0, 1, 0, '00:00:00', '01:30:00'), 	-- Bayern, David Alaba
('PLR00000005', 'MAT00000002', 0, 0, 0, 0, 1, 1, 0, 0, '00:00:00', '01:30:00'), 	-- Bayern, Benjamin Pavard
('PLR00000007', 'MAT00000002', 0, 0, 1, 0, 2, 0, 0, 0, '00:00:00', '01:30:00'), 	-- Bayern, Joshua Kimmich
('PLR00000008', 'MAT00000002', 0, 0, 4, 0, 2, 1, 0, 0, '00:00:00', '01:30:00'), 	-- Bayern, Kingsley Coman
('PLR00000009', 'MAT00000002', 0, 1, 1, 0, 2, 0, 1, 0, '00:00:00', '01:30:00'), 	-- Bayern, Thomas Müller
('PLR00000010', 'MAT00000002', 0, 1, 2, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'), 	-- Bayern, Leroy Sané
('PLR00000011', 'MAT00000002', 1, 1, 1, 0, 3, 0, 0, 0, '00:00:00', '01:25:00'), 	-- Bayern, Eric Maxim Choupo-Moting
('PLR00000012', 'MAT00000002', 0, 0, 0, 0, 2, 0, 0, 0, '00:00:00', '01:11:00'), 	-- Bayern, Alphonso Davies
('PLR00000013', 'MAT00000002', 0, 0, 0, 0, 1, 1, 0, 0, '00:00:00', '01:30:00'), 	-- Bayern, Jérôme Boateng
('PLR00000017', 'MAT00000002', 0, 0, 0, 0, 0, 0, 0, 0, '01:11:00', '01:30:00'), 	-- Bayern, Jamal Musiala
('PLR00000018', 'MAT00000002', 0, 0, 0, 0, 0, 0, 0, 0, '01:25:00', '01:30:00'), 	-- Bayern, Javi Martínez

('PLR00000019', 'MAT00000002', 0, 0, 0, 4, 0, 0, 0, 0, '00:00:00', '01:30:00'), 	-- PSG, Keylor Navas
('PLR00000020', 'MAT00000002', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '00:58:00'), 	-- PSG, Abdou Diallo
('PLR00000021', 'MAT00000002', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'), 	-- PSG, Presnel Kimpembe
('PLR00000023', 'MAT00000002', 0, 0, 0, 0, 1, 0, 1, 0, '00:00:00', '01:30:00'), 	-- PSG, Colin Dagba
('PLR00000024', 'MAT00000002', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'), 	-- PSG, Idrissa Gueye
('PLR00000025', 'MAT00000002', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'), 	-- PSG, Danilo Pereira
('PLR00000026', 'MAT00000002', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:13:00'), 	-- PSG, Julian Draxler
('PLR00000027', 'MAT00000002', 0, 3, 6, 0, 2, 3, 0, 0, '00:00:00', '01:30:00'), 	-- PSG, Neymar da Silva Santos Júnior
('PLR00000028', 'MAT00000002', 0, 0, 2, 0, 1, 3, 0, 0, '00:00:00', '01:28:00'), 	-- PSG, Ángel Di María
('PLR00000029', 'MAT00000002', 0, 0, 1, 0, 0, 1, 0, 0, '00:00:00', '01:30:00'), 	-- PSG, Kylian Mbappé
('PLR00000030', 'MAT00000002', 0, 0, 0, 0, 1, 0, 1, 0, '01:28:00', '01:30:00'), 	-- PSG, Ander Herrera
('PLR00000031', 'MAT00000002', 0, 0, 0, 0, 1, 0, 0, 0, '00:58:00', '01:30:00'), 	-- PSG, Mitchel Bakker
('PLR00000032', 'MAT00000002', 0, 0, 1, 0, 0, 0, 0, 0, '01:13:00', '01:30:00'), 	-- PSG, Moise Kean
('PLR00000037', 'MAT00000002', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'), 	-- PSG, Leandro Paredes

-- UTAKMICA 6.4.'21. MAN CITY - BVB
('PLR00000038', 'MAT00000003', 0, 0, 0, 2, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Ederson Santana de Moraes
('PLR00000039', 'MAT00000003', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Kyle Walker
('PLR00000040', 'MAT00000003', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, John Stones
('PLR00000041', 'MAT00000003', 0, 0, 0, 0, 3, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Rúben Dias
('PLR00000042', 'MAT00000003', 0, 0, 1, 0, 1, 1, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, João Cancelo
('PLR00000043', 'MAT00000003', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Rodrigo Hernández Cascante
('PLR00000044', 'MAT00000003', 0, 0, 2, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, İlkay Gündoğan
('PLR00000045', 'MAT00000003', 0, 1, 1, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Riyad Mahrez
('PLR00000046', 'MAT00000003', 1, 1, 2, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Kevin De Bruyne
('PLR00000047', 'MAT00000003', 1, 3, 5, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Phil Foden
('PLR00000048', 'MAT00000003', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '00:59:00'),		-- Manchester City, Bernardo Silva
('PLR00000049', 'MAT00000003', 0, 0, 0, 0, 0, 0, 0, 0, '00:59:00', '01:30:00'),		-- Manchester City, Gabriel Jesus

('PLR00000057', 'MAT00000003', 0, 0, 0, 4, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Borrusia Dortmund, Marwin Hitz
('PLR00000058', 'MAT00000003', 0, 0, 1, 0, 2, 0, 0, 0, '00:00:00', '01:30:00'),		-- Borrusia Dortmund, Raphaël Guerreiro
('PLR00000059', 'MAT00000003', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Borrusia Dortmund, Mats Hummels
('PLR00000060', 'MAT00000003', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),		-- Borrusia Dortmund, Manuel Akanji
('PLR00000061', 'MAT00000003', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:09:00'),		-- Borrusia Dortmund, Mateu Morey
('PLR00000062', 'MAT00000003', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:09:00'),		-- Borrusia Dortmund, Mahmoud Dahoud
('PLR00000063', 'MAT00000003', 0, 0, 1, 0, 1, 0, 1, 0, '00:00:00', '01:30:00'),		-- Borrusia Dortmund, Emre Can
('PLR00000064', 'MAT00000003', 0, 1, 1, 0, 2, 0, 1, 0, '00:00:00', '01:30:00'),		-- Borrusia Dortmund, Jude Bellingham
('PLR00000065', 'MAT00000003', 1, 1, 3, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),		-- Borrusia Dortmund, Marco Reus
('PLR00000066', 'MAT00000003', 0, 1, 1, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Borrusia Dortmund, Erling Haaland
('PLR00000067', 'MAT00000003', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:03:00'),		-- Borrusia Dortmund, Ansgar Knauff
('PLR00000068', 'MAT00000003', 0, 0, 0, 0, 0, 0, 0, 0, '01:03:00', '01:30:00'),		-- Borrusia Dortmund, Giovanni Reyna
('PLR00000069', 'MAT00000003', 0, 0, 0, 0, 0, 0, 0, 0, '01:09:00', '01:30:00'),		-- Borrusia Dortmund, Thomas Meunier
('PLR00000070', 'MAT00000003', 0, 0, 0, 0, 0, 0, 0, 0, '01:09:00', '01:30:00'),		-- Borrusia Dortmund, Thomas Delaney

-- UTAKMICA 14.4.'21. BVB - MAN CITY
('PLR00000038', 'MAT00000004', 0, 0, 0, 2, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Ederson Santana de Moraes
('PLR00000039', 'MAT00000004', 0, 0, 1, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Kyle Walker
('PLR00000040', 'MAT00000004', 0, 0, 1, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, John Stones
('PLR00000041', 'MAT00000004', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Rúben Dias
('PLR00000043', 'MAT00000004', 0, 0, 1, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Rodrigo Hernández Cascante
('PLR00000044', 'MAT00000004', 0, 0, 1, 0, 2, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, İlkay Gündoğan
('PLR00000045', 'MAT00000004', 1, 1, 4, 0, 0, 1, 0, 0, '00:00:00', '01:28:00'),		-- Manchester City, Riyad Mahrez
('PLR00000046', 'MAT00000004', 0, 1, 5, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Kevin De Bruyne
('PLR00000047', 'MAT00000004', 1, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Phil Foden
('PLR00000048', 'MAT00000004', 0, 0, 1, 0, 3, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Bernardo Silva
('PLR00000055', 'MAT00000004', 0, 2, 2, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Oleksandr Zinchenko
('PLR00000075', 'MAT00000004', 0, 0, 0, 0, 0, 0, 0, 0, '01:28:00', '01:30:00'),		-- Manchester City, Raheem Sterling

('PLR00000057', 'MAT00000004', 0, 0, 0, 3, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Marwin Hitz
('PLR00000058', 'MAT00000004', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Raphaël Guerreiro
('PLR00000059', 'MAT00000004', 0, 0, 1, 0, 0, 1, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Mats Hummels
('PLR00000060', 'MAT00000004', 0, 1, 1, 0, 0, 1, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Manuel Akanji
('PLR00000061', 'MAT00000004', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:21:00'),		-- Manchester City, Mateu Morey
('PLR00000062', 'MAT00000004', 0, 1, 3, 0, 1, 1, 0, 0, '00:00:00', '01:16:00'),		-- Manchester City, Mahmoud Dahoud
('PLR00000063', 'MAT00000004', 0, 0, 1, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Emre Can
('PLR00000064', 'MAT00000004', 1, 1, 1, 0, 2, 1, 0, 0, '00:00:00', '01:21:00'),		-- Manchester City, Jude Bellingham
('PLR00000065', 'MAT00000004', 0, 0, 1, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Marco Reus
('PLR00000066', 'MAT00000004', 0, 0, 1, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),		-- Manchester City, Erling Haaland
('PLR00000067', 'MAT00000004', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:08:00'),		-- Manchester City, Ansgar Knauff
('PLR00000068', 'MAT00000004', 0, 0, 0, 0, 0, 0, 0, 0, '01:08:00', '01:30:00'),		-- Manchester City, Giovanni Reyna
('PLR00000076', 'MAT00000004', 0, 0, 0, 0, 0, 0, 0, 0, '01:21:00', '01:30:00'),		-- Manchester City, Steffen Tigges 
('PLR00000077', 'MAT00000004', 0, 0, 0, 0, 1, 0, 0, 0, '01:16:00', '01:30:00'),		-- Manchester City, Thorgan Hazard
('PLR00000078', 'MAT00000004', 0, 0, 0, 0, 0, 0, 0, 0, '01:21:00', '01:30:00'),		-- Manchester City, Julian Brandt

-- UTAKMICA 6.4.'21. RMA - LIVERPOOL
('PLR00000096', 'MAT00000005', 0, 0, 0, 3, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Thibaut Courtois
('PLR00000097', 'MAT00000005', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),  -- Lucas Vázquez
('PLR00000098', 'MAT00000005', 0, 0, 1, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Éder Militão
('PLR00000099', 'MAT00000005', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Nacho Fernández
('PLR00000100', 'MAT00000005', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),  -- Ferland Mendy
('PLR00000101', 'MAT00000005', 0, 1, 2, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Luka Modrić
('PLR00000102', 'MAT00000005', 0, 0, 1, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),  -- Casemiro
('PLR00000103', 'MAT00000005', 0, 1, 2, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Toni Kroos
('PLR00000104', 'MAT00000005', 1, 1, 2, 0, 0, 0, 0, 0, '00:00:00', '01:10:00'),  -- Marco Asensio
('PLR00000105', 'MAT00000005', 0, 2, 3, 0, 0, 1, 0, 0, '00:00:00', '01:30:00'),  -- Karim Benzema
('PLR00000106', 'MAT00000005', 2, 3, 4, 0, 0, 0, 0, 0, '00:00:00', '01:25:00'),  -- Vinícius Júnior
('PLR00000107', 'MAT00000005', 0, 0, 0, 0, 1, 0, 0, 0, '01:10:00', '01:30:00'),  -- Federico Valverde ušao umjesto Marco Asensio
('PLR00000108', 'MAT00000005', 0, 0, 0, 0, 0, 0, 0, 0, '01:25:00', '01:30:00'),  -- Rodrygo ušao umjesto Vinícius Júnior

('PLR00000079', 'MAT00000005', 0, 0, 0, 3, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Alisson Ramses Becker
('PLR00000080', 'MAT00000005', 0, 0, 1, 0, 0, 1, 0, 0, '00:00:00', '01:30:00'),  -- Andrew Robertson
('PLR00000081', 'MAT00000005', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:22:00'),  -- Ozan Kabak
('PLR00000082', 'MAT00000005', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),  -- Nathaniel Phillips
('PLR00000083', 'MAT00000005', 0, 0, 1, 0, 2, 1, 0, 0, '00:00:00', '01:30:00'),  -- Trent Alexander-Arnold
('PLR00000084', 'MAT00000005', 0, 0, 1, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),  -- Georginio Wijnaldum
('PLR00000085', 'MAT00000005', 0, 0, 1, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),  -- Fabinho Tavares
('PLR00000086', 'MAT00000005', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '00:42:00'),  -- Naby Keïta
('PLR00000087', 'MAT00000005', 0, 1, 2, 0, 2, 1, 0, 0, '00:00:00', '01:30:00'),  -- Sadio Mané
('PLR00000088', 'MAT00000005', 0, 1, 2, 0, 0, 0, 0, 0, '00:00:00', '01:21:00'),  -- Diogo Jota
('PLR00000089', 'MAT00000005', 1, 1, 3, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Mohamed Salah
('PLR00000090', 'MAT00000005', 0, 0, 1, 0, 1, 0, 0, 0, '00:42:00', '01:30:00'),  -- Thiago Alcântara ušao umjesto Naby Keïta
('PLR00000092', 'MAT00000005', 0, 0, 1, 0, 0, 1, 0, 0, '01:21:00', '01:30:00'),  -- Roberto Firmino ušao umjesto Diogo Jota
('PLR00000091', 'MAT00000005', 0, 0, 0, 0, 0, 0, 0, 0, '01:22:00', '01:30:00'),  -- Xherdan Shaqiri ušao umjesto Ozan Kabak

-- UTAKMICA 14.4.'21. RMA - LIVERPOOL
-- IGRAČI REAL MADRIDA
('PLR00000096', 'MAT00000006', 0, 0, 0, 1, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Thibaut Courtois
('PLR00000098', 'MAT00000006', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Éder Militão
('PLR00000099', 'MAT00000006', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Nacho Fernández
('PLR00000100', 'MAT00000006', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Ferland Mendy
('PLR00000101', 'MAT00000006', 0, 0, 1, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),  -- Luka Modrić
('PLR00000102', 'MAT00000006', 0, 0, 1, 0, 1, 0, 1, 0, '00:00:00', '01:30:00'),  -- Casemiro
('PLR00000103', 'MAT00000006', 0, 0, 1, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Toni Kroos
('PLR00000104', 'MAT00000006', 0, 1, 2, 0, 0, 0, 0, 0, '00:00:00', '01:12:00'),  -- Marco Asensio
('PLR00000105', 'MAT00000006', 0, 1, 2, 0, 1, 0, 0, 0, '00:00:00', '01:22:00'),  -- Karim Benzema
('PLR00000106', 'MAT00000006', 0, 1, 2, 0, 1, 0, 0, 0, '00:00:00', '01:03:00'),  -- Vinícius Júnior
('PLR00000108', 'MAT00000006', 0, 0, 0, 0, 0, 0, 0, 0, '01:03:00', '01:30:00'),  -- Rodrygo ušao umjesto Vinícius Júnior
('PLR00000107', 'MAT00000006', 0, 0, 0, 0, 0, 0, 0, 0, '01:12:00', '01:30:00'),  -- Federico Valverde ušao umjesto Marco Asensio
('PLR00000114', 'MAT00000006', 0, 0, 0, 0, 0, 0, 0, 0, '01:22:00', '01:30:00'),  -- Álvaro Odriozola ušao umjesto Karim Benzema

-- IGRAČI LIVERPOOLA
('PLR00000079', 'MAT00000006', 0, 0, 0, 2, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Alisson Ramses Becker
('PLR00000080', 'MAT00000006', 0, 0, 1, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),  -- Andrew Robertson
('PLR00000081', 'MAT00000006', 0, 0, 0, 0, 0, 0, 0, 0, '00:00:00', '01:00:00'),  -- Ozan Kabak
('PLR00000082', 'MAT00000006', 0, 0, 0, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),  -- Nathaniel Phillips
('PLR00000083', 'MAT00000006', 0, 0, 2, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Trent Alexander-Arnold
('PLR00000084', 'MAT00000006', 0, 0, 1, 0, 1, 0, 0, 0, '00:00:00', '01:30:00'),  -- Georginio Wijnaldum
('PLR00000085', 'MAT00000006', 0, 0, 1, 0, 0, 0, 0, 0, '00:00:00', '01:30:00'),  -- Fabinho Tavares
('PLR00000112', 'MAT00000006', 0, 0, 1, 0, 2, 0, 0, 0, '00:00:00', '00:46:00'),  -- James Milner
('PLR00000089', 'MAT00000006', 0, 1, 3, 0, 0, 1, 0, 0, '00:00:00', '01:30:00'),  -- Mohamed Salah
('PLR00000087', 'MAT00000006', 0, 0, 2, 0, 1, 1, 0, 0, '00:00:00', '01:30:00'),  -- Sadio Mané
('PLR00000088', 'MAT00000006', 0, 1, 3, 0, 0, 0, 0, 0, '00:00:00', '01:22:00'),  -- Diogo Jota
('PLR00000090', 'MAT00000006', 0, 0, 1, 0, 0, 0, 0, 0, '00:46:00', '01:30:00'),  -- Thiago Alcântara ušao umjesto James Milner
('PLR00000092', 'MAT00000006', 0, 1, 1, 0, 0, 0, 0, 0, '01:00:00', '01:30:00'),  -- Roberto Firmino ušao umjesto Ozan Kabak
('PLR00000113', 'MAT00000006', 0, 0, 0, 0, 0, 0, 0, 0, '01:22:00', '01:30:00'),  -- Alex Oxlade-Chamberlain ušao umjesto Diogo Jota

-- UTAKMICA 7.4.'21. PORTO - CHELSEA


-- UTAKMICA 13.4.'21. CHELSEA - PORTO




-- VEZA IZMEĐU UTAKMICA I SUDACA
INSERT INTO UtakmicaSudac (ID_utakmice, ID_suca, uloga)
VALUES
-- Quarterfinals
('MAT00000001', 'REF00000001', 'Main Referee'),       -- Bayern München vs Paris Saint-Germain (07/04/2021)
('MAT00000001', 'REF00000002', 'Assistant Referee'),
('MAT00000001', 'REF00000003', 'Assistant Referee'),
('MAT00000002', 'REF00000004', 'Main Referee'),       -- Paris Saint-Germain vs Bayern München (13/04/2021)
('MAT00000002', 'REF00000005', 'Assistant Referee'),
('MAT00000002', 'REF00000006', 'Assistant Referee'),
('MAT00000003', 'REF00000007', 'Main Referee'),       -- Manchester City vs Borussia Dortmund (06/04/2021)
('MAT00000003', 'REF00000008', 'Assistant Referee'),
('MAT00000003', 'REF00000009', 'Assistant Referee'),
('MAT00000004', 'REF00000010', 'Main Referee'),       -- Borussia Dortmund vs Manchester City (14/04/2021)
('MAT00000004', 'REF00000011', 'Assistant Referee'),
('MAT00000004', 'REF00000012', 'Assistant Referee'),
('MAT00000005', 'REF00000013', 'Main Referee'),       -- Real Madrid vs Liverpool (06/04/2021)
('MAT00000005', 'REF00000014', 'Assistant Referee'),
('MAT00000005', 'REF00000015', 'Assistant Referee'),
('MAT00000006', 'REF00000016', 'Main Referee'),       -- Liverpool vs Real Madrid (14/04/2021)
('MAT00000006', 'REF00000017', 'Assistant Referee'),
('MAT00000006', 'REF00000018', 'Assistant Referee'),
('MAT00000007', 'REF00000001', 'Main Referee'),       -- Porto vs Chelsea (07/04/2021)
('MAT00000007', 'REF00000002', 'Assistant Referee'),
('MAT00000007', 'REF00000003', 'Assistant Referee'),
('MAT00000008', 'REF00000004', 'Main Referee'),       -- Chelsea vs Porto (13/04/2021)
('MAT00000008', 'REF00000005', 'Assistant Referee'),
('MAT00000008', 'REF00000006', 'Assistant Referee'),
-- Semifinals
('MAT00000009', 'REF00000007', 'Main Referee'),       -- Real Madrid vs Chelsea (27/04/2021)
('MAT00000009', 'REF00000008', 'Assistant Referee'),
('MAT00000009', 'REF00000009', 'Assistant Referee'),
('MAT00000010', 'REF00000010', 'Main Referee'),       -- Chelsea vs Real Madrid (05/05/2021)
('MAT00000010', 'REF00000011', 'Assistant Referee'),
('MAT00000010', 'REF00000012', 'Assistant Referee'),
('MAT00000011', 'REF00000013', 'Main Referee'),       -- Paris Saint-Germain vs Manchester City (28/04/2021)
('MAT00000011', 'REF00000014', 'Assistant Referee'),
('MAT00000011', 'REF00000015', 'Assistant Referee'),
('MAT00000012', 'REF00000016', 'Main Referee'),       -- Manchester City vs Paris Saint-Germain (04/05/2021)
('MAT00000012', 'REF00000017', 'Assistant Referee'),
('MAT00000012', 'REF00000018', 'Assistant Referee'),
-- Final
('MAT00000013', 'REF00000001', 'Main Referee'),       -- Manchester City vs Chelsea (29/05/2021)
('MAT00000013', 'REF00000002', 'Assistant Referee'),
('MAT00000013', 'REF00000003', 'Assistant Referee');

-- Display data from the Organizacija table
SELECT * FROM Organizacija;

-- Display data from the Tim table
SELECT * FROM Tim;

-- Display data from the Igrac table
SELECT * FROM Igrac;

-- Display data from the Trener table
SELECT * FROM Trener;

-- Display data from the Utakmica table
SELECT * FROM Utakmica;

-- Display data from the Sudac table
SELECT * FROM Sudac;

-- Display data from the TimIgrac table
SELECT * FROM TimIgrac;

-- Display data from the TimTrener table
SELECT * FROM TimTrener;

-- Display data from the TimUtakmica table
SELECT * FROM TimUtakmica;

-- Display data from the IgracUtakmica table
SELECT * FROM IgracUtakmica;

-- Display data from the UtakmicaSudac table
SELECT * FROM UtakmicaSudac;
