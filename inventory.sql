CREATE TABLE `brand`(`id` int NOT NULL AUTO_INCREMENT, `brand` varchar(50) NOT NULL, `supplier` varchar(50) NULL, `helpid` int NULL, PRIMARY KEY (`id`))CHARACTER SET utf8;
CREATE TABLE `category`(`categoryid` int NOT NULL AUTO_INCREMENT, `category` varchar(30) NOT NULL, `userid` int NULL, `margin` decimal(10,3) NULL, `marginpercent` decimal(10,3) NULL, `helpid` tinyint NULL, PRIMARY KEY (`categoryid`))CHARACTER SET utf8;
CREATE TABLE `group`(`groupid` int NOT NULL AUTO_INCREMENT, `group` varchar(30) NULL, `userid` int NULL, `margin` decimal(10,3) NULL, `marginpercent` decimal(10,3) NULL, `helpid` tinyint NULL, PRIMARY KEY (`groupid`))CHARACTER SET utf8;
CREATE TABLE `help`(`helpid` int NOT NULL AUTO_INCREMENT, `question` varchar(50) NOT NULL, `answer` varchar(1000) NULL, PRIMARY KEY (`helpid`))CHARACTER SET utf8;
CREATE TABLE `invcustomers`(`id` int NOT NULL AUTO_INCREMENT, `name` varchar(500) NULL, `address` varchar(500) NULL, `email` varchar(50) NULL, `helpid` tinyint NULL, PRIMARY KEY (`id`))CHARACTER SET utf8;
CREATE TABLE `inventory_settings`(`ID` int NOT NULL AUTO_INCREMENT, `TYPE` int NULL DEFAULT 1, `NAME` mediumtext NULL, `USERNAME` mediumtext NULL, `COOKIE` varchar(500) NULL, `SEARCH` mediumtext NULL, `TABLENAME` varchar(300) NULL, PRIMARY KEY (`ID`))CHARACTER SET utf8;
CREATE TABLE `invitems`(`id` int NOT NULL AUTO_INCREMENT, `title` varchar(30) NOT NULL, `price` decimal(10,3) NULL, `barcode` varchar(20) NULL, `codeA` varchar(20) NULL, `codeB` varchar(20) NULL, `description` varchar(100) NULL, `pricecost` decimal(10,3) NULL, `margin_percent` decimal(10,3) NULL, `margin` decimal(10,3) NULL, `userid` int NULL, `stock` decimal(10,3) NULL, `temporary_stock` decimal(10,3) NULL, `lost` decimal(10,3) NULL, `lastdatecount` datetime NULL, `precounted` decimal(10,3) NULL, `measurement_unit` varchar(20) NULL, `min_unit` decimal(10,3) NULL, `last_transaction_id` int NULL, `last_sell` decimal(10,3) NULL, `last_buy` decimal(10,3) NULL, `brand` int NULL, `category` int NULL, `subcategory` int NULL, `group` int NULL, `help` decimal(10,3) NULL, `helpid` tinyint NULL, `info` varchar(100) NULL, PRIMARY KEY (`id`))CHARACTER SET utf8;
CREATE TABLE `invoicedetails`(`id` int NOT NULL AUTO_INCREMENT, `id_invoice` int NULL, `item` varchar(500) NULL, `price` decimal(16,2) NULL, `quantity` decimal(16,0) NULL, `total` double NULL, `pos` int NULL, PRIMARY KEY (`id`))CHARACTER SET utf8;
CREATE TABLE `invoices`(`id` int NOT NULL AUTO_INCREMENT, `date` date NULL, `invoice_number` int NULL, `buyer_info` varchar(500) NULL, `hash` varchar(500) NULL, `subtotal` double NULL, `tax` decimal(16,2) NULL, `total` double NULL, `seller_info` varchar(500) NULL, `terms` varchar(500) NULL, `company_name` varchar(500) NULL, `invoice_name` varchar(250) NULL, `buyer_address` mediumtext NULL, PRIMARY KEY (`id`))CHARACTER SET utf8;
CREATE TABLE `invusers`(`id` int NOT NULL AUTO_INCREMENT, `email` varchar(30) NOT NULL, `password` varchar(60) NOT NULL, `active` int NULL, `reset_token` varchar(50) NULL, `reset_date` datetime NULL, `helpid` tinyint NULL, `groupid` int NULL, PRIMARY KEY (`id`))CHARACTER SET utf8;
CREATE TABLE `margin`(`margin` decimal(10,3) NOT NULL, `marginpercent` decimal(10,3) NOT NULL, `userid` int NULL, `helpid` tinyint NULL, PRIMARY KEY (`margin`,`marginpercent`))CHARACTER SET utf8;
CREATE TABLE `subcategory`(`subcategoryid` int NOT NULL AUTO_INCREMENT, `categoryid` int NULL, `subcategory` varchar(30) NULL, `userid` int NULL, `margin` decimal(10,3) NULL, `marginpercent` decimal(10,3) NULL, `helpid` tinyint NULL, PRIMARY KEY (`subcategoryid`))CHARACTER SET utf8;
CREATE TABLE `transaction`(`id` int NOT NULL AUTO_INCREMENT, `barcode` varchar(20) NULL, `title` varchar(30) NULL, `iditem` int NOT NULL, `buy` decimal(10,3) NULL, `sell` decimal(10,3) NULL, `lost` decimal(10,3) NULL, `date` datetime NULL, `bought_price` decimal(10,3) NULL, `sell_price` decimal(10,3) NULL, `total_gain` decimal(10,3) NULL, `temporary_stock` decimal(10,3) NULL, `current_stock` decimal(10,3) NULL, `type` int NULL, `userid` int NULL, `helpid` tinyint NULL, PRIMARY KEY (`id`))CHARACTER SET utf8;
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO `brand` (`id`,`brand`,`supplier`,`helpid`) VALUES (1,'DELL COMPUTERS','AMAZON',6);
SET FOREIGN_KEY_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO `help` (`helpid`,`question`,`answer`) VALUES (1,'Category table for items','<br><span style="color: rgb(34, 34, 34); font-family: arial, sans-serif;">categorization</span>&nbsp;for items.<div>You can set margins that automaticly inherit to item record when add an item or you can just ignore it.&nbsp;<br></div><div><br></div><div><div>categoryid int(11) PRIMARY/AUTO_INCREMENT</div><div>category varchar(30)&nbsp;</div><div>margin<span class="Apple-tab-span" style="white-space:pre">\t</span>decimal(10,3)<span class="Apple-tab-span" style="white-space:pre">\t</span>optional</div><div>marginpercent<span class="Apple-tab-span" style="white-space: pre;">\t</span>decimal(10,3)<span class="Apple-tab-span" style="white-space: pre;">\t</span>optional</div></div>');
INSERT INTO `help` (`helpid`,`question`,`answer`) VALUES (2,'Subcategory table for items','Subcategorization for items that dependet on category table.<div>You can set margins that automaticly inherit to item record when add an item or you can just ignore it.</div><div><br></div><div>categoryid &nbsp; (Primary)\tint(11)</div><div>categoryid\tint(11)</div><div>subcategory\tvarchar(30)</div><div>margin\tdecimal(10,3)</div><div>marginpercent\tdecimal(10,3)</div>');
INSERT INTO `help` (`helpid`,`question`,`answer`) VALUES (3,'Group table for items','<br><div>alternative grouping of items intependent from category&nbsp;</div><div>You can set margins that automaticly inherit to item record when add an item or you can just ignore it.&nbsp;<br></div><div><br></div><div><div>groupid int(11) PRIMARY/AUTO_INCREMENT</div><div>group varchar(30)&nbsp;</div><div>margin<span class="Apple-tab-span" style="white-space: pre;">\t</span>decimal(10,3)<span class="Apple-tab-span" style="white-space: pre;">\t</span>optional</div><div>marginpercent<span class="Apple-tab-span" style="white-space: pre;">\t</span>decimal(10,3)<span class="Apple-tab-span" style="white-space: pre;">\t</span>optional</div></div>');
INSERT INTO `help` (`helpid`,`question`,`answer`) VALUES (4,'Margin table for items','This helps to set margins from bought price and auto calculate sell price.<div>Example</div><div>Item A</div><div>bought price 100$</div><div>margin percent 50%</div><div>margin 1$</div><div><br></div><div>sell price will be set 100$ + 50% + 1$ =151$</div><div><br></div>');
INSERT INTO `help` (`helpid`,`question`,`answer`) VALUES (5,'Users table','username is email field<div>password should have minimum lenght :6 or more</div><div>and should contain</div><div>unique characters :4 or more</div><div>digits/symbols : 1 or more</div><div><br></div><div>password has been encrypted with BCRYPT algorithm.</div><div>Every user can view/edit/add only his records.</div><div><br></div>');
INSERT INTO `help` (`helpid`,`question`,`answer`) VALUES (6,'Brand table for items','<div>From items table when choose Brand name via lookup you get supplier automaticly if you have set it.</div>');
SET FOREIGN_KEY_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO `invcustomers` (`id`,`name`,`address`,`email`,`helpid`) VALUES (1,'Verda A. Fulks','4630 Custer StreetBoalsburg,\n PA 168274630 ','Verda@example.com',NULL);
INSERT INTO `invcustomers` (`id`,`name`,`address`,`email`,`helpid`) VALUES (2,'Joseph E. Wyllie','467 Ferrell Street,\nWadena, MN 56482','Joseph@teleworm.us',NULL);
SET FOREIGN_KEY_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO `invitems` (`id`,`title`,`price`,`barcode`,`codeA`,`codeB`,`description`,`pricecost`,`margin_percent`,`margin`,`userid`,`stock`,`temporary_stock`,`lost`,`lastdatecount`,`precounted`,`measurement_unit`,`min_unit`,`last_transaction_id`,`last_sell`,`last_buy`,`brand`,`category`,`subcategory`,`group`,`help`,`helpid`,`info`) VALUES (0,'pepper',4.550,'5202336025893',NULL,NULL,'',3.000,35.000,0.500,4,2.000,NULL,NULL,NULL,NULL,NULL,1.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `invitems` (`id`,`title`,`price`,`barcode`,`codeA`,`codeB`,`description`,`pricecost`,`margin_percent`,`margin`,`userid`,`stock`,`temporary_stock`,`lost`,`lastdatecount`,`precounted`,`measurement_unit`,`min_unit`,`last_transaction_id`,`last_sell`,`last_buy`,`brand`,`category`,`subcategory`,`group`,`help`,`helpid`,`info`) VALUES (1,'Title1',5.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `invitems` (`id`,`title`,`price`,`barcode`,`codeA`,`codeB`,`description`,`pricecost`,`margin_percent`,`margin`,`userid`,`stock`,`temporary_stock`,`lost`,`lastdatecount`,`precounted`,`measurement_unit`,`min_unit`,`last_transaction_id`,`last_sell`,`last_buy`,`brand`,`category`,`subcategory`,`group`,`help`,`helpid`,`info`) VALUES (2,'Title2',5.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `invitems` (`id`,`title`,`price`,`barcode`,`codeA`,`codeB`,`description`,`pricecost`,`margin_percent`,`margin`,`userid`,`stock`,`temporary_stock`,`lost`,`lastdatecount`,`precounted`,`measurement_unit`,`min_unit`,`last_transaction_id`,`last_sell`,`last_buy`,`brand`,`category`,`subcategory`,`group`,`help`,`helpid`,`info`) VALUES (3,'Title3',6.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `invitems` (`id`,`title`,`price`,`barcode`,`codeA`,`codeB`,`description`,`pricecost`,`margin_percent`,`margin`,`userid`,`stock`,`temporary_stock`,`lost`,`lastdatecount`,`precounted`,`measurement_unit`,`min_unit`,`last_transaction_id`,`last_sell`,`last_buy`,`brand`,`category`,`subcategory`,`group`,`help`,`helpid`,`info`) VALUES (4,'Title4',7.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `invitems` (`id`,`title`,`price`,`barcode`,`codeA`,`codeB`,`description`,`pricecost`,`margin_percent`,`margin`,`userid`,`stock`,`temporary_stock`,`lost`,`lastdatecount`,`precounted`,`measurement_unit`,`min_unit`,`last_transaction_id`,`last_sell`,`last_buy`,`brand`,`category`,`subcategory`,`group`,`help`,`helpid`,`info`) VALUES (5,'coffee',14.000,'5201219046154',NULL,NULL,'',10.000,35.000,0.500,4,5.000,NULL,NULL,NULL,NULL,NULL,1.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
SET FOREIGN_KEY_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO `invusers` (`id`,`email`,`password`,`active`,`reset_token`,`reset_date`,`helpid`,`groupid`) VALUES (1,'admin','admin',1,NULL,NULL,NULL,NULL);
INSERT INTO `invusers` (`id`,`email`,`password`,`active`,`reset_token`,`reset_date`,`helpid`,`groupid`) VALUES (2,'1@1.com','1',1,NULL,NULL,NULL,NULL);
INSERT INTO `invusers` (`id`,`email`,`password`,`active`,`reset_token`,`reset_date`,`helpid`,`groupid`) VALUES (4,'jgeorgiou@valid.gr','1q2w3e4r5t',1,NULL,NULL,NULL,NULL);
SET FOREIGN_KEY_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO `margin` (`margin`,`marginpercent`,`userid`,`helpid`) VALUES (0.500,35.000,4,NULL);
INSERT INTO `margin` (`margin`,`marginpercent`,`userid`,`helpid`) VALUES (0.800,45.000,4,NULL);
SET FOREIGN_KEY_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO `transaction` (`id`,`barcode`,`title`,`iditem`,`buy`,`sell`,`lost`,`date`,`bought_price`,`sell_price`,`total_gain`,`temporary_stock`,`current_stock`,`type`,`userid`,`helpid`) VALUES (1,'5202336025893','pepper',6,NULL,1.000,NULL,'2017-05-13 00:00:00',3.000,4.550,1.550,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `transaction` (`id`,`barcode`,`title`,`iditem`,`buy`,`sell`,`lost`,`date`,`bought_price`,`sell_price`,`total_gain`,`temporary_stock`,`current_stock`,`type`,`userid`,`helpid`) VALUES (2,'5202336025893','pepper',6,NULL,1.000,NULL,'2017-05-13 00:00:00',3.000,4.550,1.550,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `transaction` (`id`,`barcode`,`title`,`iditem`,`buy`,`sell`,`lost`,`date`,`bought_price`,`sell_price`,`total_gain`,`temporary_stock`,`current_stock`,`type`,`userid`,`helpid`) VALUES (4,'5202336025893','pepper',6,NULL,1.000,NULL,'2017-05-14 00:00:00',3.000,4.550,1.550,2.000,3.000,NULL,NULL,NULL);
INSERT INTO `transaction` (`id`,`barcode`,`title`,`iditem`,`buy`,`sell`,`lost`,`date`,`bought_price`,`sell_price`,`total_gain`,`temporary_stock`,`current_stock`,`type`,`userid`,`helpid`) VALUES (5,'5201219046154','coffee',5,NULL,1.000,NULL,'2017-05-15 00:00:00',10.000,14.000,4.000,0.000,1.000,NULL,NULL,NULL);
INSERT INTO `transaction` (`id`,`barcode`,`title`,`iditem`,`buy`,`sell`,`lost`,`date`,`bought_price`,`sell_price`,`total_gain`,`temporary_stock`,`current_stock`,`type`,`userid`,`helpid`) VALUES (6,'5202336025893','pepper',6,1.000,NULL,NULL,'2017-05-15 00:00:00',3.000,NULL,NULL,2.000,2.000,NULL,NULL,NULL);
SET FOREIGN_KEY_CHECKS = 1;
