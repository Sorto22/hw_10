SELECT name, duration
FROM track
WHERE duration = (SELECT max(duration) FROM track);

SELECT name
FROM track
WHERE duration >= 210;

SELECT title 
FROM compilation
WHERE (release_year BETWEEN 2018 AND 2020);

SELECT name 
FROM artist 
WHERE name NOT LIKE '% %';

SELECT name 
FROM track 
WHERE (name ILIKE '%my %' OR name ILIKE '%мой %'
  OR name ILIKE '% my %' OR name ILIKE '% мой %'
  OR name ILIKE '% my%' OR name ILIKE '% мой%'
  OR name ILIKE 'my' OR name ILIKE 'мой');
