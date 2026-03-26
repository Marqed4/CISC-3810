CREATE TABLE Albums
(
	AlbumID INT PRIMARY KEY,
	Title VARCHAR(255),
	Artist INT,
	ReleaseDate DATE,
	FOREIGN KEY (Artist) REFERENCES Artists(ArtistID)
);

CREATE TABLE Songs
(
	SongID INT PRIMARY KEY,
	Title VARCHAR(255),
	Artist INT,
	Albums INT,
	ReleaseDate DATE,
	FOREIGN KEY (Artist) REFERENCES Artists(ArtistID),
	FOREIGN KEY (Albums) REFERENCES Albums(AlbumID)
);

CREATE TABLE Playlists
(
	PlaylistID INT PRIMARY KEY,
	Name VARCHAR(255)
);

CREATE TABLE PlaylistSongs
(
    PlaylistID INT,
    SongID INT,
    PRIMARY KEY (PlaylistID, SongID),
    FOREIGN KEY (PlaylistID) REFERENCES Playlists(PlaylistID),
    FOREIGN KEY (SongID) REFERENCES Songs(SongID)
);