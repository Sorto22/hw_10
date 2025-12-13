select name, duration
from track
where duration = (select max(duration) from song);

select name
from track
where duration >= 210;

select title 
from compilation
where (release_year between 2018 and 2020);

select name 
from artist 
where name not like '% %';

select name 
from track 
where name like '% my %' or name like '% мой %';
