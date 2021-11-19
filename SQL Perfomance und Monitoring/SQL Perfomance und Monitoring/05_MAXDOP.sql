/* Serversetting

scoped database

MAXDOP... 
Wieviele CPUs verwendet eine Abfrage?
max soviele wie Kerne?

MAXDOP gibt vor, was max ist?

SQL 2014 MAXDOP = 0 ..heisst alle CPUs

SQL 2016 MAXDOP (Anzahl der Kerne , aber nicht mehr als 8)


Kostenschwellenwert: 5 SQL Dollar



*/

use northwind;


set statistics io, time on --
--Tipp.. wenn man es nicht braucht.. deaktivieren

select country, city, companyname, sum(unitprice*quantity)
from ku
group by country, city, companyname

---41622 Seiten
--Doppelpfeile im Plan = Paral..
set statistics io, time off

--Messungen
--bei 8 CPUs: 1000ms CPU Zeit
--bei 1 CPU:  500ms
--bei 4 CPus: etwas besser als mit 8 
--bei 6 kaum bsser als mit 4 ...

--der MAXDOP Wert kann auch pro DB seit sql 2016 eingestellt werden

--oder auch so..
select country, city, companyname, sum(unitprice*quantity)
from ku
group by country, city, companyname
option (maxdop 1)


--Empfehlungen: 50 bei OLTP und 25 bei DW für Kostenschwellwert
--pro Server


SUSPENDED RUNNNING RUNNABLE

SOS Scheduler
CXPACKET

select * from sys.dm_os_wait_stats