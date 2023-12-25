EXPLAIN SELECT * FROM personalInfo;
EXPLAIN SELECT * FROM salary;
EXPLAIN SELECT * FROM Workers;
/*
Первинний ключ (PRIMARY KEY) – це основний ключ, який у таблиці може лише один.
 Він дозволяє ідентифікувати унікальні записи у таблиці. Значення в стовпці,
 де поля мають PRIMARY KEY, не можуть повторюватися. 
Часто первинний ключ призначають для полів з ідентифікатором id
*/

CREATE INDEX cityInd ON personalInfo (city);

-- для прискорення пошуку по місту.

CREATE INDEX postInd ON salary (post);

-- для прискорення пошуку на посаді.

CREATE INDEX telphoneInd ON Workers (telephone);

-- для прискорення пошуку за номером телефону

/*
Creating views
*/

CREATE VIEW cityAndPhone AS
SELECT name, telephone,
city
FROM Workers
JOIN personalInfo ON Workers.id = personalInfo.personalId;

CREATE VIEW unMarried AS
SELECT name, telephone, birthDate
FROM Workers
JOIN personalInfo ON Workers.id = personalInfo.personalId
WHERE married = 0;

CREATE VIEW managers AS
SELECT name, 
telephone, 
birthDate,
post
FROM Workers
JOIN personalInfo ON Workers.id = personalInfo.personalId
JOIN salary ON Workers.id = salary.salaryId
WHERE post = 'manager';

/*
task6
*/

USE ShopDB;

ALTER TABLE Orders DROP FOREIGN KEY FK_Orders_Customers;

DROP TABLE Customers;



CREATE TABLE Customers
	(
	CustomerNo int NOT NULL,
	FName nvarchar(15) NOT NULL,
	LName nvarchar(15) NOT NULL,
	MName nvarchar(15) NULL,
	Address1 nvarchar(50) NOT NULL,
	Address2 nvarchar(50) NULL,
	City nchar(10) NOT NULL,
	Phone char(12) NOT NULL,
	DateInSystem date NULL
    
	);
    
    INSERT Customers 
(CustomerNo, LName, FName, MName, Address1, Address2, City, Phone,DateInSystem)
VALUES
(1,'Круковський','Анатолій','Петрович','Лужна 15',NULL,'Харків','(092)3212211','2009-11-20'),
(2,'Дурнєв','Віктор','Вікторович','Зелінська 10',NULL,'Київ','(067)4242132','2009-11-20'),
(3,'Унакій','Зігмунд','Федорович','Дегтяревська 5',NULL,'Київ','(092)7612343','2009-11-20'),
(4,'Левченко','Віталий','Вікторович','Глущенка 5','Драйзера 12','Київ','(053)3456788','2009-11-20'),
(5,'Вижлецов','Олег','Олегович','Київська 3','Одеська 8','Чернігів','(044)2134212','2009-11-20');

EXPLAIN SELECT * FROM Customers;

ALTER TABLE Customers ADD 
	CONSTRAINT PK_Customers PRIMARY KEY(CustomerNo) ;
    
EXPLAIN SELECT * FROM Customers; 

CREATE INDEX cityInd ON Customers (City);   

EXPLAIN SELECT * FROM Customers
WHERE City = 'Харків';

/*
https://www.w3schools.com/sql/sql_create_index.asp - about indexes
https://www.w3schools.com/sql/sql_view.asp - creating view
*/
 