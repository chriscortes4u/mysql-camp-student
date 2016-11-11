CREATE DATABASE `ReliefTracker` /*!40100 DEFAULT CHARACTER SET latin1 */;


/*  PERSON TABLE  */

CREATE TABLE `Person` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lastName` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT 'Null',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*  RELIEF TABLE  */

CREATE TABLE `Relief` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `organization` varchar(45) NOT NULL,
  `description` varchar(500) NOT NULL,
  `location` varchar(45) NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `phase` enum('planning','active','completed') DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;


/*   RELIEFTEAM  */

CREATE TABLE `ReliefTeam` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personID` int(11) unsigned NOT NULL,
  `reliefID` int(11) unsigned NOT NULL,
  `role` enum('Team Leader','Team Member') COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UI_reliefTeam_personID_reliefID` (`personID`,`reliefID`),
  KEY `FK_reliefTeam_person_idx` (`personID`),
  KEY `FK_reliefTeam_relief_idx` (`reliefID`),
  CONSTRAINT `FK_reliefTeam_person` FOREIGN KEY (`personID`) REFERENCES `Person` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_reliefTeam_relief` FOREIGN KEY (`reliefID`) REFERENCES `Relief` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
