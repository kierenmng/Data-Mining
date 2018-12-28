--original song count
select count(*) from song_analysis;

--cleaned song count
select
count(*)
from song_analysis
where
key is not null
and tempo is not null
and mode is not null
and duration_ms is not null
and danceability is not null
and valence is not null
and energy is not null
and loudness is not null
and speechiness is not null
and instrumentalness is not null
and substr(rel_date,0,5) >= '1899'
and tempo != 0.0
and time_signature != 0
and liveness is not null
and duration_ms >= 60000;

--earliest song
select 
rel_date
from song_analysis
where
key is not null
and tempo is not null
and mode is not null
and duration_ms is not null
and danceability is not null
and valence is not null
and energy is not null
and loudness is not null
and speechiness is not null
and instrumentalness is not null
and substr(rel_date,0,5) >= '1899'
and tempo != 0.0
and time_signature != 0
and liveness is not null
and duration_ms >= 60000
order by rel_date
limit 1;

--most recent song
select 
rel_date
from song_analysis
where
key is not null
and tempo is not null
and mode is not null
and duration_ms is not null
and danceability is not null
and valence is not null
and energy is not null
and loudness is not null
and speechiness is not null
and instrumentalness is not null
and substr(rel_date,0,5) >= '1899'
and tempo != 0.0
and time_signature != 0
and liveness is not null
and duration_ms >= 60000
order by rel_date desc
limit 1;

--distinct artists
select
count(distinct artist)
from song_analysis
where
key is not null
and tempo is not null
and mode is not null
and duration_ms is not null
and danceability is not null
and valence is not null
and energy is not null
and loudness is not null
and speechiness is not null
and instrumentalness is not null
and substr(rel_date,0,5) >= '1899'
and tempo != 0.0
and time_signature != 0
and liveness is not null
and duration_ms >= 60000;

--song count by artist
select 
distinct artist,
count(distinct id)
from song_analysis
where
key is not null
and tempo is not null
and mode is not null
and duration_ms is not null
and danceability is not null
and valence is not null
and energy is not null
and loudness is not null
and speechiness is not null
and instrumentalness is not null
and substr(rel_date,0,5) >= '1899'
and tempo != 0.0
and time_signature != 0
and liveness is not null
and duration_ms >= 60000
group by artist
order by count(id) desc
limit 20;


--song count per year
select 
distinct
count(id),
cast(substr(rel_date,0,5) as int)
from song_analysis
where
key is not null
and tempo is not null
and mode is not null
and duration_ms is not null
and danceability is not null
and valence is not null
and energy is not null
and loudness is not null
and speechiness is not null
and instrumentalness is not null
and substr(rel_date,0,5) >= '1899'
and tempo != 0.0
and time_signature != 0
and liveness is not null
and duration_ms >= 60000
group by cast(substr(rel_date,0,5) as int);

--shortest song
select
duration_ms
from song_analysis
where duration_ms != 0
order by duration_ms asc
limit 1;

--longest song
select
id,
name,
artist,
duration_ms
from song_analysis
order by duration_ms desc
limit 1;

--what song has the highest speechiness
select
id,
name,
artist,
duration_ms,
speechiness
from song_analysis
order by speechiness desc
limit 1;

--most danceable
select
id,
name,
artist,
danceability
from song_analysis
order by danceability desc
limit 1;

--fastest song
select
id,
name,
artist,
tempo
from song_analysis
where tempo != 0.0
order by tempo desc
limit 1;
