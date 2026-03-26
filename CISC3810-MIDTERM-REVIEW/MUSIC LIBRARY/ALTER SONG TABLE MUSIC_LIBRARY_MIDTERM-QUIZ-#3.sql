USE [3180_Midterm_Review];
GO

/*
ALTER TABLE Songs
DROP COLUMN Duration;

ALTER TABLE Songs
ADD Duration DECIMAL(8,2);
*/

UPDATE Songs
SET Duration = 3.34
WHERE Songs.SongID = 1;
