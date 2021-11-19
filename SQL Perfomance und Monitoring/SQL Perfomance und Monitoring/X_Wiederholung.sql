/*

Setup und was man nach dem Setup macht


Trenne Log von Daten im Setup pro Server
aber eigtl pro DB 

TempDb
Pfade bzw eig HDDs
ab SQL 2016: TRaceflags 1117  1118 autom gesetzt
			--> Dateien der Tempdb wachsen gleichmassen
			--alle gleich groß

			-->Uniform Block -- jede Tabelle hat eig Blöcke

			--> hat soviele DatenDateien  wie Kerne

ab SQl2019  MAXDOP
	--setzt soviele maximale Kern für eine Abfrage wie man Kerne hat 
				aber nicht mehr als 8

	--ab SQL 2016 kann man auch das in DB setzen
			(scoped Database)


RAM

seit SQL 2016: MAX RAM .. (Datenpuffer)
		--das OS mind abziehen (4 GB )



Volumewartungstask
	--> Ausnullen... lok Sicherheitsrichtlinie von Windows



DB Größen
	pro DB .. wie groß sie sein werden..

wie erreicht man es eigtl. dass das Logfile nie wächst
--> RecModel: FULL....
--> Wie lange darf die DB ausfallen? 30min
--> Wieviel Datenverlust darf man haben?  10min
--dann 10min Takt Logfile Sicherung
--V D  
--sehr viele Protokolle dauern, daher immer wieder dazwischen ein D


-- V    TTT   D TTTT D TTTT D TTTT

--V                          D TTTT
- V TT!T           TTTT  TTTT  TTTT

--zum Zeitpunkt der Sixcherung des T, sollte das Logfile ca 70% voll sein





--DB Settings

--Was sollte ich kontrollieren ...?

--Bercihte: Datenträgerverwendung: wie voll
Dateigrößen und Wachstumraten


VLF-- virt Logfiles


----------------------------
    10 VLF                10VLF
----------------10MB---------10MB ..bei 1000 MB = 1000 VLF



----------------------------
    10 VLF                10VLF
----------------100MB---------100MB     bei 1000MB nur 100 VLF



----------VLF--------------
TX TX tX TX TX TX TX TX! 
--------------------------


nicht mehr als 3000 6000 VLFs


DB Design: 
Diagramme (Datentypen)

Haben wir PK , aber keine Beziehungen


dbcc showcontig('TABELLE')
--Anzahl der Seiten und mittl Fülldichte



--Mittel zur Entlastung des Datenträgers

--Part Sicht

--Dateigruppen

--Partitionierung























*/