CREATE DATABASE [3180_Midterm_Review];
GO

USE [3180_Midterm_Review];
GO

CREATE TABLE Artists
(
	--AUTO_INCREMENT doesn't work in MS SQL Server, only in mySQL
	ArtistID INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(255)
);

CREATE TABLE Albums
(
	AlbumID INT IDENTITY(1,1) PRIMARY KEY,
	Title VARCHAR(255),
	Artist INT,
	ReleaseDate DATE,
	FOREIGN KEY (Artist) REFERENCES Artists(ArtistID)
);

CREATE TABLE Songs
(
	SongID INT IDENTITY(1,1) PRIMARY KEY,
	Title VARCHAR(255),
	Artist INT,
	Albums INT,
	ReleaseDate DATE,
	FOREIGN KEY (Artist) REFERENCES Artists(ArtistID),
	FOREIGN KEY (Albums) REFERENCES Albums(AlbumID)
);