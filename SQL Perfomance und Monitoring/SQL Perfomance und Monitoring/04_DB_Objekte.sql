/*
TSQL  Objektkunde ;-)

SQL Statement

a) adhoc .. select  join join 
b) Sicht    select from view
c) f()  .. select from f() 
d) proz ... exec Proc 


gedacht...
--langsam.............................schnell..
a)       b)  d)                            c)

in Realität eher so
c)       a|b								d



Was ist...:

View/Sicht
keine Daten
gemerkte Abfrage

create view vname
as
select ...

select * from (select * from ...) t where t.id= 1


Sichten verhalten sich wie Tabellen... SEL INS UP DEL 
auch Rechte

daher gilt:
adhoc und Sicht sind gleich schnell
a|b


Prozeduren = Batch

create proc procname @par1
as
Code
--INS UP DEL SEL

exec procname Nico, 100

bei ersten Aufruf wird Plan kompiliert und liegt auch nach Neustart vor
man spart sich Analyse und Kompilierzeit
(Messbar bei set statsistics io on)


Funktionen
--man ist nicht schlecht beraten alle Funktionen als schlecht zu klassifzieren
--den Gegenbeweis muss man antreten.. 

--aber unheimlich praktisch...
select f(spalte), f(wert) from f(wert) where f(spalte) = f(wert)

--gut
where Famname like 'N%'

--schlecht: zeilenweises Vorgehen
where left(1,Famname) = 'N'

Kontrolle via QueryStore zumb Beispiel: Eigeschaften der DB. muss erst aktiviert werden

