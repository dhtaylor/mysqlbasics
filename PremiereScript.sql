/* Create Log file */
TEE Taylor_Dandy_Ch3Premiere.txt

/* 4. Create Database */
CREATE DATABASE premiere;

/* 5. Create Table Structure */
USE premiere;

CREATE TABLE rep (
	  rep_num CHAR(2) PRIMARY KEY
	, last_name CHAR(15)
	, first_name CHAR(15)
	, street CHAR(15)
	, city CHAR(15)
	, state CHAR(2)
	, zip CHAR(5)
	, commission DECIMAL(7,2)
	, rate DECIMAL(3,2)
);

/* 6. Create Remaining Table Structures */
CREATE TABLE customer (
	  customer_num CHAR(3) PRIMARY KEY
	, customer_name CHAR(35) NOT NULL
	, street CHAR(15)
	, city CHAR(15)
	, state CHAR(2)
	, zip CHAR(5)
	, balance DECIMAL(8,2)
	, credit_limit DECIMAL(8,2)
	, rep_num CHAR(2)
);

CREATE TABLE orders (
	  order_num CHAR(5) PRIMARY KEY
	, order_date DATE
	, customer_num CHAR(3)
);

CREATE TABLE part (
	  part_num CHAR(4) PRIMARY KEY
	, description CHAR(15)
	, on_hand DECIMAL(4,0)
	, class CHAR(2)
	, warehouse CHAR(1)
	, price DECIMAL(6,2)
);

CREATE TABLE order_line (
	  order_num CHAR(5)
	, part_num CHAR(4)
	, num_ordered DECIMAL(3,0)
	, quoted_price DECIMAL(6,2)
	, PRIMARY KEY (order_num, part_num)
);

/* 7. Verify Table Structure Accuracy */
SHOW COLUMNS FROM rep;

SHOW COLUMNS FROM customer;

SHOW COLUMNS FROM orders;

SHOW COLUMNS FROM part;

SHOW COLUMNS FROM order_line;

/* 8. Populating Tables with Data */
INSERT INTO rep
	(rep_num, last_name, first_name, street, city, state, zip, commission, rate)
VALUES
	  ('20','Kaiser','Valerie','624 Randall','Grove','FL','33321',20542.50,0.05)
	, ('35','Hull','Richard','532 Jackson','Sheldon','FL','33553',39216.00,0.07)
	, ('65','Perez','Juan','1626 Taylor','Fillmore','FL','33336',23487.00,0.05);

INSERT INTO customer
	(customer_num, customer_name, street, city, state, zip, balance, credit_limit, rep_num)
VALUES
	  ('148','Al''s Appliance and Sport','2837 Greenway','Fillmore','FL','33336',6550.00,7500.00,'20')
	, ('282','Brookings Direct','3827 Devon','Grove','FL','33321',431.50,10000.00,'35')
	, ('356','Ferguson''s','382 Wildwood','Northfield','FL','33146',5785.00,7500.00,'65')
	, ('408','The Everything Shop','1828 Raven','Crystal','FL','33503',5285.25,5000.00,'35')
	, ('462','Bargains Galore','3829 Central','Grove','FL','33321',3412.00,10000.00,'65')
	, ('524','Kline''s','838 Ridgeland','Fillmore','FL','33336',12762.00,15000.00,'20')
	, ('608','Johnson''s Department Store','372 )Oxford','Sheldon','FL','33553',2106.00,10000.00,'65')
	, ('687','Lee''s Sport and Appliance','282 Evergreen','Altonville','FL','32543',2851.00,5000.00,'35')
	, ('725','Deerfield''s Four Seasons','282 Columbia','Sheldon','FL','33553',248.00,7500.00,'35')
	, ('842','All Season','28 Lakeview','Grove','FL','33321',8221.00,7500.00,'20');

INSERT INTO orders
	(order_num, order_date, customer_num)
VALUES
	  ('21608','2007-10-20','148')
	, ('21610','2007-10-20','356')
	, ('21613','2007-10-21','408')
	, ('21614','2007-10-21','282')
	, ('21617','2007-10-23','608')
	, ('21619','2007-10-23','148')
	, ('21623','2007-10-23','608');

INSERT INTO part
	(part_num, description, on_hand, class, warehouse, price)
VALUES
	  ('AT94','Iron',50,'HW','3',24.95)
	, ('BV06','Home Gym',45,'SG','2',794.95)
	, ('CD52','Microwave Oven',32,'AP','1',165.00)
	, ('DL71','Cordless Drill',21,'HW','3',129.95)
	, ('DR93','Gas Range',8,'AP','2',495.00)
	, ('DW11','Washer',12,'AP','3',399.99)
	, ('FD21','Stand Mixer',22,'HW','3',159.95)
	, ('KL62','Dryer',12,'AP','1',349.95)
	, ('KT03','Dishwasher',8,'AP','3',595.00)
	, ('KV29','Treadmill',9,'SG','2',1390.00);

INSERT INTO order_line
	(order_num, part_num, num_ordered, quoted_price)
VALUES
	  ('21608','AT94',11,21.95)
	, ('21610','DR93',1,495.00)
	, ('21610','DW11',1,399.99)
	, ('21613','KL62',4,329.95)
	, ('21614','KT03',2,595.00)
	, ('21617','BV06',2,794.95)
	, ('21617','CD52',4,150.00)
	, ('21619','DR93',1,495.00)
	, ('21623','KV29',2,1290.00);

/* 9. Verify Data Accuracy */
SELECT *
FROM rep;

SELECT *
FROM customer;

SELECT *
FROM orders;

SELECT *
FROM part;

SELECT *
FROM order_line;
