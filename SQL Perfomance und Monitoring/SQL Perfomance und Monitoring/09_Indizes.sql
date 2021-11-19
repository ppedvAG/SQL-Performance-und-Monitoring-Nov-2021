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
der Heap existiert nicht mehr
gut bei Abfragen mit auch rel großer Ergebnismenge 
und bei Abfragen mit Eingrenzung auf Bereiche wie between like A%

NON CL IX nicht gruppierter
kopiert Daten aus der Tabelle und bildet eig sortierte Seiten
mit Zeigern auf die Orig Datensätze

kann es bis ca 1000 mal pro Tabelle geben... sind ja nur Kopien;-)
ist gut bei rel geringer Ergebnismenge
Gut bei Abfragen mit = Operatoren, ID Werten etc..


select * from customers



---------------------------------------
HEAP= ist einen Tabelle ohne CL IX


! eindeutigen IX
! zusammengesetzter IX mehr als 4 Spalten selten.. max 16 od 900bytes Schlüssellänge
! IX mit eingeschlossenen Spalten Lookup vermeiden ohne Baum zu belasten
ind Sichten
! part. IX
! gefilterte IX.. wenn weniger Ebenen statt universal IX
! reale hypoth. Indizes.. DTA optimierungsratgeber
abdeckende IX --der idelae IX ohne Lookup
-----------------------------------------------
Columnstore IX  (gr und nicht gr)



select * into kunden from customers
*/
insert into customers (customerid, CompanyName)
values ('ppedv', 'Fa. ppedv AG')


insert into kunden (customerid, CompanyName)
values ('ppedv', 'Fa. ppedv AG')

select * from customers

select * from kunden


select * from bestdemo --im Plan   SCAN  (TABLE CL SCAN)

--Fehlernummer 1: PK macht immer einen PK als eindeutig CL IX
--PK verlangt nur Eindeutigkeit


--sollte man das tun... zuerst den CL IX festlegen!



select top 3 * from ku

alter table ku add id int identity



set statistics io, time on


--Plan: TABLE SCAN
select ID from ku where id=100  --56053 Seiten

--besser: 
--CL IX auf Orderdate wg Bereichsabfragen wie QUartal oder Jahresvergleiche
--somit NCL IX auf ID
select ID from ku where id = 100 --IX SEEK  3 Seiten 0 ms
--Effekt.. kein MAXDOP

--IX Seek + Lookup 50%
select id , freight from ku where id = 100  --4 Seiten 

--bei ca 10000 Wechsel von Seek auf Table Scan
select id , freight from ku where id <11010
---Lookup wird immer teuerer

--will Anruf vermeiden
--Spalten in IX mit reinnehmen
--NIX_ID_FR
select id , freight from ku where id <800000
--sogar mit 800000 noch seek ;-)

select id , freight, city from ku where id = 100
----         SELECT                       WHERE
----     eingeschl...                 Schlüsselspalten

--ideale IX:
select country, city, SUM(unitprice*quantity) 
from ku
where freight = 0.02
group by country, city


select country, city, SUM(unitprice*quantity) 
from ku
where freight = 0.02 and employeeid = 2
group by country, city


--NIX_FR_EID_i_CYCIUPQU

--bei oder ist SQL draussen!
select country, city, SUM(unitprice*quantity) 
from ku
where freight = 0.02 or employeeid = 2
group by country, city


--Klammernsetzung
select country, city, SUM(unitprice*quantity) 
from ku
where 
	freight = 0.02 
	or ( employeeid = 2
	and city = 'London')
group by
	country, city








select id , freight from ku1 where id < 100 
select id , freight from ku1 where id < 13000 
select id , freight from ku1 where id < 800000 
select country, city, SUM(unitprice*quantity) 
from ku1 
where EmployeeID = 5 and ShipCity = 'Berlin'
group by Country, City 
Labs: SQL Server Perfomance Monitoring und Tuning 
Andreas Rauch – ppedv AG 
Letzte Aktualisierung: Mittwoch, 22. April 2020 
select country, city, SUM(unitprice*quantity) 
from ku1 
where EmployeeID = 5 or ShipCity = 'Berlin'
group by Country, City 

--gefilterter Index

--IX mit filter USA
select freight from ku
where country = 'USA' 

--IX_alleLänder


select * into ku2 from ku


select top 3 * from ku

--Agg, where 

--alles aus 1998
--Summe Frachtkosten pro Firma aus 1998

--STR SCHIFT R


select Companyname, sum(freight) 
from ku
where
	--year(orderdate) =1998 --immer scan
	orderdate between '1.1.1998' and '31.12.1998 01:00:00.000'
group by companyname

--IX: IX_ODate_i_CNAme_Fr

CREATE NONCLUSTERED INDEX IX_ODate_i_CNAme_Fr
ON [dbo].[ku] ([OrderDate])
INCLUDE ([CompanyName],[Freight])

--3048 Seiten... 60ms   46 ms

--jetzt auf KUJ2 mit ColumnStore IX

select Companyname, sum(freight) 
from ku2
where
	--year(orderdate) =1998 --immer scan
	orderdate between '1.1.1998' and '31.12.1998 01:00:00.000'
group by companyname


--?? 3,7 MB ????? 
--a) stimmt  !!!!!!!!!
--b) stimmt nicht

--dann komm tnur eins in Frage--> Kompression

--statt 320 + IX 210MB --> 3,1 MB!!

--auch im RAM!!!



--