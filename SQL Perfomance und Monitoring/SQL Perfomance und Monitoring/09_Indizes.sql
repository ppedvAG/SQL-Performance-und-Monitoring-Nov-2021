/*

Indizes haben Auswirkung auf

das Sperrniveau

dass Abfragen statt 30 Sek 0 Sek  dauern
statt 20000 Seiten nur 3 Seiten 
der RAM Verbrauch geirnger wird
die CPU Last sich verringert
MAXDOP Einsatz sinkt, weil KOstenschwellwert geringer wird

..und von all dem auch das Gegenteil


Welche Indizes gibts 

CL IX  Gruppierter

= Tabelle in immer sortierter Form (phsikalisch)
der HEap existiert nicht mehr
gut bei Abfragen mit auch rel groﬂer Ergebnismenge 
und bei Abfragen mit Eingrenzung auf Bereiche wie between like A%

NON CL IX nicht gruppierter
kopiert Daten aus der Tabelle und bildet eig sortierte Seiten
mit Zeigern auf die Orig Datens‰tze

kann es bis ca 1000 mal pro Tabelle geben... sind ja nur Kopien;-)
ist gut bei rel geringer Ergebnismenge
Gut bei Abfragen mit = Operatoren, ID Werten etc..




---------------------------------------
HEAP= ist einen Tabelle ohne CL IX


eindeutigen IX
zusammengesetzter IX
IX mit eingeschlossenen Spalten
ind Sichten
part. IX
gefilterte IX
reale hypoth. Indizes
abdeckende IX
-----------------------------------------------
Columnstore IX  (gr und nicht gr)












*/