/*
create database ... viele Fehler!!!

wie groß ist die DB?
16 MB				(8 MB Daten 8 MB Log)
Wachstumsraten	      +64MB

SQL 2014 ;-)
5 MB + 2 MB ==> 7 MB 
Wachstum: 1 MB pro Datendatei + 10% Logfile

Was ist besser?
was wird in 3 Jahren sein .. wie groß?
Perfmon
DMV Systemsichten
DataCollector
getrennte bzw evtl andere Laufwerke



*/

create database testdb;
GO

use testdb;
GO


drop table t1
create table t1(id int identity, spx char(4100)) --varchar variabel


insert into t1
select 'XY'
GO 20000

--Dauer : 44 Sekunden
--Wie groß ist eigtl t1: 20000* 4kb ==> 80MB

--Vergrößerung auf 400/100MB

--nach man. Vergrößerung: 37 Sek

--ca 150 Vergrößerungen * 5 ms + Logilewachstum
