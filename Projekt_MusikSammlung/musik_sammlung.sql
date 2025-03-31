-- 1. Tabelle Interpreten
CREATE TABLE C_Interpreten (
    InterpretID INT PRIMARY KEY,
    Interpret VARCHAR(255)
);

INSERT INTO C_Interpreten (InterpretID, Interpret) VALUES
(1010, 'Herbert Grönemeyer'),
(1020, 'Andreas Gabalier'),
(1030, 'Udo Jürgens'),
(1040, 'Helene Fischer'),
(1050, 'Nina Hagen');

-- 2. Tabelle Musikrichtung
CREATE TABLE C_Musikrichtung (
    MRID INT PRIMARY KEY,
    Musikrichtung VARCHAR(255)
);

INSERT INTO C_Musikrichtung (MRID, Musikrichtung) VALUES
(1, 'Pop'),
(2, 'Volks-Rock’n’Roll'),
(3, 'Schlager'),
(4, 'Neue Deutsche Welle'),
(5, 'Chanson');

-- 3. Tabelle CD
CREATE TABLE C_CD (
    CDNr INT PRIMARY KEY,
    CDName VARCHAR(255),
    InterpretNr INT,
    Musikrichtung INT,
    FOREIGN KEY (InterpretNr) REFERENCES C_Interpreten(InterpretID),
    FOREIGN KEY (Musikrichtung) REFERENCES C_Musikrichtung(MRID)
);

INSERT INTO C_CD (CDNr, CDName, InterpretNr, Musikrichtung) VALUES
(201, 'Bleibt alles anders', 1010, 1),
(202, 'Volks-Rock’n’Roll', 1020, 2),
(203, 'Mit 66 Jahren', 1030, 5),
(204, 'Farbenspiel', 1040, 3),
(205, 'Street', 1050, 4);

-- 4. Tabelle Titel
CREATE TABLE C_Titel (
    CDNr INT,
    TitelNr INT,
    Titel VARCHAR(255),
    IntNr INT,
    Beurteilung VARCHAR(100),
    PRIMARY KEY (CDNr, TitelNr),
    FOREIGN KEY (CDNr) REFERENCES C_CD(CDNr),
    FOREIGN KEY (IntNr) REFERENCES C_Interpreten(InterpretID)
);

INSERT INTO C_Titel (CDNr, TitelNr, Titel, IntNr, Beurteilung) VALUES
(201, 1, 'Bochum', 1010, 'Heimatlich'),
(201, 2, 'Currywurst', 1010, 'Humorvoll'),
(202, 1, 'I sing a Liad für di', 1020, 'Stimmungsvoll'),
(203, 1, 'Griechischer Wein', 1030, 'Kultig'),
(203, 2, 'Aber bitte mit Sahne', 1030, 'Retro'),
(204, 1, 'Ich will immer wieder...', 1040, 'Romantisch'),
(205, 1, 'TV-Glotzer', 1050, 'Provokativ'),
(205, 2, 'Born in Xixax', 1050, 'Experimentell');
