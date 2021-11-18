/*

RAM
Das OS berücksichtigen
mind 4 GB... allerdings zuviel macht wenig Sinn

Install-Pfad ..egal


ServiceKonten
NT Service\....  lok Konten --> \\Freigabe  (Computerkonto)
-->autom Kennwortänderungen
NT Service wird immer! für lokale Zugriffe verwendet
Im Fall von DomKonto --> nur für Remote.. lokal immer noch NT Service

MAXDOP 
= Anzahl der Kerne max 8
wieviel Kerne verwendet eine Abfrage maximal ... 


Volumewartungstask: 
Lok Sicherheitsrichtlinie
Einem guten Admin ist ds rel Wurscht
Dateivergrößerungen der DAtendateien werden nicht mehr vorher "ausgenullt"
----------------------
111111111111111110?0?0?
----------------------


DB Pfade
Datendateien und Logdateien
trenne die beiden physikalisch



TempDB 
was kommt dor rein....?
#tab temporäre Tabelle
##tab
select .. order by .. Auslagerungen
Zeilenversionierung
IX Rebuilds
eig HDDS für Log und Daten
Anzahl der Dateien = Anzahl der Kerne (Max 8)
TRaceflags
T 1117   T 1118
immer gleich große DB DatenDateien
DS kommen in Seiten .. Seiten werden in Blöcken (8 Seiten)
--keine mixed extents  sondern extents




--Reporting: Ressource Governor!




CPU  MAXDOP


schulung\Administrator
ppedv2019!



Kontrolle des HV-SQL1


MAXDOP
im Setup: Anzahl der Kerne max 8


MAX RAM
doof.. akt Wert 2,1PB  ?? sollte eher 3500..und gilt sofort

MIN RAM
der Wert gilt erst, wenn er erreicht wurde
eigtl erst dann wenn Konkurrenz (2te Instanz, andere Software)
Task Manager: Max Arbeitssatz = Peek Wert = Min RAM


DB Pfade

Tempdb Dateien

2 Dateien fehlen .. muss man nachholen






SSMS akt Version 18.10 (+Azure Data Studio)


*/