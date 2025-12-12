select name, duration
from song
where duration = (select max(duration) from song);

select name
from song
where duration <= 210;

select title 
from compilation
where (release_year between 2018 and 2020);

select name 
from artist 
where name not like '% %';

select name 
from song 
where name like '%my%' or name like '%мой%';
