/*
Ziel weniger IO .. weniger Seiten

Kompression ?

Page 
macht zuerst Zeilenkompression
dann Präfixkompression



Zeilenkompression
macht aus char ein varchar
nicht der Datentyp wird geändert, sondern er wird nur anderes behandelt
und bringt mehr DS in  einer Seite unter 



40% bis 60%



*/

use testdb   -- t1


-- SQL Server neustarten
--Messung: RAM Verbrauch des SQL Servers: 266

set statistics io, time on

select * from testdb..t1


--Seiten:20000  Dauer 4,7 Sek  CPU  780ms  Speicher  + 160MB

--Nach Kompression und Neustart

--Speicher des SQL Server: sogut wie identisch

--Kompression macht man nicht wg der kompr Tabelle, sondern 
--,dass man mehr RAM für andere zur Verfügung hat


--Seiten:20000  weniger oder gleich  aber Seit
en kleiner--< nö
--Dauer 4,7 Sek  mehr oder gleich
--CPU  780ms  mehr 
--Speicher: weniger aber mehr 0,5 MB oder gleich 

--Client bekommt definitv 160MB

--Archivtabelle

--Partitionierung



