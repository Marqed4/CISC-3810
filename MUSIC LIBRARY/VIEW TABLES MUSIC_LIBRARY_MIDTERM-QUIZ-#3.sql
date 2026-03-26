USE [3180_Midterm_Review];
GO

SELECT *
FROM Songs
JOIN Artists ON Songs.Artist = Artists.ArtistID;