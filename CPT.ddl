-- creating Person table
CREATE TABLE IF NOT EXISTS Person(
  SIN INT PRIMARY KEY,
  Firstname VARCHAR(100) NOT NULL,
  Lastname VARCHAR(100) NOT NULL,
  Gender VARCHAR(100) NOT NULL,
  DateOfBirth VARCHAR(100) NOT NULL,
  Streetaddress VARCHAR(100) NOT NULL,
  City VARCHAR(100) NOT NULL,
  Province VARCHAR(100) NOT NULL,
  PostalCode VARCHAR(100) NOT NULL,
  Occupation VARCHAR(100) NOT NULL
);

-- creating phone numer table
CREATE TABLE IF NOT EXISTS PhoneNumber(
  NumberPhone VARCHAR(100) PRIMARY KEY,
  TypePhone VARCHAR(100) NOT NULL
  
);

CREATE TABLE IF NOT EXISTS Owns(
    SIN INT ,
    NumberPhone VARCHAR(100),
    PRIMARY KEY(SIN, NumberPhone)
);

-- creating pilot
CREATE TABLE IF NOT EXISTS Pilot(
  SIN INT PRIMARY KEY,
  Salary FLOAT NOT NULL,
  YearsOfService FLOAT NOT NULL,
  CONSTRAINT PILOT_FK FOREIGN KEY (SIN) REFERENCES Person(SIN)
 );

-- creating driving infractions

CREATE TABLE IF NOT EXISTS DrivingInfractions(
  SIN INT,
  DateOf VARCHAR(100) NOT NULL,
  Type VARCHAR(100) NOT NULL,
  DermitPoints INT NOT NULL,
  FinancialPenalty FLOAT NOT NULL,
  CONSTRAINT INFRACTION_FK FOREIGN KEY (SIN) REFERENCES Person(SIN),
  PRIMARY KEY(SIN, DateOf)
);


-- creating Ship;

CREATE TABLE IF NOT EXISTS Ship(
  SID INT PRIMARY KEY,
  YearInOperation FLOAT NOT NULL,
  NumberOfSeats INT NOT NULL,
  Manufacturer VARCHAR(100) NOT NULL,
  AdvertisingRevenue FLOAT NOT NULL,
  FuelType VARCHAR(100) NOT NULL
);

-- creating Repair

CREATE TABLE IF NOT EXISTS Repair(
  SIN INT,
  SID INT,
  Dateof VARCHAR(100) NOT NULL,
  Cost FLOAT NOT NULL,
  CONSTRAINT PERSONNEL_FK FOREIGN KEY (SIN) REFERENCES Person(SIN),
  CONSTRAINT SHIP_FK FOREIGN KEY (SID) REFERENCES Ship(SID),
  PRIMARY KEY(SIN, SID)
);

-- creating Operate

CREATE TABLE IF NOT EXISTS Operate(
  SIN INT,
  SID INT,
  CONSTRAINT PILOT_FK FOREIGN KEY (SIN) REFERENCES Person(SIN),
  CONSTRAINT SHIP_FK FOREIGN KEY (SID) REFERENCES Ship(SID),
  PRIMARY KEY(SIN, SID)
);

-- creating route

CREATE TABLE IF NOT EXISTS Route(
  RID INT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL
);

-- Creating serve 
CREATE TABLE IF NOT EXISTS Serve(
  SID INT,
  RID INT,
  CONSTRAINT SHIP_FK FOREIGN KEY (SID) REFERENCES Ship(SID),
  CONSTRAINT ROUTE_FK FOREIGN KEY (RID) REFERENCES Route(RID),
  PRIMARY KEY(SID, RID)
);


-- creating Stop

CREATE TABLE IF NOT EXISTS Stop(
  SID INT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL
);

-- Creating Contain

CREATE TABLE IF NOT EXISTS Contain(
  SID INT,
  RID INT,
  CONSTRAINT SHIP_FK FOREIGN KEY (SID) REFERENCES Ship(SID),
  CONSTRAINT ROUTE_FK FOREIGN KEY (RID) REFERENCES Route(RID),
  PRIMARY KEY(SID, RID)
);

-- Creating Schedual

CREATE TABLE IF NOT EXISTS Schedule(
  SID INT,
  RID INT,
  ArrivalTime VARCHAR(100) NOT NULL,
  CONSTRAINT SHIP1_FK FOREIGN KEY (SID) REFERENCES Stop(SID),
  CONSTRAINT ROUTE1_FK FOREIGN KEY (RID) REFERENCES Route(RID),
  PRIMARY KEY(SID, RID)
);

-- Creating Site

CREATE TABLE IF NOT EXISTS Site(
  Name VARCHAR(100) PRIMARY KEY,
  Address VARCHAR(100) NOT NULL,
  PhoneNumber VARCHAR(100) NOT NULL,
  Capacity INT NOT NULL,
  Category VARCHAR(100) NOT NULL
);


-- -- creating Crosses (betwen site and route)

CREATE TABLE IF NOT EXISTS Crosses(
  RID INT,
  Name VARCHAR(100),
  CONSTRAINT Site_FK FOREIGN KEY (Name) REFERENCES Site(Name),
  CONSTRAINT ROUTE2_FK FOREIGN KEY (RID) REFERENCES Route(RID),
  PRIMARY KEY(RID, Name)
);

-- -- creating Assigned (betwen site and stop)

CREATE TABLE IF NOT EXISTS Assigned(
  SID INT,
  Name VARCHAR(100),
  CONSTRAINT SITE_FK FOREIGN KEY (Name) REFERENCES Site(Name),
  CONSTRAINT STOP_FK FOREIGN KEY (SID) REFERENCES Stop(SID),
  PRIMARY KEY(SID, Name)
);

-- -- creating Event 

CREATE TABLE IF NOT EXISTS Event(
  EventType VARCHAR(100) PRIMARY KEY,
  Dateof VARCHAR(100) NOT NULL,
  Time VARCHAR(100) NOT NULL,
  ExpectedNumber INT NOT NULL
);


-- --creating HOST (between site and event)

CREATE TABLE IF NOT EXISTS Host(
  Name VARCHAR(100),
  EventType VARCHAR(100),
  CONSTRAINT NAME_FK FOREIGN KEY(Name) REFERENCES Site(Name),
  CONSTRAINT EVENT_FK FOREIGN KEY(EventType) REFERENCES Event(EventType),
  PRIMARY KEY(Name, EventType)
);

-- Henry par

-- creating Passenger
CREATE TABLE IF NOT EXISTS Passenger(
  SIN INT PRIMARY KEY,
  Passenger_type ENUM("Child", "Senior","Student"),
  CONSTRAINT SIN_FK FOREIGN KEY (SIN) REFERENCES Person(SIN),
  CONSTRAINT PASSEN_FK FOREIGN KEY (Passenger_type) REFERENCES Fare(type)
);

-- creating Fare
CREATE TABLE IF NOT EXISTS Fare(
  type ENUM("Child", "Senior","Student") NOT NULL PRIMARY KEY,
  price FLOAT NOT NULL
);

-- creating associated with
CREATE TABLE IF NOT EXISTS AssociatedWith(
  Passenger_type ENUM("Child", "Senior","Student"),
  type ENUM("Child", "Senior","Student") NOT NULL PRIMARY KEY,
  CONSTRAINT Passenger_type_FK FOREIGN KEY (Passenger_type) REFERENCES Passenger(type),
  CONSTRAINT Passenger_type_FK1 FOREIGN KEY (type) REFERENCES Fare(type)

);

-- creating passenger
CREATE TABLE IF NOT EXISTS ServicePersonnel(
  SIN INT NOT NULL PRIMARY KEY,
  Specialization varchar(100) NOT NULL,
  Level ENUM("technician", "senior technician", "supervisor", "manager") NOT NULL,
  YearsOfService FLOAT NOT NULL,
  Salary FLOAT NOT NULL,
  CONSTRAINT SIN_FK FOREIGN KEY (SIN) REFERENCES Person(SIN)
  
);












