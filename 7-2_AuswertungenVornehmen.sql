/*
*****************************
developer: Daan de Dios
date: 2018-10-26
function: 7-2
*****************************
######################################
!! Dies sind die meine Lösungen !!
!! Bei Fragen stehe ich euch gerne zu Verfügung: "SQL.dedios@gmail.com" oder per WhatsApp.
######################################
*/

/*Aufgabe 1
Welcher Film dauert am längsten und welcher Kategorie gehört er an ?*/
SELECT * FROM Film
  ORDER BY Dauer DESC
  LIMIT 1;
/*33	Band of Brothers	603	Krieg	2001	18	4	22.50	USA/GB */



/*Aufgabe 2
Welches sind die drei häufigsten Vornamen bei Leuten, deren Nachname mit "von..." beginnt un bei Leuten mit "di..." ?*/
SELECT Nachname, COUNT(Nachname) AS "Anzahl" FROM Kunde
  WHERE Nachname LIKE "von%"
  GROUP BY Nachname
  ORDER BY Anzahl DESC
  LIMIT 3;
/*
von Ah	2
Vondras	2
Von Allmen	2
 */
SELECT Nachname, COUNT(Nachname) AS "Anzahl" FROM Kunde
  WHERE Nachname LIKE "di%"
  GROUP BY Nachname
  ORDER BY Anzahl DESC
  LIMIT 3;
/*
Dietrich	9
Di Santo	5
Diethelm	4
*/



/* Aufgabe 3
Wie viele Nachnamen gibt es, die mit "M" anfangen, von zwei beliebigen Buchstaben gefolgt werden, und mit "er" enden ?
Wie viele */
SELECT Nachname FROM Kunde
  WHERE Nachname LIKE "M__er"
  GROUP BY Nachname;
/*
Mäder
Meier
Meyer
Moser
 */
SELECT Nachname FROM Kunde
  WHERE Nachname LIKE "M%er"
  GROUP BY Nachname;



/* Aufgabe 4
Welches sind die 10 häufigsten Vornamen bei den Kunden ?*/
SELECT Vorname, COUNT(Vorname) AS "Anzahl" FROM Kunde
  GROUP BY Vorname
  ORDER BY Anzahl DESC
  LIMIT 10;
/*
Hans
Peter
Walter
Werner
Ernst
Josef
Kurt
Paul
Markus
Max
*/



/* Aufgabe 5
Wie oft kommen die Vornamen Maria oder Elisabeth bei den Kunden vor ?*/
SELECT Vorname, COUNT(Vorname) AS "Anzahl" FROM Kunde
  WHERE Vorname = "Maria"
  OR Vorname = "Elisabeth"
  GROUP BY Vorname;
/*
Elisabeth	44
Maria	44
*/


/* Aufgabe 6
Wie vile Buchstaben haben die kürzesten Strassennamen ? Wie heissen sie und in welcher Ortschaft befinden sie sich*/
SELECT Strasse, Ort, LENGTH(Strasse) AS "Anzahl" FROM Kunde
  GROUP BY Strasse
  ORDER BY LENGTH(Starsse);


/* Aufgabe 7
Wie viele Zeichen hat der längste Ortschaftsname ?*/
SELECT LENGTH(Ort) FROM Kunde
  GROUP BY Ort
  ORDER BY LENGTH(Ort) DESC
  LIMIT 1;
/*17*/


/* Aufgabe 8
Wie heisst die Ortschaft mit den meisten Zeichen ?*/
CREATE OR REPLACE VIEW ORTE_v AS
SELECT Ort FROM Kunde
  GROUP BY Ort
  ORDER BY LENGTH(Ort) DESC
  LIMIT 1;
/*Rickenbach b. Wil*/



/* Aufgabe 9
Welche Länge haben die Ortschaftsnamen im Durchschnitt ?*/
SELECT AVG(LENGTH(Ort)) AS "AVG Länge" FROM Kunde;
/*6.4584*/


/* Aufgabe 10
 Welches ist der Durchschnittswert aller Filmlängen ?*/
SELECT AVG(Dauer) AS "AVG Dauer" FROM Film
/*117.7653*/