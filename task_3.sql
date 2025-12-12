select name as genre_name, count (distinct ag.artist_id) as artist_count
from genre g 
left join artistgenre ag on g.genre_id = ag.genre_id
group by g.name 
order by artist_count desc;

select count(distinct s.id) as track_count
from song s
join album a on s.album_id = a.album_id 
where a.release_year between 2019 and 2020;

select a.title as album_name, avg(s.duration) as avg_duration
from song s 
join album a on s.album_id = a.album_id 
group by a.album_id , a.title 
order by avg_duration; 

select ar.name as artist_name
from  artist ar
where ar.artist_id not in (
    select aa.artist_id
    from artistalbum a m aa
    join album al on aa.album_id = al.album_id
    where al.release_year = 2020
);

select distinct c.title as comp_title
from compilation c 
join trackcompilation tc on c.compilation_id = tc.compilation_id 
join song s on tc.trac_id = s.id 
join album a on s.album_id = a.album_id 
join artistalbum aa on a.album_id = aa.album_id 
join artist ar on aa.artist_id = ar.artist_id
where ar.name = 'Louna';

