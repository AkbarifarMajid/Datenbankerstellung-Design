
-- Abfrage 1: Liste aller Spieler*innen mit Teamname (sortiert nach Vorname)

select 
	Spieler.Vorname as SpielerVorname,
    Spieler.Nachname as SpielerNachname,
    Team.Teamname as SpielerTeam
from Spieler
join
	Spieler_Team on Spieler.SpielerID = Spieler_Team.SpielerID
join
	Team on Spieler_Team.TeamID = Team.TeamID
order by 
	Spieler.Vorname asc;



-- Abfrage 2: Liste der Trainer*innen mit ihren Ausbildungen (nach Bezeichnung sortiert)

select 
	Trainer.Vorname as TrainerVorname,
    Trainer.Nachname as TrainerNachname,
    Ausbildung.Bezeichnung as TrainerBezeichnung
from Trainer
join
	Trainer_Ausbildung on Trainer.TrainerID = Trainer_Ausbildung.TrainerID
join
	Ausbildung on Ausbildung.AusbildungID = Trainer_Ausbildung.AusbildungID
order by
	Ausbildung.Bezeichnung asc;
		

-- Abfrage 3: Spieler*innen mit zugehörigem Team und Trainer*in

select 
	Spieler.Vorname as SpielerVorname,
    Spieler.Nachname as SpielerNachname,
    Team.Teamname,
    Trainer.Vorname as TrainerVorname,
	Trainer.Nachname as TrainerNachname
from Spieler
join
	Spieler_Team on Spieler.SpielerID = Spieler_Team.SpielerID
join
	Team on Spieler_Team.TeamID = Team.TeamID
join
	Team_Trainer on Team.TeamID = Team_Trainer.TeamID
join
	Trainer on Team_Trainer.TrainerID = Trainer.TrainerID
order by
	Spieler.Nachname asc;


-- Abfrage 4: Erhöhung des Gehalts der Trainer*innen um 25%

update Trainer
set Gehalt  = Gehalt * 1.25

