CREATE TABLE AUTHENTICATION_SYSTEM(
	U_ID INT IDENTITY(1,1) PRIMARY KEY,
	A_NAME VARCHAR(30) NOT NULL,
	U_NAME VARCHAR(30),
	PASSWORD VARCHAR(20),
)

INSERT INTO AUTHENTICATION_SYSTEM (A_NAME, U_NAME, PASSWORD) 
VALUES ('STEIN','ST-1','12345'),
	   ('MERRY','ST-2','123456'),
       ('DAVID','ST-3','1234567'),
       ('ALLIS','ST-4','12345678'),
       ('ARAY','ST-5','123456789'),
       ('GAL GADOT','ST-6','123456780'),
       ('IMON AHMED','ST-7','1234567810')
       
       
 CREATE TABLE ADMIN_PANEL(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	U_ID INT NOT NULL FOREIGN KEY REFERENCES AUTHENTICATION_SYSTEM (U_ID),
	FIRST_NAME VARCHAR(30),
	LAST_NAME VARCHAR(30),
)

INSERT INTO ADMIN_PANEL (U_ID,FIRST_NAME, LAST_NAME) 
VALUES (001,'STEIN','ORKAIN'),
	   (002,'MERRY','INN'),
       (003,'DAVID','ERKHAM'),
       (004,'ALLIS','SALVATION'),
       (005,'ARAY','ROITER'),
       (006,'GAL','GADOT'),
       (007,'IMON','AHMED')
       

CREATE TABLE USERS (
	USERS_ID INT IDENTITY(1,1) PRIMARY KEY,
	ID INT NOT NULL FOREIGN KEY REFERENCES ADMIN_PANEL (ID),
	USERS_NAME VARCHAR(30) NOT NULL,
	EMAIL VARCHAR(50) NOT NULL,
	USER_PASSWORD VARCHAR(30) NOT NULL,
)

INSERT INTO USERS (ID,USERS_NAME, EMAIL,USER_PASSWORD) 
VALUES (001,'STEIN','junaed.uddin460@gmail.com','1234'),
	   (002,'MERRY','imon.boss460@gmail.com','12345'),
       (003,'DAVID','anika.uddin460@gmail.com','12346'),
       (004,'ALLIS','jahid.uddin460@gmail.com','12347'),
       (005,'ARAY','junaed.uddin460@gmail.com','12344'),
       (006,'GAL','junaina.uddin460@gmail.com','12342'),
       (007,'IMON','selena.uddin460@gmail.com','123469')
       
          

          
CREATE TABLE BOOKS (
	SI_NO INT IDENTITY(1,1) PRIMARY KEY,
	USERS_ID INT NOT NULL FOREIGN KEY REFERENCES USERS(USERS_ID),
	ISBN VARCHAR(40),
	CATEGORY VARCHAR(30) NOT NULL,
	PRICE INTEGER,
	AUTHOR VARCHAR(20) NOT NULL,
	TITLE VARCHAR(30) NOT NULL,
	ISSUE_DATE DATE NOT NULL,
	RESERVATION_DATE DATE NOT NULL,
	RETURN_DATE DATE NOT NULL,
)

INSERT INTO BOOKS (USERS_ID,ISBN, CATEGORY,PRICE,AUTHOR,TITLE,ISSUE_DATE,RESERVATION_DATE,RETURN_DATE) 
VALUES  (001,'4212-2536-452139','STORY',1000,'HUMAYUN AHMED','MOYURAKKHI','09-26-2018','08-15-2018','09-28-2018'),
	    (002,'8912-2536-678139','SCIENCE FICTION',700,'M.MORIS','DEATHLY HALLOWS','09-28-2018','09-28-2018','10-20-2018'),
	    (003,'5672-2536-452139','THRILLER',400,'ISTEIN','HARRY POTTER','12-29-2018','01-15-2018','08-20-2018'),
	    (004,'6782-2536-452139','SCIENCE FICTION',250,'M.MORIS','MICROPROCESSOR','08-15-2018','10-15-2018','08-20-2018'),
	    (005,'2342-2536-452139','STORY',200,'HUMAYUN AHMED','OPEKKHA','08-15-2018','12-28-2018','08-20-2018'),
	    (006,'7612-2536-452139','STORY',150,'STEIN','DARKNESS AT NOON','08-15-2018','03-15-2018','12-28-2018'),
	    (007,'3662-2536-452139','THRILLER',100,'HUMAYUN AHMED','HIMU','09-29-2018','02-15-2018','08-20-2018')


CREATE TABLE PERIODICALS (
	P_ID INT IDENTITY(1,1) PRIMARY KEY,
	USERS_ID INT NOT NULL FOREIGN KEY REFERENCES USERS(USERS_ID),
	P_TITLE VARCHAR(30) NOT NULL,
	P_YEAR VARCHAR(20) NOT NULL,
	RESERVATION_DATE DATE  NOT NULL,
	ISSUE_DATE DATE  NOT NULL,
	RETURN_DATE DATE  NOT NULL,

)

INSERT INTO PERIODICALS (USERS_ID,P_TITLE, P_YEAR,ISSUE_DATE,RESERVATION_DATE,RETURN_DATE) 
VALUES  (001,'The New York Times','2018','09-26-2018','08-15-2018','09-29-2018'),
	    (002,'Library Journal','2018','09-26-2018','09-15-2018','09-30-2018'),
	    (003,'Wired','2017','09-26-2018','08-15-2018','09-28-2018'),
	    (004,'Punk Planet','2017','09-26-2018','08-15-2018','09-28-2018'),
	    (005,'NME','2015','09-26-2018','08-15-2018','09-28-2018'),
	    (006,'Library Journal','2016','09-26-2018','08-25-2018','09-28-2018'),
	    (007,'The New York','2014','09-26-2018','08-19-2018','09-28-2018')
	    

CREATE TABLE PUBLISHER (
	PU_ID INT IDENTITY(1,1) PRIMARY KEY,
	SI_NO INT NOT NULL FOREIGN KEY REFERENCES BOOKS(SI_NO),
	P_ID INT NOT NULL FOREIGN KEY REFERENCES PERIODICALS(P_ID),
	PU_NAME VARCHAR(20) NOT NULL,
	PUBLICATION_DATE DATE NOT NULL,
)

INSERT INTO PUBLISHER (SI_NO,P_ID,PU_NAME,PUBLICATION_DATE) 
VALUES (001,001,'HARVARD','03-27-2018'),
	   (002,002,'STERN','09-14-2018'),
	   (003,003,'brocott','09-26-2018'),
	   (004,004,'katrina','09-26-2018'),
	   (005,005,'HARVARD','09-18-2018'),
	   (006,006,'ISTIAK','03-27-2018'),
	   (007,007,'DAVID','03-27-2018')
	  


-->--SQL QUERY

-->ADMINS
       
-->1.
SELECT * FROM AUTHENTICATION_SYSTEM
-->2.
SELECT A_NAME FROM AUTHENTICATION_SYSTEM
-->3.
SELECT U_NAME FROM AUTHENTICATION_SYSTEM
-->4.
SELECT U_NAME,A_NAME FROM AUTHENTICATION_SYSTEM WHERE A_NAME LIKE 'A%'
-->5.
SELECT A_NAME FROM AUTHENTICATION_SYSTEM WHERE A_NAME LIKE 'I%'
-->6.
SELECT FIRST_NAME FROM ADMIN_PANEL
-->7.
SELECT TOP 3 FIRST_NAME,LAST_NAME FROM ADMIN_PANEL
-->8.
SELECT LAST_NAME FROM ADMIN_PANEL ORDER BY LAST_NAME DESC
-->9.
SELECT FIRST_NAME,LAST_NAME,USERS_NAME,EMAIL FROM ADMIN_PANEL,USERS WHERE FIRST_NAME LIKE 'I%'
-->10.
SELECT FIRST_NAME,USERS_ID,EMAIL FROM ADMIN_PANEL,USERS WHERE FIRST_NAME LIKE 'I%'OR FIRST_NAME LIKE 'A%'
-->11.
SELECT FIRST_NAME,USERS_ID,EMAIL FROM ADMIN_PANEL,USERS WHERE FIRST_NAME LIKE 'I%N'
-->12.
SELECT * FROM USERS
-->13.
SELECT FIRST_NAME + '  ' + LAST_NAME AS 'FULL NAME' FROM ADMIN_PANEL


-->PRIVATE USERS

-->1.
SELECT CATEGORY FROM BOOKS
-->2.
SELECT CATEGORY, SUM(PRICE) AS 'TOTAL PRICE' FROM BOOKS GROUP BY CATEGORY HAVING CATEGORY ='STORY' 
-->3.
SELECT TITLE FROM BOOKS WHERE AUTHOR ='HUMAYUN AHMED'
-->4.
SELECT SI_NO FROM BOOKS WHERE TITLE ='HARRY POTTER'
-->5.
SELECT ISBN FROM BOOKS
-->6.
SELECT TITLE FROM BOOKS WHERE PRICE <= 250
-->7.
SELECT * FROM BOOKS WHERE CATEGORY ='SCIENCE FICTION'
-->8.
SELECT TITLE,PRICE AS MAXIMUM_PRICE
   FROM BOOKS WHERE PRICE = (SELECT MAX(PRICE) FROM BOOKS)
-->9.
SELECT * FROM BOOKS WHERE AUTHOR LIKE 'S%N'
-->10.
SELECT TOP 4 TITLE FROM BOOKS
-->11.
SELECT USERS_NAME,ISSUE_DATE FROM USERS,BOOKS WHERE ISSUE_DATE ='09-26-2018'
-->12.
SELECT USERS_NAME, PRICE ,RETURN_DATE FROM USERS,BOOKS WHERE PRICE >= 150 AND RETURN_DATE = '10-20-2018'
-->13.
SELECT USERS_NAME,ISSUE_DATE FROM USERS,BOOKS WHERE ISSUE_DATE ='09-29-2018'
-->14.
SELECT USERS_NAME,CATEGORY, RESERVATION_DATE FROM USERS,BOOKS WHERE CATEGORY = 'STORY' AND RESERVATION_DATE ='03-15-2018'
-->15.
SELECT USERS_NAME,PRICE,RESERVATION_DATE FROM USERS,BOOKS WHERE PRICE = 400 AND AUTHOR ='ISTEIN'
-->16.
SELECT USERS_NAME,RESERVATION_DATE FROM USERS,BOOKS WHERE RESERVATION_DATE ='09-28-2018'
-->17.
SELECT AUTHOR,TITLE FROM BOOKS WHERE AUTHOR ='M.MORIS'
-->18.
SELECT TITLE, PRICE FROM BOOKS WHERE TITLE ='DARKNESS AT NOON'
-->19.
SELECT P_TITLE,P_YEAR FROM PERIODICALS WHERE P_YEAR = '2018'
-->20.
SELECT P_TITLE,PUBLICATION_DATE FROM PERIODICALS,PUBLISHER WHERE PUBLICATION_DATE = '09-14-2018'
-->21.
SELECT P_TITLE FROM PERIODICALS WHERE P_YEAR = '2017'
-->22.
SELECT USERS_NAME,RESERVATION_DATE,RETURN_DATE FROM USERS,BOOKS WHERE RESERVATION_DATE = '08-15-2018' AND RETURN_DATE = '09-28-2018'
-->23.
SELECT PU_NAME,PUBLICATION_DATE FROM PUBLISHER WHERE PU_NAME = 'HARVARD'
-->24.
SELECT PU_NAME,AUTHOR FROM PUBLISHER,BOOKS WHERE AUTHOR LIKE 'S%'
-->25.
SELECT PU_NAME,PRICE FROM PUBLISHER,BOOKS WHERE PRICE <= 250
-->26.
SELECT PU_NAME,CATEGORY FROM PUBLISHER,BOOKS WHERE CATEGORY = 'STORY' AND ISSUE_DATE = '09-26-2018'
-->27.
SELECT USERS_NAME,RESERVATION_DATE,PU_NAME FROM USERS,BOOKS,PUBLISHER WHERE PU_NAME = 'DAVID' AND RESERVATION_DATE = '10-15-2018'
-->28.
SELECT PU_NAME,PUBLICATION_DATE FROM PUBLISHER WHERE PUBLICATION_DATE = '03-27-2018'
-->29.
SELECT PU_NAME,P_TITLE FROM PUBLISHER, PERIODICALS WHERE P_TITLE = 'The New York Times'
-->30.
SELECT PU_NAME,PU_ID FROM PUBLISHER WHERE PU_NAME LIKE 'I%K' AND PU_ID = 6
-->31.
SELECT PRICE AS AVERAGE_PRICE FROM BOOKS WHERE PRICE = (SELECT AVG(PRICE) FROM BOOKS)


-->NORMAL USER

-->1.
SELECT ISBN,TITLE FROM BOOKS
-->2.
SELECT TITLE,PRICE AS MINIMUM_PRICE FROM BOOKS
   WHERE PRICE = (SELECT MIN(PRICE) FROM BOOKS)
-->3.
SELECT AUTHOR,TITLE FROM BOOKS WHERE TITLE = 'HARRY POTTER' OR TITLE = 'DEATHLY HALLOWS'
-->4.
SELECT USERS_NAME,ISSUE_DATE,PRICE FROM USERS,BOOKS WHERE PRICE >= 450
-->5.
SELECT USERS_NAME,CATEGORY,ISSUE_DATE FROM USERS,BOOKS WHERE CATEGORY = 'SCIENCE FICTION' AND ISSUE_DATE ='08-15-2018'
-->6.
SELECT TITLE, AUTHOR FROM BOOKS WHERE AUTHOR = 'M.MORIS'
-->7.
SELECT EMAIL,ISSUE_DATE FROM USERS,BOOKS WHERE ISSUE_DATE = '09-26-2018'
-->8.
SELECT USERS_NAME,USER_PASSWORD,ISSUE_DATE FROM USERS,BOOKS WHERE USER_PASSWORD ='12345' AND ISSUE_DATE = '09-26-2018'
-->9.
SELECT TITLE,COUNT(DISTINCT SI_NO) AS 'TOTAL NUMBER' FROM BOOKS GROUP BY TITLE
-->10.
SELECT PU_NAME,P_TITLE FROM PUBLISHER,PERIODICALS WHERE P_TITLE = 'WIRED'
-->11.
SELECT LOWER(CATEGORY) AS 'FULL CATEGORY' FROM BOOKS
-->12.
SELECT UPPER(PU_NAME),PUBLICATION_DATE FROM PUBLISHER WHERE PUBLICATION_DATE = '09-26-2018'
-->13.
SELECT LEN(P_TITLE)AS 'LENGTH' FROM PERIODICALS WHERE P_TITLE = 'The New York Times'
-->14.
SELECT TOP 50 PERCENT * FROM BOOKS
-->15.
SELECT * FROM BOOKS WHERE PRICE BETWEEN 150 AND 800
-->16.
SELECT * FROM PERIODICALS

