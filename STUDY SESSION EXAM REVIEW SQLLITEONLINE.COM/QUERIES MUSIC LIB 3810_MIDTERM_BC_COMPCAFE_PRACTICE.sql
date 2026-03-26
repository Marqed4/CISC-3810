SELECT
Songs.Title AS SongName,
Albums.Title AS AlbumTitle,
Artists.Name AS artist
FROM Songs
JOIN Artists ON Songs.Artist = Artists.ArtistID
JOIN Albums on Songs.Albums = Albums.AlbumID;

SELECT
Artists.Name
FROM Artists
left join Albums ON Artists.ArtistID = Albums.Artist
WHERE Albums.Artist IS NULL;

SELECT
Songs.Title,
Songs.Duration,
Albums.ReleaseDate
FROM Songs
LEFT JOIN Albums ON Songs.Albums = Albums.AlbumID
WHERE Songs.Duration > 5.0 AND 
  Albums.ReleaseDate <= 1999-31-12 
  and Albums.ReleaseDate >= 1990-01-01;

SELECT 
Playlists.Name,
SUM(Songs.Duration) AS LENGTH_OF_SONGS
FROM Playlists
JOIN PlaylistSongs on Playlists.PlaylistID = PlaylistSongs.PlaylistID
join Songs ON PlaylistSongs.SongID = Songs.SongID
GROUP BY Playlists.Name
HAVING count(PlaylistSongs.SongID) > 10;