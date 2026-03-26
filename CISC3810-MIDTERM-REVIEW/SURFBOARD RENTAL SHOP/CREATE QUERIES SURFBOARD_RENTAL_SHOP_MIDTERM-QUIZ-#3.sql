USE [3810_Midterm_Review];
GO

--ALTER TABLE Rental
--ALTER COLUMN RentalDate DATE;

-- Update (See original rental table) if the board was never rented it cannot be in the rental table.

ALTER TABLE Rental
ALTER COLUMN RentalDate DATE NOT NULL;

-- List all rentals showing the customer's name, the surfboard's name, and the location's city.
SELECT
Customer.Name AS Customer,
Surfboard.Name AS Surfboard,
Locations.City AS City
FROM Rental
JOIN Customer ON Rental.Customer = Customer.CustomerID
JOIN Surfboard ON Rental.Surfboard = Surfboard.BoardID
JOIN Locations ON Rental.Location = Locations.LocationID;

-- Find all surfboards that have never been rented.
SELECT
Surfboard.Name
FROM Surfboard
LEFT JOIN Rental ON Surfboard.BoardID = Rental.Surfboard
WHERE Rental.RentalDate IS NULL;

-- Find all rentals of advanced-level surfboards with a daily rate over $50.

SELECT
Surfboard.Name AS Surfboard
FROM Rental
JOIN Surfboard ON Rental.Surfboard = Surfboard.BoardID
WHERE Surfboard.SkillLevel = 'Advanced' AND Surfboard.DailyRate >= 50;

-- Find customers who have rented more than 3 times, showing their name and total number of rentals.

SELECT
Customer.Name,
COUNT(*) AS TimesRented
FROM Rental
JOIN Customer ON Rental.Customer = Customer.CustomerID
GROUP BY Customer.Name
HAVING COUNT(*) > 3;