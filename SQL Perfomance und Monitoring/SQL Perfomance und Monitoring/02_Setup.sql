/*

RAM
Das OS ber�cksichtigen
mind 4 GB... allerdings zuviel macht wenig Sinn

Install-Pfad ..egal


ServiceKonten
NT Service\....  lok Konten --> \\Freigabe  (Computerkonto)
-->autom Kennwort�nderungen
NT Service wird immer! f�r lokale Zugriffe verwendet
Im Fall von DomKonto --> nur f�r Remote.. lokal immer noch NT Service

MAXDOP 
= Anzahl der Kerne max 8
wieviel Kerne verwendet eine Abfrage maximal ... 


Volumewartungstask: 
Lok Sicherheitsrichtlinie
Einem guten Admin ist ds rel Wurscht
Dateivergr��erungen der DAtendateien werden nicht mehr vorher "ausgenullt"
----------------------
111111111111111110?0?0?
----------------------


DB Pfade
Datendateien und Logdateien
trenne die beiden physikalisch



TempDB 
was kommt dor rein....?
#tab tempor�re Tabelle
##tab
select .. order by .. Auslagerungen
Zeilenversionierung
IX Rebuilds
eig HDDS f�r Log und Daten
Anzahl der Dateien = Anzahl der Kerne (Max 8)
TRaceflags
T 1117   T 1118
immer gleich gro�e DB DatenDateien
DS kommen in Seiten .. Seiten werden in Bl�cken (8 Seiten)
--keine mixed extents  sondern extents









CPU  MAXDOP


schulung\Administrator
ppedv2019!



*/