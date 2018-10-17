

-- Klassen toevoegen
INSERT INTO `klassen` (`klas_id`, `opleiding_opleiding_id`, `klas_naam`) VALUES (NULL, '', '1B'), (NULL, '', '1C')

--- Leerlingen toevoegen:
INSERT INTO `leerlingen` (`leerling_id`, `klassen_klas_id`, `voornaam`, `achternaam`, `adres`, `postcode`, `woonplaats`, `geboorte_datum`, `telefoon_nummer`, `email`) VALUES (NULL, '', 'Code', 'Gorilla', 'Grote Markt', '9730 AA', 'Groningen', '2012-12-12', '0612345678', 'info@codegorilla.nl'), (NULL, '', 'Piet', 'Hein', 'Damsterdiep 275', '9713EE', 'Groningen', '2010-06-06', '0612436587', 'piethein@bestaatniet.nu')

--- Leraren toevoegen:
INSERT INTO `leraren` (`leraar_id`, `voornaam`, `achternaam`, `adres`, `postcode`, `woonplaats`, `geboorte_datum`, `telefoonnummer`, `email`) VALUES (NULL, 'Jan', 'Peter', 'Stationstraat', '3434BE', 'Den Haag', '1955-12-03', '0687654321', 'janpeter@hotmail.com'), (NULL, 'Mark', 'Rutte', 'Het Torentje', '2121EA', 'Den Haag', '1966-05-12', '0632145687', 'm.rutte@nederland.nl')

-- Lessen toevoegen:
INSERT INTO `lessen` (`les_id`, `klassen_klas_id`, `klassen_opleiding_opleiding_id`, `leraren_leraar_id`, `lokalen_lokaal_id`, `vakken_vak_id`, `vak_uur`, `vak_datum`) VALUES (NULL, '', '', '', '', '', '4', '2018-10-24 09:00:00'), (NULL, '', '', '', '', '', '5', '2018-10-24 10:00:00')

-- Lokalen toevoegen:
INSERT INTO `lokalen` (`lokaal_id`, `lokaal_verdieping`, `lokaal_naam`) VALUES (NULL, '0', 'Natuurkunde'), (NULL, '0', 'Scheikunde')
INSERT INTO `lokalen` (`lokaal_id`, `lokaal_verdieping`, `lokaal_naam`) VALUES (NULL, '1', 'Engels'), (NULL, '1', 'Duits')

-- Opleidigen toevoegen:
INSERT INTO `opleidingen` (`opleiding_id`, `opleiding_naam`, `opleiding_duur`) VALUES (NULL, 'Programmeren', '3 maand'), (NULL, 'Conservatorium', '8 jaar')

-- Vakken toevoegen:
INSERT INTO `vakken` (`vak_id`, `vak_naam`) VALUES (NULL, 'Tekenen'), (NULL, 'Techniek')

--- Specifieke klas vegen:
MariaDB [school]> SELECT * FROM klassen WHERE klas_naam='1A'

-- Leerling vinden:
MariaDB [school]> SELECT * FROM leerlingen WHERE voornaam='Piet'

-- Aantal leerlingen in klas:
MariaDB [school]> SELECT COUNT(voornaam) FROM leerlingen