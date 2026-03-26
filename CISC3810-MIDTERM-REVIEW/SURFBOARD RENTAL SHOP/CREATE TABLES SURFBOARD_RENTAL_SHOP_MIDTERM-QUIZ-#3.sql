USE [3810_Midterm_Review];
GO

CREATE TABLE Surfboard
(
	BoardID INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(255) NOT NULL,
	BoardLength INT NOT NULL,
	SkillLevel VARCHAR(255),
	DailyRate DECIMAL(8,2)
);

CREATE TABLE Customer
(
	CustomerID INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(255),
	Email VARCHAR(255) UNIQUE,
	PhoneNumber VARCHAR(255)
);

CREATE TABLE Locations
(
	LocationID INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(255) NOT NULL,
	City VARCHAR(255) UNIQUE NOT NULL
)

CREATE TABLE Rental
(
	RentalID INT IDENTITY(1,1) PRIMARY KEY,
	Customer INT NOT NULL,
	Surfboard INT NOT NULL,
	Location INT NOT NULL,
	-- RentalDate was NOT NULL constraint but the query made me realize that 
	-- if a surfboard is a rental and it's never been rented 
	-- how can it have a rental date.
	RentalDate DATE,
	ReturnDate DATE,
	FOREIGN KEY (Customer) REFERENCES Customer(CustomerID),
	FOREIGN KEY (Surfboard) REFERENCES Surfboard(BoardID),
	FOREIGN KEY (Location) REFERENCES Locations(LocationID)
);