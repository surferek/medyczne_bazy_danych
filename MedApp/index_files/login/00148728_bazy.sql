-- phpMyAdmin SQL Dump
-- version home.pl
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 14 Sty 2019, 14:36
-- Wersja serwera: 5.7.22-22-log
-- Wersja PHP: 5.6.34

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `00148728_bazy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Badania`
--

CREATE TABLE IF NOT EXISTS `Badania` (
  `idBadania` int(11) NOT NULL AUTO_INCREMENT,
  `wynik` varchar(255) NOT NULL,
  `idLaboratorium` int(11) NOT NULL,
  `idSlownikBadan` int(11) NOT NULL,
  PRIMARY KEY (`idBadania`),
  KEY `fk_Badania_Laboratorium1_idx` (`idLaboratorium`),
  KEY `fk_Badania_SlownikBadan1_idx` (`idSlownikBadan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Choroby`
--

CREATE TABLE IF NOT EXISTS `Choroby` (
  `idChoroby` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa_choroby` varchar(45) NOT NULL,
  `idPacjent` int(11) NOT NULL,
  `idSlownikChorob` int(11) NOT NULL,
  PRIMARY KEY (`idChoroby`),
  KEY `fk_Choroby_Personel1_idx` (`idPacjent`),
  KEY `fk_Choroby_SlownikChorob1_idx` (`idSlownikChorob`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=8 ;

--
-- Zrzut danych tabeli `Choroby`
--

INSERT INTO `Choroby` (`idChoroby`, `nazwa_choroby`, `idPacjent`, `idSlownikChorob`) VALUES
(1, 'Reumatyzm', 1, 2),
(2, 'Menopauza', 2, 1),
(3, 'Angina', 3, 0),
(4, 'Padaczka', 4, 3),
(5, 'Angina', 5, 0),
(6, 'Bol ucha', 6, 4),
(7, 'Glistnica', 7, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `GabinetLekarski`
--

CREATE TABLE IF NOT EXISTS `GabinetLekarski` (
  `idGabinetLekarski` int(11) NOT NULL AUTO_INCREMENT,
  `gabinet_lekarski_opis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idGabinetLekarski`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `GabinetLekarski`
--

INSERT INTO `GabinetLekarski` (`idGabinetLekarski`, `gabinet_lekarski_opis`) VALUES
(1, 'Gabinet lekarza rodzinnego: lek. Jan Kowalski, lek. Julian Nowak, lek. Natalia Krest');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `KartySzczepien`
--

CREATE TABLE IF NOT EXISTS `KartySzczepien` (
  `idKartySzczepien` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `nazwa` varchar(100) NOT NULL,
  `idPacjent` int(11) NOT NULL,
  PRIMARY KEY (`idKartySzczepien`),
  KEY `fk_KartySzczepien_Personel1_idx` (`idPacjent`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=8 ;

--
-- Zrzut danych tabeli `KartySzczepien`
--

INSERT INTO `KartySzczepien` (`idKartySzczepien`, `data`, `nazwa`, `idPacjent`) VALUES
(1, '1977-12-06', 'Gruzlica', 1),
(2, '1985-12-15', 'Wzw B', 2),
(3, '1997-08-13', 'Blonica, Tezec, Krztusiec', 3),
(4, '1995-02-22', 'Odra', 4),
(5, '1953-04-20', 'Pneumokoki', 5),
(6, '1991-11-24', 'Rozyczka', 6),
(7, '1984-08-27', 'Swinka', 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Laboratorium`
--

CREATE TABLE IF NOT EXISTS `Laboratorium` (
  `idLaboratorium` int(11) NOT NULL AUTO_INCREMENT,
  `data_wykonania` date NOT NULL,
  `godzina` varchar(4) NOT NULL,
  `idPersonel` int(11) NOT NULL,
  PRIMARY KEY (`idLaboratorium`),
  KEY `fk_Laboratorium_Personel1` (`idPersonel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=21 ;

--
-- Zrzut danych tabeli `Laboratorium`
--

INSERT INTO `Laboratorium` (`idLaboratorium`, `data_wykonania`, `godzina`, `idPersonel`) VALUES
(1, '2018-11-02', '1251', 0),
(2, '2018-11-14', '1256', 0),
(3, '2018-11-04', '1553', 0),
(4, '2018-11-10', '1008', 0),
(5, '2018-11-06', '1325', 0),
(6, '2018-11-10', '1251', 0),
(7, '2018-11-07', '1219', 0),
(8, '2018-11-08', '1525', 0),
(9, '2018-11-13', '1052', 0),
(10, '2018-11-12', '1546', 0),
(11, '2018-11-08', '1255', 0),
(12, '2018-11-12', '1031', 0),
(13, '2018-11-07', '1410', 0),
(14, '2018-11-18', '1358', 0),
(15, '2018-11-12', '1253', 0),
(16, '2018-11-16', '1126', 0),
(17, '2018-11-08', '1232', 0),
(18, '2018-11-22', '1225', 0),
(19, '2018-11-24', '1230', 0),
(20, '2018-11-18', '1543', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Pacjent`
--

CREATE TABLE IF NOT EXISTS `Pacjent` (
  `idPacjent` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `PESEL` bigint(20) unsigned NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefon` bigint(11) unsigned NOT NULL,
  `adres` varchar(100) NOT NULL,
  `kod_pocztowy` varchar(5) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`idPacjent`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=9 ;

--
-- Zrzut danych tabeli `Pacjent`
--

INSERT INTO `Pacjent` (`idPacjent`, `imie`, `nazwisko`, `PESEL`, `email`, `telefon`, `adres`, `kod_pocztowy`, `status`) VALUES
(1, 'Marta', 'Kozioł', 77120578412, 'marta.koziol@gmail.com', 4294967295, 'Wrocław Wyszyńskiego 11/6', '51001', '1'),
(2, 'Aleksandra', 'Kamyczek', 85041256874, 'a.kamyczek@onet.pl', 620112587, 'Wrocław Piramowicza 2/4', '50851', '1'),
(3, 'Karolina', 'Malek', 96031245732, 'k.malek@gmail.com', 111222333, 'Wroclaw Jasna 87/2', '50741', '0'),
(4, 'Michał', 'Orzeł', 85022298124, 'm.orzelek@gmail.com', 584777142, 'Wroclaw Krótka 8', '59365', '1'),
(5, 'Stefan', 'Januszewski', 52032456912, 'sztefanJ@o2.pl', 666458961, 'Wroclaw Grosikowa 13/1', '52471', '1'),
(6, 'Patrycja', 'Bieras', 81112694782, 'p.bieras@gmai.com', 632145897, 'Wrocław Wyszyńskiego 8/6', '54258', '1'),
(7, 'Ziutek', 'Poczwara', 83072935478, 'jakis@email.ziutek', 535535535, 'Nowowiejskawiesniak 5/22', '55222', '1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Personel`
--

CREATE TABLE IF NOT EXISTS `Personel` (
  `idPersonel` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(200) NOT NULL,
  `nazwisko` varchar(200) NOT NULL,
  `zawod` varchar(200) NOT NULL,
  PRIMARY KEY (`idPersonel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=9 ;

--
-- Zrzut danych tabeli `Personel`
--

INSERT INTO `Personel` (`idPersonel`, `imie`, `nazwisko`, `zawod`) VALUES
(1, 'Jan', 'Kowalski', 'lek'),
(2, 'Julian', 'Nowak', 'lek'),
(3, 'Natalia', 'Krest', 'lek'),
(4, 'Marta', 'Fromm', 'rec'),
(5, 'Maria', 'Tudor', 'rec'),
(6, 'Mariusz', 'Grygiel', 'lab'),
(7, 'Justynian', 'Herbata', 'lab'),
(8, 'Weronika', 'Rutkowska', 'piel');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Recepty`
--

CREATE TABLE IF NOT EXISTS `Recepty` (
  `opis_recepty` text NOT NULL,
  `idWizyty` int(11) NOT NULL,
  PRIMARY KEY (`idWizyty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `Recepty`
--

INSERT INTO `Recepty` (`opis_recepty`, `idWizyty`) VALUES
('Lyprinol', 1),
('Fitoestrogeny', 2),
('Augmentin', 3),
('Absenor', 4),
('Augmentin', 5),
('Otinum krople do uszu', 6),
('Albendazol', 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `SlownikBadan`
--

CREATE TABLE IF NOT EXISTS `SlownikBadan` (
  `idSlownikBadan` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa_badania` varchar(45) NOT NULL,
  `norma` varchar(255) NOT NULL,
  PRIMARY KEY (`idSlownikBadan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=306 ;

--
-- Zrzut danych tabeli `SlownikBadan`
--

INSERT INTO `SlownikBadan` (`idSlownikBadan`, `nazwa_badania`, `norma`) VALUES
(1, 'Glukoza', '7 - 110'),
(2, 'Azot mocznika', '10 - 20'),
(3, 'Kreatynina', '.4 - 1.0'),
(4, 'Sód', '135 - 45'),
(5, 'Potas', '3.5 - 5.5'),
(6, 'Chlor', '99 - 110'),
(7, 'Dwutlenek węgla', '22 - 33'),
(8, 'Wapń', '8.4 - 10.2'),
(9, 'Bilirubina', '0.1 - 0.2'),
(10, 'Całkowita bilirubina', '.0 - 1.5'),
(11, 'Całkowite białko', '6.1 - 7.9'),
(12, 'Albumina', '3.4 - 4.8'),
(13, 'Albumina/Globulina stosunek', '1.0 - 2.0'),
(14, 'Aminotransferaza alaninowa', '19 - 60'),
(15, 'Aminotransferaza asparaginianowa', '13 - 37'),
(16, 'Fosfotaza alkaliczna', '38 - 126'),
(17, 'Glukoza', '70 - 110'),
(33, 'Prealbumina', '18 - 38'),
(34, 'Cholesterol', '120 - 200'),
(35, 'Trójgliceryd', '35 - 160'),
(36, 'Lipoproteina o dużej gęstości', '45 - 99'),
(37, 'Lipoproteina o niskiej gęstości', '20 - 130'),
(38, 'Fosforawy', '2.7-4.5'),
(39, 'Magnez', '1.2 - 2.2'),
(40, 'Dehydrogenaza mleczanowa', '135 - 225'),
(41, 'Żelazo', '49 - 67'),
(42, 'Całkowita zdolność wiązania żelaza', '250 - 450'),
(43, 'Fe Sat ', '15 - 55'),
(44, 'Ferrytyna', '30 - 400'),
(45, 'B12', '246-911'),
(46, 'Folian', '4.2 - 19.9'),
(47, 'GGT', '7 - 50'),
(48, 'Uric Acid', '2.4 - 7.0'),
(49, 'Tyroksyna', '4.6 - 12.0'),
(50, 'TSH', '0.35 - 5.50'),
(51, 'Leukocyty', '3.4 - 11.0'),
(87, 'Limfocyty %', '10.0 - 40.0'),
(88, 'Monocyty %', '1.7 - 9.3'),
(89, 'Granulocyty  obojetnochłonne %', '42.2 - 75.2'),
(90, 'Limfocyty', '1.2 - 3.4'),
(91, 'Monocyty', '.2 - 15.0'),
(92, 'Granulocyty  obojętnonochłonne', '1.4 - 6.5'),
(93, 'Erytrocyty', '4.0 - 5.50'),
(136, 'Hemoglobina', '11.5 - 16.0'),
(137, 'Hematokryt', '32.0 - 45.0'),
(138, 'Granulocyty  eozynochłonne', '.0 - 10.0'),
(184, 'Płytki krwi', '130 - 400'),
(231, 'Kolor moczu', 'Yellow'),
(232, 'Przejrzystość moczu', 'Clear'),
(233, 'pH moczu', '5.0 - 9.0'),
(234, 'Azotany w moczu', 'Neg'),
(235, 'U-Prot Urinary Protein w moczu', 'Neg'),
(236, 'U-Glu Urinary Glucose w moczu', 'Norm'),
(237, 'Ketony w moczu', 'Neg'),
(238, 'Krew w moczu', 'Neg'),
(239, 'Leukocyty w moczu', 'Neg'),
(240, 'Kryształ w moczu', 'None'),
(297, 'Śluz w moczu', 'None'),
(298, 'Amorficzność moczu', 'None'),
(299, 'DHEA Serum', '1.9 - 7.6'),
(300, 'Kortyzol', '4.3 - 22.4'),
(301, 'Granulocyty zasadochłonne', '.0 - 2.0'),
(302, 'Hormon przytarczyczny', '15 - 65'),
(303, 'Witamina A Serum', '30  -90'),
(304, 'Witamina D 2 hydroxy', '15 - 75'),
(305, 'Cynk serum', '70 - 159');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `SlownikChorob`
--

CREATE TABLE IF NOT EXISTS `SlownikChorob` (
  `idSlownikChorob` int(11) NOT NULL,
  `nazwa_choroby` varchar(45) NOT NULL,
  `typ_choroby` enum('ca','ce','cg','cizp','cm','cmnp','cnw','cn','cnguik','cp','cpdp','cs','cuk','cuoia','cup','cur','cuw','cwr','cwic','cz','cziju','cżnp','ic','noc','uuiz','uisn','wpzzcpip','zs') NOT NULL,
  PRIMARY KEY (`idSlownikChorob`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `SlownikChorob`
--

INSERT INTO `SlownikChorob` (`idSlownikChorob`, `nazwa_choroby`, `typ_choroby`) VALUES
(0, 'Angina', 'cnguik'),
(1, 'Menopauza', 'ce'),
(2, 'Reumatyzm', 'ca'),
(3, 'Padaczka', 'cn'),
(4, 'Bol ucha', 'cnguik'),
(5, 'Glistnica', 'cp'),
(6, 'Atopowe zapalenie skory', 'cs');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Terminarz`
--

CREATE TABLE IF NOT EXISTS `Terminarz` (
  `idTerminarz` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `godzina` time NOT NULL,
  `idPersonel` int(11) NOT NULL,
  `idLaboratorium` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTerminarz`),
  KEY `fk_Terminarz_Personel1_idx` (`idPersonel`),
  KEY `fk_Terminarz_Laboratorium1_idx` (`idLaboratorium`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=19 ;

--
-- Zrzut danych tabeli `Terminarz`
--

INSERT INTO `Terminarz` (`idTerminarz`, `data`, `godzina`, `idPersonel`, `idLaboratorium`) VALUES
(1, '2018-12-20', '10:00:00', 2, 6),
(2, '2019-01-04', '09:45:00', 2, 1),
(3, '2019-01-13', '15:03:00', 1, NULL),
(4, '2018-12-19', '12:01:00', 3, 4),
(5, '2019-01-17', '09:00:00', 2, NULL),
(6, '2018-12-20', '09:45:00', 2, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Wizyty`
--

CREATE TABLE IF NOT EXISTS `Wizyty` (
  `idWizyty` int(11) NOT NULL AUTO_INCREMENT,
  `wywiad` text,
  `rozpoznanie` text,
  `idPacjent` int(11) NOT NULL,
  `idGabinetLekarski` int(11) NOT NULL,
  `idPersonel` int(11) NOT NULL,
  PRIMARY KEY (`idWizyty`),
  KEY `fk_Wizyty_Pacjent1_idx` (`idPacjent`),
  KEY `fk_Wizyty_GabinetLekarski1_idx` (`idGabinetLekarski`),
  KEY `fk_Wizyty_Personel1_idx` (`idPersonel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 AUTO_INCREMENT=8 ;

--
-- Zrzut danych tabeli `Wizyty`
--

INSERT INTO `Wizyty` (`idWizyty`, `wywiad`, `rozpoznanie`, `idPacjent`, `idGabinetLekarski`, `idPersonel`) VALUES
(1, 'Bol w stawach, zmiana nasilenia bolu w zaleznosci od pogody, obrzk i zaczerwienienie w okolicy nadgarstkow', 'Reumatyzm', 1, 1, 1),
(2, 'Zaburzenia koncentracji, uderzenia gorąca i pocenie się, rozdraznienie, bole glowy', 'Menopauza', 2, 1, 2),
(3, 'Silny bol gardla, utrudniający przelykanie, wysoka goraczka (38st), powiekszone i bolesne wezly chlonne przy ucisku, bol glowy i ogolne rozbicie.\r\n', 'Angina', 3, 1, 3),
(4, 'Bole glowy po uprzednim urazie glowy, skurcze miesni bez utraty przytomnosci', 'Podejrzenie padaczki', 4, 1, 2),
(5, 'Przekrwienie blony sluzowej gardla, ostry bol gardla, katar, wysoka goraczka', 'Angina', 5, 1, 3),
(6, 'Wysoka goraczka, wydzielina ropna z ucha, silny bol ucha, pogorszenie sluchu', 'Bol ucha', 6, 1, 1),
(7, 'Dusznosc, bole w klatce piersiowej, kaszel z odpluwaniem wydzieliny', 'Glistnica', 7, 1, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Zalecenia`
--

CREATE TABLE IF NOT EXISTS `Zalecenia` (
  `opis_zalecenia` text,
  `idWizyty` int(11) NOT NULL,
  PRIMARY KEY (`idWizyty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `Zalecenia`
--

INSERT INTO `Zalecenia` (`opis_zalecenia`, `idWizyty`) VALUES
('Cwiczenia czynne i bierne, masaz (ugniatanie, rozcieranie, klepanie), polewanie stawow silnym strumieniem wody', 1),
('Regularne badanie cholesterolu i cisnienia, uprawianie sportu, zazywanie wapnia i witaminy D', 2),
('Odpoczynek, płukanki z cieplej wody i soli, pastylki do ssania, zwiekszenie dawki witaminy C, stosowanie cieplych okladow, przyjmowanie plynow', 3),
('Zapobieganie urazom glowy, regularne stosowanie lekow przeciwpadaczkowych, calodobowa opieka i poradnictwo medyczne', 4),
('Odpoczynek, płukanki z cieplej wody i soli, pastylki do ssania, zwiekszenie dawki witaminy C, stosowanie cieplych okladow, przyjmowanie plynow', 5),
('Pozostanie w domu, cieple oklady ', 6),
('Higiena osobista, unikanie zanieczyszczenia pomieszczen i przedmiotow codziennego uzytku, mycie owocow i warzyw, unikanie picie nieprzygotowanej wody', 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Zaswiadczenia`
--

CREATE TABLE IF NOT EXISTS `Zaswiadczenia` (
  `typ_zaswiadczenia` char(1) NOT NULL,
  `opis_zaswiadczenia` varchar(255) NOT NULL,
  `idWizyty` int(11) NOT NULL,
  PRIMARY KEY (`idWizyty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Zrzut danych tabeli `Zaswiadczenia`
--

INSERT INTO `Zaswiadczenia` (`typ_zaswiadczenia`, `opis_zaswiadczenia`, `idWizyty`) VALUES
('S', 'Skierowanie na rehabilitacje (masaze, leczenie cieplem i zimnem)', 1),
('S', 'Skierowanie na badanie hormonu przytarczycznego', 2),
('S', 'Skierowanie na badanie OB', 3),
('S', 'Skierowanie na badanie EEG, tomografię komputerową, rezonans magnetyczny', 4),
('Z', 'Zwolnienie lekarskie na 7 dni', 5),
('Z', 'Zwolnienie lekarskie na 7 dni', 6),
('S', 'Badanie kalu, zdjecie RTG jamy brzusznej', 7);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `Badania`
--
ALTER TABLE `Badania`
  ADD CONSTRAINT `fk_Badania_Laboratorium1` FOREIGN KEY (`idLaboratorium`) REFERENCES `Laboratorium` (`idLaboratorium`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Badania_SlownikBadan1` FOREIGN KEY (`idSlownikBadan`) REFERENCES `SlownikBadan` (`idSlownikBadan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `Choroby`
--
ALTER TABLE `Choroby`
  ADD CONSTRAINT `fk_Choroby_Personel1` FOREIGN KEY (`idPacjent`) REFERENCES `Pacjent` (`idPacjent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Choroby_SlownikChorob1` FOREIGN KEY (`idSlownikChorob`) REFERENCES `SlownikChorob` (`idSlownikChorob`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `KartySzczepien`
--
ALTER TABLE `KartySzczepien`
  ADD CONSTRAINT `fk_KartySzczepien_Personel1` FOREIGN KEY (`idPacjent`) REFERENCES `Pacjent` (`idPacjent`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `Recepty`
--
ALTER TABLE `Recepty`
  ADD CONSTRAINT `fk_Recepty_Wizyty1` FOREIGN KEY (`idWizyty`) REFERENCES `Wizyty` (`idWizyty`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `Terminarz`
--
ALTER TABLE `Terminarz`
  ADD CONSTRAINT `fk_Terminarz_Laboratorium1` FOREIGN KEY (`idLaboratorium`) REFERENCES `Laboratorium` (`idLaboratorium`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Terminarz_Personel1` FOREIGN KEY (`idPersonel`) REFERENCES `Personel` (`idPersonel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `Wizyty`
--
ALTER TABLE `Wizyty`
  ADD CONSTRAINT `fk_Wizyty_GabinetLekarski1` FOREIGN KEY (`idGabinetLekarski`) REFERENCES `GabinetLekarski` (`idGabinetLekarski`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Wizyty_Pacjent1` FOREIGN KEY (`idPacjent`) REFERENCES `Pacjent` (`idPacjent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Wizyty_Personel1` FOREIGN KEY (`idPersonel`) REFERENCES `Personel` (`idPersonel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `Zalecenia`
--
ALTER TABLE `Zalecenia`
  ADD CONSTRAINT `fk_Zalecenia_Wizyty1` FOREIGN KEY (`idWizyty`) REFERENCES `Wizyty` (`idWizyty`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `Zaswiadczenia`
--
ALTER TABLE `Zaswiadczenia`
  ADD CONSTRAINT `fk_Zaswiadczenia_Wizyty1` FOREIGN KEY (`idWizyty`) REFERENCES `Wizyty` (`idWizyty`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
