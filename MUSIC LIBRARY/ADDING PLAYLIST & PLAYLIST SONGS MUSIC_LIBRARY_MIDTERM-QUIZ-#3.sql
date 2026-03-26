USE [3180_Midterm_Review];
GO

CREATE TABLE Playlists
(
	PlaylistID INT IDENTITY(1,1) PRIMARY KEY,
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