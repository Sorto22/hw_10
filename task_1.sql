-- Создание таблицы жанров
CREATE TABLE IF NOT EXISTS genre (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Создание таблицы исполнителей
CREATE TABLE IF NOT EXISTS artist (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Связь между исполнителями и жанрами
CREATE TABLE IF NOT EXISTS artist_genre (
    artist_id INTEGER REFERENCES artist(artist_id),
    genre_id INTEGER REFERENCES genre(genre_id),
    PRIMARY KEY (artist_id, genre_id)
);

-- Создание таблицы альбомов
CREATE TABLE IF NOT EXISTS album (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INTEGER
);

-- Связь между исполнителями и альбомами
CREATE TABLE IF NOT EXISTS artist_album (
    artist_id INTEGER REFERENCES artist(artist_id),
    album_id INTEGER REFERENCES album(album_id),
    PRIMARY KEY (artist_id, album_id)
);

-- Создание таблицы треков
CREATE TABLE IF NOT EXISTS track (
    track_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    album_id INTEGER REFERENCES album(album_id)
);

-- Создание таблицы сборников
CREATE TABLE IF NOT EXISTS compilation (
    compilation_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INTEGER
);

-- Связь между треками и сборниками
CREATE TABLE IF NOT EXISTS track_compilation (
    track_id INTEGER REFERENCES track(track_id),
    compilation_id INTEGER REFERENCES compilation(compilation_id)
);

--добавление столбца с дительностью трека
ALTER TABLE track 
	ADD COLUMN duration INTEGER NOT NULL 
	DEFAULT 0;

INSERT INTO artist (name) VALUES
	('Louna'),
	('Artist2'),
	('Artist3'),
	('Artist4'),
	('Artist5'),
	('Artist6');

INSERT INTO genre (name) VALUES
	('Rock'),
	('POP'),
	('Classic');

INSERT INTO artistgenre (artist_id, genre_id) VALUES 
	(1, 1),
	(2, 1),
	(3, 1),
	(3, 2),
	(4, 3),
	(5, 2),
	(5, 3),
	(6, 1),
	(6, 3);

INSERT INTO album (title, release_year) VALUES 
	('album_louna_1', 2000),
	('album_louna_2', 2005),
	('album_art2_1', 2010),
	('album_art_2', 2015),
	('album_art_6', 2020),
	('albmu_art_6', 2021),
	('album_art_6', 2022);

INSERT INTO song (name, date_year, album_id) VALUES 
	('track_1', 2000, 1),
	('track_2', 1999, 1),
	('track_3', 2001, 2),
	('track_4', 2003, 2),
	('track_5', 2020, 6),
	('track_6', 2021, 5),
	('track_7', 2019, 7);

INSERT INTO compilation (title, release_year) VALUES 
	('comp_1', 2021),
	('comp_2', 2022),
	('comp_3', 2023),
	('comp_4', 2024);

INSERT INTO trackcompilation (trac_id, compilation_id) VALUES
	(1,1),
	(2,1),
	(3,2),
	(4,2),
	(5,3),
	(6,3),
	(7,3);

INSERT INTO artistalbum (artist_id, album_id) VALUES 
	(1,2),
	(2,2),
	(3,3),
	(4,3);

UPDATE song 
	SET duration =180
	WHERE id =1;

UPDATE song 
	SET duration =190
	WHERE id =2;

UPDATE song 
	SET duration =280
	WHERE id =3;

UPDATE song 
	SET duration =80
	WHERE id =4;

UPDATE song 
	SET duration =220
	WHERE id =5;

UPDATE song 
	SET duration =160
	WHERE id =6;

UPDATE song 
	SET duration =380
	WHERE id =7;














