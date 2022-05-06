Creation BDD:
CREATE TABLE `clients` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`companyName` varchar(20) NOT NULL,
`firstName` varchar(20) NOT NULL,
`lastName` varchar(20) NOT NULL,
`email` varchar(20) NOT NULL,
`phone` varchar(15) NOT NULL,
`adress` varchar(30) NOT NULL,
`zipCode` varchar(30) NOT NULL,
`city` varchar(30) NOT NULL,
`country` varchar(30) NOT NULL,
`state` enum('0','1') DEFAULT NULL,
PRIMARY KEY (`id`));

CREATE TABLE `orders` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`typePresta` varchar(15) NOT NULL,
`designation` varchar(30) NOT NULL,
`clientid` int(11) NOT NULL,
`nbDays` int(11) NOT NULL,
`unitPrice` int(11) NOT NULL,
`totalExcludeTaxe` int(11) GENERATED ALWAYS AS ((`nbDays` * `unitPrice`)) STORED,
`totalWithTaxe` int(11) GENERATED ALWAYS AS ((`totalExcludeTaxe` * 1.2)) STORED,
`state` enum('0','1','2') DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `fk_orders_clientid` (`clientid`),
CONSTRAINT `fk_orders_clientid` FOREIGN KEY (`clientid`) REFERENCES `clients` (`id`)
);



SELECT designation, typePresta FROM orders JOIN clients ON clients.id = orders.clientid WHERE typePresta = "formation" AND clients.id = 2;

CREATE VIEW v_contact AS
SELECT CONCAT (firstName," ", lastName) AS identity, email, phone
FROM clients
JOIN orders ON clients.id = orders.clientid
WHERE typePresta = "coaching";

CREATE VIEW v_contactCoaching AS
SELECT DISTINCT CONCAT (firstName," ", lastName) AS identity, email, phone
FROM clients
JOIN orders ON clients.id = orders.clientid
WHERE typePresta = "coaching";

CREATE VIEW v_contactCoachingReact AS
SELECT DISTINCT CONCAT (firstName," ", lastName) AS identity, email, phone
FROM clients
JOIN orders ON clients.id = orders.clientid
WHERE typePresta = "coaching" AND designation LIKE "React%";

CREATE VIEW v_totals AS SELECT designation, CONCAT((nbDays * unitPrice)," €") AS totalExcludeTaxe, CONCAT(ROUND(totalExcludeTaxe * 1.2), " €") AS totalWithTaxe FROM orders WHERE orders.typepresta = "formation" ;

CREATE VIEW v_expensivePresta AS
SELECT designation FROM orders WHERE state = "2" AND totalExcludeTaxe > 30000;