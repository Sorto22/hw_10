insert into artist (name) values
	('Louna'),
	('Artist2'),
	('Artist3'),
	('Artist4'),
	('Artist5'),
	('Artist6');

insert into genre (name) values
	('Rock'),
	('POP'),
	('Classic');

insert into artistgenre (artist_id, genre_id) values 
	(1, 1),
	(2, 1),
	(3, 1),
	(3, 2),
	(4, 3),
	(5, 2),
	(5, 3),
	(6, 1),
	(6, 3);

insert into album (title, release_year) values 
	('album_louna_1', 2000),
	('album_louna_2', 2005),
	('album_art2_1', 2010),
	('album_art_2', 2015),
	('album_art_6', 2020),
	('albmu_art_6', 2021),
	('album_art_6', 2022);

insert into song (name, date_year, album_id) values 
	('track_1', 2000, 1),
	('track_2', 1999, 1),
	('track_3', 2001, 2),
	('track_4', 2003, 2),
	('track_5', 2020, 6),
	('track_6', 2021, 5),
	('track_7', 2019, 7);

insert into compilation (title, release_year) values 
	('comp_1', 2021),
	('comp_2', 2022),
	('comp_3', 2023),
	('comp_4', 2024);

insert into trackcompilation (trac_id, compilation_id) values
	(1,1),
	(2,1),
	(3,2),
	(4,2),
	(5,3),
	(6,3),
	(7,3);

insert into artistalbum (artist_id, album_id) values 
	(1,2),
	(2,2),
	(3,3),
	(4,3);

update song 
	set duration =180
	where id =1;

update song 
	set duration =190
	where id =2;

update song 
	set duration =280
	where id =3;

update song 
	set duration =80
	where id =4;

update song 
	set duration =220
	where id =5;

update song 
	set duration =160
	where id =6;

update song 
	set duration =380
	where id =7;








