SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `StolariDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `StolariDB`;


DROP TABLE IF EXISTS `Admin`;
CREATE TABLE `Admin`
( 
	`IdAdmin`            integer  NOT NULL AUTO_INCREMENT,
	`Username`           varchar(40)  NOT NULL ,
	`Password`          varchar(40)  NOT NULL,
	PRIMARY KEY (`IdAdmin`)
);

INSERT INTO `Admin` (`IdAdmin`, `Username`, `Password`) VALUES
(1, 'admin', 'admin1234');

DROP TABLE IF EXISTS `Galerija`;
CREATE TABLE `Galerija`
( 
	`IdSlika`            integer  NOT NULL AUTO_INCREMENT,
	`Path`               varchar(255)  NOT NULL ,
	`TipSlike`           varchar(1)  NOT NULL ,
	`IdObj`             integer  NULL ,
	`IdVest`             integer  NULL,
    PRIMARY KEY (`IdSlika`),
    KEY `IdObj`(`IdObj`),
    KEY `IdVest`(`IdVest`)
);

INSERT INTO `Galerija` (`IdSlika`, `Path`, `TipSlike`, `IdObj`, `IdVest`) VALUES
(1, '/', 'M', 1, NULL),
(2, '/', 'O', 1, NULL),
(3, '/', 'M', 2, NULL),
(4, '/', 'O', 2, NULL),
(5, '/', 'V', NULL, 1),
(6, '/', 'V', NULL, 2);

DROP TABLE IF EXISTS `Iznajmljivanje`;
CREATE TABLE `Iznajmljivanje`
( 
	`IdIzn`              integer  NOT NULL AUTO_INCREMENT,
	`Datum`              datetime  NOT NULL ,
	`Status`             varchar(40)  NOT NULL ,
	`IdObj`              integer  NOT NULL ,
	`IdrReg`             integer  NOT NULL,
    PRIMARY KEY(`IdIzn`),
    KEY `IdObj`(`IdObj`),
    KEY `IdrReg`(`IdrReg`)
);

INSERT INTO `Iznajmljivanje`(`IdIzn`, `Datum`, `Status`, `IdObj`, `IdrReg`) VALUES
(1, '2023-03-08 14:00:00', 'ostvaren', 1, 1),
(2, '2023-03-09 14:00:00', 'neostvaren', 1, 2);

DROP TABLE IF EXISTS `Omiljeni`;
CREATE TABLE `Omiljeni`
( 
	`IdrReg`             integer  NOT NULL ,
	`IdObj`              integer  NOT NULL,
    PRIMARY KEY(`IdrReg`, `IdObj`)
);
INSERT INTO `Omiljeni`(`IdrReg`, `IdObj`) VALUES
(1, 1),
(1, 2);

DROP TABLE IF EXISTS `Rezervacija`;
CREATE TABLE `Rezervacija`
( 
	`IdRez`             integer  NOT NULL AUTO_INCREMENT,
	`Datum`              datetime  NOT NULL ,
	`Status`             varchar(40)  NOT NULL ,
	`IdSto`              integer  NOT NULL ,
	`IdrReg`             integer  NOT NULL ,
    PRIMARY KEY(`IdRez`),
    KEY `IdSto`(`IdSto`),
    KEY `IdrReg`(`IdrReg`)
);
INSERT INTO `Rezervacija`(`IdRez`, `Datum`, `Status`, `IdSto`, `IdrReg`) VALUES
(1, '2023-01-08 14:00:00', 'ostvaren', 1, 1),
(2, '2023-01-09 14:00:00', 'neostvaren', 2, 1);

DROP TABLE IF EXISTS `Sto`;
CREATE TABLE `Sto`
( 
	`IdSto`              integer  NOT NULL AUTO_INCREMENT,
	`IdObj`              integer  NOT NULL ,
	`IdTip`              integer  NOT NULL ,
    PRIMARY KEY(`IdSto`),
    KEY `IdObj`(`IdObj`),
    KEY `IdTip`(`IdTip`)
);

INSERT INTO `Sto`(`IdSto`, `IdObj`, `IdTip`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 2),
(4, 1, 2),
(5, 1, 1),
(6, 1, 3),
(7, 1, 2),
(8, 1, 3),
(9, 1, 3),
(10, 2, 1),
(11, 2, 1),
(12, 2, 2),
(13, 2, 2),
(14, 2, 1),
(15, 2, 3),
(16, 2, 2),
(17, 2, 3),
(18, 2, 3),
(19, 3, 1),
(20, 3, 1),
(21, 3, 2),
(22, 3, 2),
(23, 3, 1),
(24, 3, 3),
(25, 3, 2),
(26, 3, 3),
(27, 3, 3),
(28, 4, 4),
(29, 4, 4),
(30, 4, 5),
(31, 4, 6),
(32, 4, 5),
(33, 4, 4),
(34, 4, 5),
(35, 4, 6),
(36, 4, 4),
(37, 4, 5),
(38, 4, 5),
(39, 4, 6),
(40, 4, 4),
(41, 4, 4),
(42, 4, 4),
(43, 4, 4),
(44, 4, 4),
(45, 4, 5),
(46, 4, 6),
(47, 4, 6),
(48, 5, 7),
(49, 5, 8),
(50, 5, 9),
(51, 5, 7),
(52, 5, 8),
(53, 5, 9);


DROP TABLE IF EXISTS `Objekat`;
CREATE TABLE `Objekat`
( 
	`IdObj`              integer  NOT NULL AUTO_INCREMENT,
	`Naziv`              varchar(40)  NOT NULL ,
	`Adresa`             varchar(40)  NOT NULL ,
	`Grad`               varchar(40)  NOT NULL ,
	`TipObj`			 varchar(40)  NOT NULL ,
	`TipKuhinje`         varchar(40)  NOT NULL ,
	`UkOcena`            integer  NOT NULL ,
	`BrOcena`            integer  NOT NULL ,
    `Opis`			     varchar(1000) NOT NULL,
	`IdMen`              integer  NOT NULL ,
    PRIMARY KEY(`IdObj`),
    KEY `IdMen`(`IdMen`)
);

INSERT INTO `Objekat`(`IdObj`, `Naziv`, `Adresa`, `Grad`, `TipObj`, `TipKuhinje`, `UkOcena`, `BrOcena`, `Opis`, `IdMen`) VALUES
(1, 'Insolita', 'Zorza Klemensoa 27v', 'Beograd', 'restoran', 'italian', 0, 0, 'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 1),
(2, 'City Garden', 'Knez Mihailova 54', 'Beograd', 'restoran', 'serbian', 0, 0, 'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.' , 2),
(3, 'Bahumas Inn', 'Bulevar Nikole Tesle bb', 'Beograd', 'restoran', 'serbian', 0, 0, 'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 1),
(4, 'Inbox', 'Karadjordjeva 9', 'Beograd', 'klub', '/', 0, 0, 'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.' , 3),
(5, 'Witch bar', 'Pariska 13', 'Beograd', 'pab', '/', 0, 0, 'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 3);

DROP TABLE IF EXISTS `Menadzer`;
CREATE TABLE `Menadzer`
( 
	`IdMen`              integer  NOT NULL AUTO_INCREMENT,
	`Username`           varchar(40)  NOT NULL ,
	`Password`           varchar(40)  NOT NULL ,
	`Ime`                varchar(40)  NOT NULL ,
	`Prezime`            varchar(40)  NOT NULL ,
	`Pol`                varchar(40)  NOT NULL ,
	`Broj`               varchar(40)  NOT NULL ,
    PRIMARY KEY(`IdMen`)
);

INSERT INTO `Menadzer`(`IdMen`, `Username`, `Password`, `Ime`, `Prezime`, `Pol`, `Broj`) VALUES
(1, 'menadzer1', 'menadzer1234', 'Marko', 'Markovic', 'muski', '0649999999'),
(2, 'menadzer2', 'menadzer2345', 'Ivana', 'Ivanovic', 'zenski', '0648888888'),
(3, 'menadzer3', 'menadzer3456', 'Dragana', 'Mirkovic', 'zenski', '0641111111');

DROP TABLE IF EXISTS `Registrovani`;
CREATE TABLE `Registrovani`
( 
	`IdrReg`             integer  NOT NULL AUTO_INCREMENT,
	`Username`           varchar(40)  NOT NULL ,
	`Password`           varchar(40)  NOT NULL ,
	`Ime`                varchar(40)  NOT NULL ,
	`Prezime`            varchar(40)  NOT NULL ,
	`BrTelefona`         varchar(40)  NOT NULL ,
	`Pol`                varchar(40)  NOT NULL ,
	`PozPoeni`           integer  NOT NULL ,
	`NegPoeni`           integer  NOT NULL ,
	`DatumRodjenja`      datetime  NOT NULL ,
    PRIMARY KEY(`IdrReg`)
);

INSERT INTO `Registrovani`(`IdrReg`, `Username`, `Password`, `Ime`, `Prezime`, `BrTelefona`, `Pol`, `PozPoeni`, `NegPoeni`, `DatumRodjenja`) VALUES
(1, 'korisnik1', '1234', 'Pera', 'Peric', '0647777777', 'muski', 2, 1, '2000-01-09 14:00:00'),
(2, 'korisnik2', '1234', 'Djuka', 'Djukic', '0646666666', 'muski', 0, 1, '1998-01-09 15:10:00');




DROP TABLE IF EXISTS `Tip`;
CREATE TABLE `Tip`
( 
	`IdTip`              integer  NOT NULL AUTO_INCREMENT,
	`Naziv`              varchar(40)  NOT NULL ,
	`Opis`               varchar(40)  NOT NULL ,
    PRIMARY KEY(`IdTip`)
);

INSERT INTO `Tip`(`IdTip`, `Naziv`, `Opis`) VALUES
(1, 'restoranBarski', 'Barski sto u restoranu'),
(2, 'restoranSedenje', 'Sto za sedenje u restoranu'),
(3, 'restoranSank', 'Sank u restoranu'),
(4, 'klubBarski', 'Barski sto u klubu'),
(5, 'klubSank', 'Sank u klubu'),
(6, 'klubSepare', 'Sto u separeu u klubu'),
(7, 'pabBarski', 'Barski sto u pabu'),
(8, 'pabSedenje', 'Sto za sedenje u pabu'),
(9, 'pabSank', 'Sank u pabu');

DROP TABLE IF EXISTS `Vest`;
CREATE TABLE `Vest`
( 
	`IdVest`             integer  NOT NULL AUTO_INCREMENT,
	`Naslov`             varchar(40)  NOT NULL ,
	`Tekst`              varchar(255)  NOT NULL ,
    PRIMARY KEY(`IdVest`)
);

INSERT INTO `Vest`(`IdVest`, `Naslov`, `Tekst`) VALUES
(1, 'Uparivanje hrane i vina u Insoliti!', 'U saradnji sa vinarijom ERDEVIK, restoran Insolita Vam predstavlja prvo uparivanje hrane i vina. Rezervacije su obavezne.'),
(2, 'Novo na nasoj aplikaciji!', 'Od sada postoji mogucnost zakupljivanja celog lokala preko nase aplikacije!');




ALTER TABLE `Admin`
	ADD CONSTRAINT `XPKAdmin` PRIMARY KEY  CLUSTERED (`IdAdmin` ASC);


ALTER TABLE `Admin`
	ADD CONSTRAINT `XAK1Admin` UNIQUE (`Username`  ASC);


ALTER TABLE `Galerija`
	ADD CONSTRAINT `XPKGalerija` PRIMARY KEY  CLUSTERED (`IdSlika` ASC);


ALTER TABLE `Iznajmljivanje`
	ADD CONSTRAINT `XPKIznajmljivanje` PRIMARY KEY  CLUSTERED (`IdIzn` ASC);


ALTER TABLE `Menadzer`
	ADD CONSTRAINT `XPKMenadzer` PRIMARY KEY  CLUSTERED (`IdMen` ASC);


ALTER TABLE `Menadzer`
	ADD CONSTRAINT `XAK1Menadzer` UNIQUE (`Username`  ASC);

ALTER TABLE `Objekat`
	ADD CONSTRAINT `XPKObjekat` PRIMARY KEY  CLUSTERED (`IdObj` ASC);


ALTER TABLE `Omiljeni`
	ADD CONSTRAINT `XPKOmiljeni` PRIMARY KEY  CLUSTERED (`IdrReg` ASC,`IdObj` ASC);


ALTER TABLE `Registrovani`
	ADD CONSTRAINT `XPKRegistrovani` PRIMARY KEY  CLUSTERED (`IdrReg` ASC);


ALTER TABLE `Registrovani`
	ADD CONSTRAINT `XAK1Registrovani` UNIQUE (`Username`  ASC);


ALTER TABLE `Rezervacija`
	ADD CONSTRAINT `XPKRezervacija` PRIMARY KEY  CLUSTERED (`IdRez` ASC);


ALTER TABLE `Sto`
	ADD CONSTRAINT `XPKSto` PRIMARY KEY  CLUSTERED (`IdSto` ASC);


ALTER TABLE `Tip`
	ADD CONSTRAINT `XPKTip` PRIMARY KEY  CLUSTERED (`IdTip` ASC);


ALTER TABLE `Vest`
	ADD CONSTRAINT `XPKVest` PRIMARY KEY  CLUSTERED (`IdVest` ASC);


ALTER TABLE `Galerija`
	ADD CONSTRAINT `R_4` FOREIGN KEY (`IdObj`) REFERENCES `Objekat`(`IdObj`)
		ON UPDATE CASCADE;

ALTER TABLE `Galerija`
	ADD CONSTRAINT `R_5` FOREIGN KEY (`IdVest`) REFERENCES `Vest`(`IdVest`)
		ON UPDATE CASCADE;



ALTER TABLE `Iznajmljivanje`
	ADD CONSTRAINT `R_10` FOREIGN KEY (`IdObj`) REFERENCES `Objekat`(`IdObj`)
		ON UPDATE CASCADE;


ALTER TABLE `Iznajmljivanje`
	ADD CONSTRAINT `R_11` FOREIGN KEY (`IdrReg`) REFERENCES `Registrovani`(`IdrReg`)
		ON UPDATE CASCADE;



ALTER TABLE `Objekat`
	ADD CONSTRAINT `R_1` FOREIGN KEY (`IdMen`) REFERENCES `Menadzer`(`IdMen`)
		ON UPDATE CASCADE;



ALTER TABLE `Omiljeni`
	ADD CONSTRAINT `R_8` FOREIGN KEY (`IdrReg`) REFERENCES `Registrovani`(`IdrReg`)
		ON UPDATE CASCADE;


ALTER TABLE `Omiljeni`
	ADD CONSTRAINT `R_9` FOREIGN KEY (`IdObj`) REFERENCES `Objekat`(`IdObj`)
		ON UPDATE CASCADE;



ALTER TABLE `Rezervacija`
	ADD CONSTRAINT `R_6` FOREIGN KEY (`IdSto`) REFERENCES `Sto`(`IdSto`)
		ON UPDATE CASCADE;


ALTER TABLE `Rezervacija`
	ADD CONSTRAINT `R_7` FOREIGN KEY (`IdrReg`) REFERENCES `Registrovani`(`IdrReg`)
		ON UPDATE CASCADE;



ALTER TABLE `Sto`
	ADD CONSTRAINT `R_2` FOREIGN KEY (`IdObj`) REFERENCES `Objekat`(`IdObj`)
		ON UPDATE CASCADE;


ALTER TABLE `Sto`
	ADD CONSTRAINT `R_3` FOREIGN KEY (`IdTip`) REFERENCES `Tip`(`IdTip`)
		ON UPDATE CASCADE;