TEE taylor_dandy_Ch3Henry.txt

/* CREATE DATABASE */
CREATE DATABASE henry;

/* SWITCH TO NEW DATABASE CONTEXT */
USE henry;

/* CREATE TABLE STRUCTURES */
CREATE TABLE branch (
	  branch_num INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY
	, branch_name VARCHAR(25)
	, branch_location VARCHAR(50)
	, num_employees INTEGER
);

CREATE TABLE publisher (
	  publisher_code CHAR(2) NOT NULL PRIMARY KEY
	, publisher_name VARCHAR(25)
	, city VARCHAR(25)
);

CREATE TABLE author (
	  author_num INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY
	, author_last VARCHAR(25)
	, author_first VARCHAR(25)
);

CREATE TABLE book (
	  book_code CHAR(4) NOT NULL PRIMARY KEY
	, title VARCHAR(100)
	, publisher_code CHAR(2)
	, type CHAR(3)
	, price DECIMAL(8,2)
	, paperback CHAR(3)
);

CREATE TABLE wrote (
	  book_code CHAR(4) NOT NULL
	, author_num INTEGER NOT NULL
	, sequence INTEGER
	, PRIMARY KEY (book_code, author_num)
);

CREATE TABLE inventory (
	  book_code CHAR(4) NOT NULL
	, branch_num INTEGER NOT NULL
	, on_hand INTEGER
	, PRIMARY KEY (book_code, branch_num)
);

/* VERIFY TABLE STRUCTURES */
SHOW COLUMNS FROM branch;

SHOW COLUMNS FROM publisher;

SHOW COLUMNS FROM author;

SHOW COLUMNS FROM book;

SHOW COLUMNS FROM wrote;

SHOW COLUMNS FROM inventory;

/* POPULATE TABLE DATA */
INSERT INTO branch
	( branch_name, branch_location, num_employees )
VALUES
	  ('Henry Downtown', '16 Riverview',10)
	, ('Henry On The Hill', '1289 Bedford',6)
	, ('Henry Brentwood', 'Brentwood Mall',15)
	, ('Henry Eastshore', 'Eastshore Mall',9);

INSERT INTO publisher
	( publisher_code, publisher_name, city )
VALUES
	  ('AH', 'Arkham House', 'Sauk City WI')
	, ('AP', 'Arcade Publishing', 'New York')
	, ('BA', 'Basic Books', 'Boulder CO')
	, ('BP', 'Berkley Publishing', 'Boston')
	, ('BY', 'Back Bay Books', 'New York')
	, ('CT', 'Course Technology', 'Boston')
	, ('FA', 'Fawcett Books', 'New York')
	, ('FS', 'Farrar Straus and Giroux', 'New York')
	, ('HC', 'HarperCollins Publishers', 'New York')
	, ('JP', 'Jove Publications', 'New York')
	, ('JT', 'Jeremy P. Tarcher', 'Los Angeles')
	, ('LB', 'Lb Books', 'New York')
	, ('MP', 'McPherson and Co.', 'Kingston')
	, ('PE', 'Penguin USA', 'New York')
	, ('PL', 'Plume', 'New York')
	, ('PU', 'Putnam Publishing Group', 'New York')
	, ('RH', 'Random House', 'New York')
	, ('SB', 'Schoken Books', 'New York')
	, ('SC', 'Scribner', 'New York')
	, ('SS', 'Simon and Schuster', 'New York')
	, ('ST', 'Scholastic Trade', 'New York')
	, ('TA', 'Taunton Press', 'Newton CT')
	, ('TB', 'Tor Books', 'New York')
	, ('TH', 'Thames and Hudson', 'New York')
	, ('TO', 'Touchstone Books', 'Westport CT')
	, ('VB', 'Vintage Books', 'New York')
	, ('WN', 'W.W. Norton', 'New York')
	, ('WP', 'Westview Press', 'Boulder CO');

INSERT INTO author
	( author_last, author_first )
VALUES
	  ('Morrison', 'Toni')
	, ('Solotaroff', 'Paul')
	, ('Vintage', 'Vernor')
	, ('Francis', 'Dick')
	, ('Straub', 'Peter')
	, ('King', 'Stephen')
	, ('Pratt', 'Philip')
	, ('Chase', 'Truddi')
	, ('Collins', 'Bradley')
	, ('Heller', 'Joseph')
	, ('Wills', 'Gary')
	, ('Hofstadter', 'Douglas R.')
	, ('Lee', 'Harper')
	, ('Ambrose', 'Stephen E.')
	, ('Rowling', 'J.K.')
	, ('Salinger', 'J.D.')
	, ('Heaney', 'Seamus')
	, ('Camus', 'Albert')
	, ('Collins, Jr.', 'Bradley')
	, ('Steinbeck', 'John')
	, ('Castelman', 'Riva')
	, ('Owen', 'Barbara')
	, ('O''Rourke', 'Randy')
	, ('Kidder', 'Tracy')
	, ('Schleining', 'Lon');

INSERT INTO book
	( book_code, title, publisher_code, type, price, paperback )
VALUES
	  ('0180','A Deepness in the Sky','TB','SFI',7.19,'YES')
	, ('0189','Magic Terror','FA','HOR',7.99,'YES')
	, ('0200','The Stranger','VB','FIC',8.00,'YES')
	, ('0378','Venice','SS','ART',24.50,'NO')
	, ('079X','Second Wind','PU','MYS',24.95,'NO')
	, ('0808','The Edge','JP','MYS',6.99,'YES')
	, ('1351','Dreamcatcher: A Novel','SC','HOR',19.60,'NO')
	, ('1382','Treasure Chests','TA','ART',24.46,'NO')
	, ('138X','Beloved','PL','FIC',12.95,'YES')
	, ('2226','Harry Potter and the Prisoner of Azkaban','ST','SFI',13.96,'NO')
	, ('2281','Van Gogh and Gauguin','WP','ART',21.00,'NO')
	, ('2766','Of Mice and Men','PE','FIC',6.95,'YES')
	, ('2908','Electric Light','FS','POE',14.00,'NO')
	, ('3350','Group: Six People in Search of Life','BP','PSY',10.40,'YES')
	, ('3743','Nine Stories','LB','FIC',5.99,'YES')
	, ('3906','The Soul of a New Machine','BY','SCI',11.16,'YES')
	, ('5163','Travels with Charley','PE','TRA',7.95,'YES')
	, ('5790','Catch-22','SC','FIC',12.00,'YES')
	, ('6128','Jazz','PL','FIC',12.95,'YES')
	, ('6328','Band of Brothers','TO','HIS',9.60,'YES')
	, ('669X','A Guide to SQL','CT','CMP',37.95,'YES')
	, ('6908','Franny and Zooey','LB','FIC',5.99,'YES')
	, ('7405','East of Eden','PE','FIC',12.95,'YES')
	, ('7443','Harry Potter and the Goblet of Fire','ST','SFI',18.16,'NO')
	, ('7559','The Fall','VB','FIC',8.00,'YES')
	, ('8092','Godel, Escher, Bach','BA','PHI',14.00,'YES')
	, ('8720','When Rabbit Howls','JP','PSY',6.29,'YES')
	, ('9611','Black House','RH','HOR',18.81,'NO')
	, ('9627','Song of Solomon','PL','FIC',14.00,'YES')
	, ('9701','The Grapes of Wrath','PE','FIC',13.00,'YES')
	, ('9882','Slay Ride','JP','MYS',6.99,'YES')
	, ('9883','The Catcher in the Rye','LB','FIC',5.99,'YES')
	, ('9931','To Kill a Mockingbird','HC','FIC',18.00,'NO');

INSERT INTO wrote
	( book_code, author_num, sequence )
VALUES
	  ('0180',3,1)
	, ('0189',5,1)
	, ('0200',18,1)
	, ('0378',11,1)
	, ('079X',4,1)
	, ('0808',4,1)
	, ('1351',6,1)
	, ('1382',23,2)
	, ('1382',25,1)
	, ('138X',1,1)
	, ('2226',15,1)
	, ('2281',9,2)
	, ('2281',19,1)
	, ('2766',20,1)
	, ('2908',17,1)
	, ('3350',2,1)
	, ('3743',16,1)
	, ('3906',24,1)
	, ('5163',20,1)
	, ('5790',10,1)
	, ('6128',1,1)
	, ('6328',14,1)
	, ('669X',7,1)
	, ('6908',16,1)
	, ('7405',20,1)
	, ('7443',15,1)
	, ('7559',18,1)
	, ('8092',12,1)
	, ('8720',8,1)
	, ('9611',5,2)
	, ('9611',6,1)
	, ('9627',1,1)
	, ('9701',20,1)
	, ('9882',4,1)
	, ('9883',16,1)
	, ('9931',13,1);

INSERT INTO inventory
	( book_code, branch_num, on_hand )
VALUES
	  ('0180',1,2)
	, ('0189',2,2)
	, ('0200',1,1)
	, ('0200',2,3)
	, ('0378',3,2)
	, ('079X',2,1)
	, ('079X',3,2)
	, ('079X',4,3)
	, ('0808',2,1)
	, ('1351',2,4)
	, ('1351',3,2)
	, ('1382',2,1)
	, ('138X',2,3)
	, ('2226',1,3)
	, ('2226',3,2)
	, ('2226',4,1)
	, ('2281',4,3)
	, ('2766',3,2)
	, ('2908',1,3)
	, ('2908',4,1)
	, ('3350',1,2)
	, ('3743',2,1)
	, ('3906',2,1)
	, ('3906',3,2)
	, ('5163',1,1)
	, ('5790',4,2)
	, ('6128',2,4)
	, ('6128',3,3)
	, ('6328',2,2)
	, ('669X',1,1)
	, ('6908',2,2)
	, ('7405',3,2)
	, ('7443',4,1)
	, ('7559',2,2)
	, ('8092',3,1)
	, ('8720',1,3)
	, ('9611',1,2)
	, ('9627',3,5)
	, ('9627',4,2)
	, ('9701',1,2)
	, ('9701',2,1)
	, ('9701',3,3)
	, ('9701',4,2)
	, ('9882',3,3)
	, ('9883',2,3)
	, ('9883',4,2)
	, ('9931',1,2);

/* VERIFY DATA ACCURACY */
SELECT *
FROM branch;

SELECT *
FROM publisher;

SELECT *
FROM author;

SELECT *
FROM book;

SELECT *
FROM wrote;

SELECT *
FROM inventory;
