USE [3810_Midterm_Review];
GO

-- List every song alongside its album title and artist name.
SELECT 
Songs.Title AS SongName, 
Albums.Title AS Title, 
Artists.Name AS Artists
FROM Songs
JOIN Albums ON Songs.Albums = Albums.AlbumID
JOIN Artists ON Songs.Artist = Artists.ArtistID;

-- Find artists who haven't released any albums yet.
SELECT Artists.Name
FROM Artists
LEFT JOIN Albums ON Artists.ArtistID = Albums.Artist
WHERE Albums.Artist IS NULL;

-- Find all songs longer than 5 minutes from albums released in the 1990s.
SELECT Songs.Title AS Songs
FROM Songs
WHERE (Songs.Duration > 5) AND (Songs.ReleaseDate < '1991-1-1' AND Songs.ReleaseDate > '1989-12-31');

-- Find playlists that contain more than 10 songs, along with the total duration.
SELECT 
Playlists.Name,
SUM(Songs.Duration) AS SongLength
FROM Playlists
JOIN PlaylistSongs ON Playlists.PlaylistID = PlaylistSongs.PlaylistID
JOIN Songs ON PlaylistSongs.SongID = Songs.SongID
GROUP BY Playlists.Name
HAVING COUNT(PlaylistSongs.SongID) > 10;