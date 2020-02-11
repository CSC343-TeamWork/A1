-- creating Person table
CREATE TABLE IF NOT EXISTS Person(
  SIN INT NOT NULL UNIQUE,
  Firstname VARCHAR(100) NOT NULL,
  Lastname VARCHAR(100) NOT NULL,
  Gender ENUM("Male", "Female") NOT NULL,
  DateOfBirth VARCHAR(100) NOT NULL,
  Streetaddress VARCHAR(100) NOT NULL,
  City VARCHAR(100) NOT NULL,
  Province VARCHAR(100) NOT NULL,
  PostalCode VARCHAR(100) NOT NULL,
  Occupation VARCHAR(100) NOT NULL,
  PRIMARY KEY(SIN)
);

-- creating phone numer table
CREATE TABLE IF NOT EXISTS PhoneNumber(
  SIN INT NOT NULL UNIQUE,
  Phone_Number VARCHAR(100) NOT NULL,
  Phone_Type VARCHAR(100) NOT NULL,
  CONSTRAINT PHONENUMBER_FK FOREIGN KEY (SIN) REFERENCES Person(SIN),
  PRIMARY KEY(SIN, Phone_Number)
);

-- creating pilot
CREATE TABLE IF NOT EXISTS Pilot(
  SIN INT NOT NULL UNIQUE,
  Salary FLOAT NOT NULL,
  YearsOfService FLOAT NOT NULL,
  CONSTRAINT PILOT_FK FOREIGN KEY (SIN) REFERENCES Person(SIN),
  PRIMARY KEY(SIN)
);

-- creating passenger
CREATE TABLE IF NOT EXISTS Passenger(
  SIN INT NOT NULL UNIQUE,
  Age INT,
  Institution_Id INT,
  Passenger_type ENUM("Child", "Senior","Student", "Others") NOT NULL,
  CONSTRAINT SIN_FK FOREIGN KEY (SIN) REFERENCES Person(SIN),
  CONSTRAINT Passenger_type_FK FOREIGN KEY (Passenger_type) REFERENCES Fare(Fare_type),
  CONSTRAINT Institution_Id_FK FOREIGN KEY (Institution_Id) REFERENCES Institution(Institution_Id),
  PRIMARY KEY(SIN,Passenger_type)
);

-- creating fare
CREATE TABLE IF NOT EXISTS Fare(
  Fare_type ENUM("Child", "Senior","Student", "Others") NOT NULL,
  Fare_price FLOAT NOT NULL UNIQUE,
  PRIMARY KEY(Fare_type, Fare_price)
);

-- creating Institution
CREATE TABLE IF NOT EXISTS Institution(
  Institution_Id INT NOT NULL UNIQUE,
  Institution_Name VARCHAR(100) NOT NULL,
  PRIMARY KEY(Institution_Id)
);

-- creating passenger
CREATE TABLE IF NOT EXISTS ServicePersonnel(
  SIN INT NOT NULL UNIQUE,
  Specialization varchar(100) NOT NULL,
  Level ENUM("technician", "senior technician", "supervisor", "manager") NOT NULL,
  YearsOfService FLOAT NOT NULL,
  Salary FLOAT NOT NULL,
  CONSTRAINT SIN_FK FOREIGN KEY (SIN) REFERENCES Person(SIN),
  PRIMARY KEY(SIN)
);



======================== update before=============================



















-- creating driving infractions

CREATE TABLE IF NOT EXIST DrivingInfractions(
  SIN INT,
  Date VARCHAR(100) NOT NULL,
  Type VARCHAR(100) NOT NULL,
  DermitPoints INT NOT NULL,
  FinancialPenalty FLOAT NOT NULL,
  CONSTRAINT INFRACTION_FK FOREIGN KEY (SIN) REFERENCES Person(SIN),
  PRIMARY KEY(SIN, Date)
);


-- creating Ship;

CREATE TABLE IF NOT EXIST Ship(
  SID INT PRIMARY KEY,
  YearInOperation FLOAT NOT NULL,
  NumberOfSeats INT NOT NULL,
  Manufacturer VARCHAR(100) NOT NULL,
  AdvertisingRevenue FLOAT NOT NULL,
  FuelType VARCHAR(100) NOT NULL,
);

-- creating Repair

CREATE TABLE IF NOT EXIST Repair(
  SIN INT,
  SID INT,
  Date VARCHAR(100) NOT NULL,
  Cost FLOAT NOT NULL,
  CONSTRAINT PERSONNEL_FK FOREIGN KEY (SIN) REFERENCES Person(SIN),
  CONSTRAINT SHIP_FK FOREIGN KEY (SID) REFERENCES Ship(SID),
  PRIMARY KEY(SIN, SID)
);

-- creating Operate

CREATE TABLE IF NOT EXIST Operate(
  SIN INT,
  SID INT,
  CONSTRAINT PILOT_FK FOREIGN KEY (SIN) REFERENCES Person(SIN),
  CONSTRAINT SHIP_FK FOREIGN KEY (SID) REFERENCES Ship(SID),
  PRIMARY KEY(SIN, SID)
);

-- creating route

CREATE TABLE IF NOT EXIST Route(
  RID INT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
);

-- Creating serve 
CREATE TABLE IF NOT EXIST Serve(
  SID INT,
  RID INT,
  CONSTRAINT SHIP_FK FOREIGN KEY (SID) REFERENCES Ship(SID),
  CONSTRAINT ROUTE_FK FOREIGN KEY (RID) REFERENCES Route(RID),
  PRIMTARY KEY(SID, RID)
);


-- creating Stop

CREATE TABLE IF NOT EXIST Stop(
  SID INT PRIMARY KEY,
  Name VARCHAR(100),
);

-- Creating Contain

CREATE TABLE IF NOT EXIST Contain(
  SID INT,
  RID INT,
  CONSTRAINT SHIP_FK FOREIGN KEY (SID) REFERENCES Ship(SID),
  CONSTRAINT ROUTE_FK FOREIGN KEY (RID) REFERENCES Route(RID),
  PRIMTARY KEY(SID, RID)
);

-- Creating Schedual

CREATE TABLE IF NOT EXIST Schedule(
  SID INT,
  RID INT,
  ArrivalTime VARCAHR(100) NOT NULL,
  CONSTRAINT SHIP_FK FOREIGN KEY (SID) REFERENCES Stop(SID),
  CONSTRAINT ROUTE_FK FOREIGN KEY (RID) REFERENCES Route(RID),
  PRIMTARY KEY(SID, RID)
);

-- Creating Site

CREATE TABLE IF NOT EXIST Site(
  Name VARCHAR(100) PRIMARY KEY,
  PhoneNumber VARCAHR(100) NOT NULL,
  Capacity INT NOT NULL,
  Category VARCAHR(100) NOT NULL,
);


-- creating Crosses (betwen site and route)

CREATE TABLE IF NOT EXIST Crosses(
  RID INT,
  Name VARCHAR(100),
  CONSTRAINT Site_FK FOREIGN KEY (Name) REFERENCES Site(Name),
  CONSTRAINT ROUTE_FK FOREIGN KEY (RID) REFERENCES Route(RID),
  PRIMTARY KEY(SID, Name)
);

-- creating Assigned (betwen site and stop)

CREATE TABLE IF NOT EXIST Assigned(
  SID INT,
  Name VARCHAR(100),
  CONSTRAINT SITE_FK FOREIGN KEY (Name) REFERENCES Site(Name),
  CONSTRAINT STOP_FK FOREIGN KEY (SID) REFERENCES Stop(SID),
  PRIMTARY KEY(SID, Name)
);

-- creating Event 

CREATE TABLE IF NOT EXIST Event(
  Type VARCHAR(100) PRIMARY KEY
);


--creating HOST (between site and event)

CREATE TABLE IF NOT EXIST Host(
  Name VARCHAR(100),
  Type VARCHAR(100),
  Name VARCHAR(100) NOT NULL, 
  Date VARCHAR(100) NOT NULL,
  Time VARCHAR(100) NOT NULL,
  ExpectedNumber INT NOT NULL,
  CONSTRAINT NAME_FK FOREIGN KEY(Name) REFERENCES Site(Name),
  CONSTRAINT EVENT_FK FOREIGN KEY(Type) REFERENCES Event(Type),
  PRIMARY KEY(Name, Type)
);













