-- Struktur TABLE for `user`
CREATE TABLE user (
    user_id int not null PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
);

-- Struktur TABLE for `singer`
CREATE TABLE singer (
    singer_id int not null PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
);

-- Struktur TABLE for `track`
CREATE TABLE track (
    track_id  int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title     varchar(255) NOT NULL,
    singer_id int NOT NULL,
    album_id  int NOT NULL,

    CONSTRAINT FK_SINGER_TRACK 
    FOREIGN KEY (singer_id) 
    REFERENCES singer (singer_id),

    CONSTRAINT FK_ALBUM_TRACK
    FOREIGN KEY (album_id) 
    REFERENCES album (album_id)
);

-- Struktur TABLE for `album`
CREATE TABLE album (
    album_id int not null PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    singer_id int not null,

    CONSTRAINT FK_SINGER_ALBUM
    FOREIGN KEY (singer_id)
    REFERENCES (singer_id)
);

-- Struktur TABLE for `playlist`
CREATE TABLE playlist (
    playlist_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tracks      int NULL,
    user_id     int NOT NULL,
    
    CONSTRAINT FK_USER_PLAYLIST
    FOREIGN KEY (user_id) 
    REFERENCES user (user_id)
);

-- CREATE TABLE "PLAYLIST-TRACK CONJUNCTION" --
CREATE TABLE playlist_track(
    id          int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    track_id    int NOT NULL,
    playlist_id int NOT NULL,

    CONSTRAINT FK_TRACK_CONJ
    FOREIGN KEY (track_id) 
    REFERENCES track (track_id),

    CONSTRAINT FK_PLAYLIST_CONJ
    FOREIGN KEY (playlist_id) 
    REFERENCES playlist (playlist_id)
);