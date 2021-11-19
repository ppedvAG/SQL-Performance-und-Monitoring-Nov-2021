--Probleme bei Tabellen

--Brent Ozar
--sp_blitzindex Hilfe bei Suche nach 
--Problemen bei Indizes (fehelend, überflüssig, überlappend, Heaps
--forward Record Counts

set statistics io on

select * from ku where shipcountry = 'Germany' --56053

--Wie voll sind die Seiten und wieviele hat die Tabelle?
dbcc showcontig('ku') --42181 ?? weniger als oben...

--weil doofer HEAP: + neue Spalte--> roward record count
--sollte immer NULL oder 0 sein

--Idee zur Behebung: CL IX.. hier wird es nie forward record counts geben

select *, forwarded_record_count --sollte 0 sein
from sys.dm_db_index_physical_stats
		(db_id(),object_id('ku'), NULL, NULL, 'detailed')


