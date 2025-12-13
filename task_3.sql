select name as genre_name, count (distinct ag.artist_id) as artist_count
from genre g 
left join artist_genre ag on g.genre_id = ag.genre_id
group by g.name 
order by artist_count desc;

select count(distinct s.track_id) as track_count
from track s
join album a on s.album_id = a.album_id 
where a.release_year between 2019 and 2020;

select a.title as album_name, avg(s.duration) as avg_duration
from track s 
join album a on s.album_id = a.album_id 
group by a.album_id , a.title 
order by avg_duration; 

select ar.name as artist_name
from  artist ar
where ar.artist_id not in (
    select aa.artist_id
    from artist_album aa
    join album al on aa.album_id = al.album_id
    where al.release_year = 2020
);

select distinct c.title as comp_title
from compilation c 
join track_compilation tc on c.compilation_id = tc.compilation_id 
join track s on tc.track_id = s.track_id  
join album a on s.album_id = a.album_id 
join artist_album aa on a.album_id = aa.album_id 
join artist ar on aa.artist_id = ar.artist_id
where ar.name = 'Louna';
