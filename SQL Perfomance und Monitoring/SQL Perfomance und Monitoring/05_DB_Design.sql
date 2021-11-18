/* Stichworte zum Thema DB Design


Redundanz Normalsierung PK FK Beziehung Datentyen Generalisierung


Normalisierung ist ok, aber auch seitens Perf kontraproduktiv
Normalisierung  1NF 2 NF 3 NF ...
PK ----Beziehung---->  FK
+
Je mehr Joins eine Abfrage besitzt, desto aufwendiger
Redundanz hilft, muss aber gepflegt werden





Datentypen
immer gute Datentypen vergeben .. heisst: nicht zu groß und nicht zu gering
datetime nicht wenn nur Datum gebraucht wird
varchar wenn kein char gebraucht wird 
unicode , wo unicode sein muss
...


Allerdings immer auf physikalische Architektur achten


DS werden in Seiten gespeichert
8 Seiten am Stück = 1 Block


1 Seite immer 8192 bytes
1 DS muss in Seite passen (fast immer )
1 Seite hat max 8072 bytes Nutzlast
1 DS kann max 8060 groß werden (fast immer)

Seiten werden 1:1 in RAM gelesen
Seiten Blöcke


*/

select * from sysmessages 

select * from customers

--unnötig oft unicode --menge mal 2 

set statistics io, time on
select * from testdb..t1 --160MB.. char(4100) * 20000= 80MB--> RAM

--Kann man den Verlust

use testdb

dbcc showcontig('t1')

--- Gescannte Seiten.............................: 20000

-- Mittlere Seitendichte (voll).....................: 50.79%



----MAXDOP

SELECT Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.ContactTitle, Customers.City, Customers.Country, Orders.Freight, Orders.ShipCity, Orders.ShipCountry, Orders.EmployeeID, Orders.OrderDate, [Order Details].OrderID, [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, Products.ProductName, Products.UnitsInStock, Employees.LastName, Employees.FirstName, Employees.BirthDate
into ku
FROM   Customers INNER JOIN
         Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
         Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
         [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
         Products ON [Order Details].ProductID = Products.ProductID


insert into ku
select * from ku






