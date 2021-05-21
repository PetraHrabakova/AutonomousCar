/* Create tables and insert data  */



/* Create table Car */
CREATE TABLE Car (
	Brand CHAR(20),
	Make INT NULL,
	LicensePlate VARCHAR(10),
	PRIMARY KEY (LicensePlate)  );
	
/* Insert data */
INSERT INTO Car (Brand, Year, LicensePlate)
	VALUES ('Tesla', 2020, '85NZ69K9')

INSERT INTO Car (Brand, Year, LicensePlate)
	VALUES ('BMW', 2015, '96543KP2')
	
INSERT INTO Car (Brand, Year, LicensePlate)
	VALUES ('Audi', 1980, 'KN982UI0')

INSERT INTO Car (Brand, Year, LicensePlate)
	VALUES ('Mercedes', 2016, 'KA82IW96')
	
INSERT INTO Car (Brand, Year, LicensePlate)
	VALUES ('Renault', 1998 , 'AB45IE9A')
	


/* Create table Driver */
CREATE TABLE Driver (
	LicensePlate VARCHAR(10),
	Name CHAR(20),
	Address VARCHAR(30),
	SSN CHAR(10),
	PRIMARY KEY (SSN),
	FOREIGN KEY (LicensePlate) REFERENCES Car (LicensePlate)  );
	
/* Insert data */
INSERT INTO Driver (LicensePlate, Name, Address, SSN)
	VALUES ('85NZ69K9', 'Ross Geller', 'Sønderhøj 30', 123456789);

INSERT INTO Driver (LicensePlate, Name, Address, SSN)
	VALUES ('96543KP2', 'Rachel Green', 'Sunnyside 7', 987654321);
	
INSERT INTO Driver (LicensePlate, Name, Address, SSN)
	VALUES ('KN982UI0', 'Monica Geller', 'Rainbow 79', 321654987);

INSERT INTO Driver (LicensePlate, Name, Address, SSN)
	VALUES ('KA82IW96', 'Joey Tribbiani', 'Tomorrowland 20', 789456123);
	
INSERT INTO Driver (LicensePlate, Name, Address, SSN)
	VALUES ('AB45IE9A', 'Chandler Bing', 'Forrest Road 64', 123987597);
	

	
/* Create table GPS */	
CREATE TABLE GPS (
	LicensePlate VARCHAR(10),
	Longitude FLOAT,
	Latitude FLOAT,
	Date date,
	Time time(6),
	FOREIGN KEY (LicensePlate) REFERENCES Car (LicensePlate)  );
	
/* Insert data */
INSERT INTO GPS (LicensePlate, Longitude, Latitude, Date, Time)
	VALUES ('85NZ69K9', 56.154128, 10.215622, '2021-05-18', '07:56:14');				/* DOKK1 coordinates */

INSERT INTO GPS (LicensePlate, Longitude, Latitude, Date, Time)
	VALUES ('96543KP2', 56.154486, 10.201588, '2021-04-02', '20:16:56');				/* AroS Museum coordinates */ 
	
INSERT INTO GPS (LicensePlate, Longitude, Latitude, Date, Time)
	VALUES ('KN982UI0', 56.162564, 10.189486, '2021-01-23', '12:03:56');				/* Botaniskhave coordniates */ 

INSERT INTO GPS (LicensePlate, Longitude, Latitude, Date, Time)
	VALUES ('KA82IW96', 56.153076, 10.199528, '2021-05-01', '03:50:12');				/* Musikhuset Aarhus coordinates */ 		
	
INSERT INTO GPS (LicensePlate, Longitude, Latitude, Date, Time)
	VALUES ('AB45IE9A', 56.154582, 10.207132, '2021-04-05', '15:16:30');				/* Aarhus coordinates */
	
	

/* Create table Speed */	
CREATE TABLE Speed (
	LicensePlate VARCHAR(10),
	Speed INT,
	FOREIGN KEY (LicensePlate) REFERENCES Car (LicensePlate)  );
	
/* Insert data */
INSERT INTO Speed (LicensePlate, Speed)
	VALUES ('85NZ69K9', 59);
	
INSERT INTO Speed (LicensePlate, Speed)
	VALUES ('96543KP2', 22);
	
INSERT INTO Speed (LicensePlate, Speed)
	VALUES ('KN982UI0', 68);

INSERT INTO Speed (LicensePlate, Speed)
	VALUES ('KA82IW96', 30);
	
INSERT INTO Speed (LicensePlate, Speed)
	VALUES ('AB45IE9A', 47);
	


/* Create table Ticket */
CREATE TABLE Ticket (
	SSN CHAR(10),
	LicensePlate VARCHAR(10),
	Price VARCHAR(10),
	FOREIGN KEY (SSN) REFERENCES Driver (SSN),
	FOREIGN KEY (LicensePlate) REFERENCES Car (LicensePlate)  );
	
/* Insert data */
INSERT INTO Ticket (SSN, LicensePlate, Price)
	VALUES (123456789, '85NZ69K9', '300 DKK');
	
INSERT INTO Ticket (SSN, LicensePlate, Price)
	VALUES (321654987, 'KN982UI0', '2000 DKK');


	






































	


