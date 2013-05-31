CREATE TABLE `Logs` (
`ID` varchar(200) NOT NULL,
`CreateDate` datetime NOT NULL,
`LogLevel` varchar(5) CHARACTER SET utf8 NOT NULL,
`CallSite` varchar(4000) CHARACTER SET utf8 NULL DEFAULT NULL,
`Massage` varchar(4000) CHARACTER SET utf8 NULL DEFAULT NULL,
`StackTrace` varchar(4000) CHARACTER SET utf8 NULL DEFAULT NULL,
PRIMARY KEY (`ID`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=10;

