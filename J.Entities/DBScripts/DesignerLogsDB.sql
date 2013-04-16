CREATE TABLE `Logs` (
`ID` int(11) NOT NULL AUTO_INCREMENT,
`CreateDate` datetime NOT NULL,
`LogLevel` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`CallSite` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`Massage` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
`StackTrace` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`ID`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=10;

