select
--id,
--name,
--artist,
cast(substr(rel_date,0,5) as int) as rel_year,
case when (substr(rel_date,0,5) < '1910') then '1900s'
	when (substr(rel_date,0,5) >= '1910' and substr(rel_date,0,5) < '1920') then '1910s'
	when (substr(rel_date,0,5) >= '1920' and substr(rel_date,0,5) < '1930') then '1920s'
	when (substr(rel_date,0,5) >= '1930' and substr(rel_date,0,5) < '1940') then '1930s'
	when (substr(rel_date,0,5) >= '1940' and substr(rel_date,0,5) < '1950') then '1940s'
	when (substr(rel_date,0,5) >= '1950' and substr(rel_date,0,5) < '1960') then '1950s'
	when (substr(rel_date,0,5) >= '1960' and substr(rel_date,0,5) < '1970') then '1960s'
	when (substr(rel_date,0,5) >= '1970' and substr(rel_date,0,5) < '1980') then '1970s'
	when (substr(rel_date,0,5) >= '1980' and substr(rel_date,0,5) < '1990') then '1980s'
	when (substr(rel_date,0,5) >= '1990' and substr(rel_date,0,5) < '2000') then '1990s'
	when (substr(rel_date,0,5) >= '2000' and substr(rel_date,0,5) < '2010') then '2000s'
	when (substr(rel_date,0,5) >= '2010' and substr(rel_date,0,5) < '2020') then '2010s'
	end dateClass,
explicit,
case when (explicit = 0) then 'clean'
	when (explicit = 1) then 'explicit'
	end explicitClass,
"time signature: " || (time_signature) as time_signature,
key,
case when (key = -1) then 'No key'
	when (key = 0) then 'C'
	when (key = 1) then 'C sharp/D flat'
	when (key = 2) then 'D'
	when (key = 3) then 'D sharp/E flat'
	when (key = 4) then 'E'
	when (key = 5) then 'F'
	when (key = 6) then 'F sharp/G flat'
	when (key = 7) then 'G'
	when (key = 8) then 'G sharp/A flat'
	when (key = 9) then 'A'
	when (key = 10) then 'A sharp/B flat'
	when (key = 11) then 'B'
	end keyClass,
tempo,
case when (tempo <= 50) then 'very slow'
	when (tempo > 50 and tempo <= 100) then 'slow'
	when (tempo > 100 and tempo <= 150) then 'moderate'
	when (tempo > 150 and tempo <= 200) then 'fast'
	when (tempo > 200 and tempo <= 250) then 'very fast'
	end tempoClass,
mode,
case when (mode = 0) then 'minor'
	when (mode = 1) then 'major'
	end modeClass,
duration_ms,
case when (duration_ms <= 120000) then 'very short'
	when (duration_ms > 120000 and duration_ms <= 180000) then 'short'
	when (duration_ms > 180000 and duration_ms <= 240000) then 'medium'
	when (duration_ms > 240000 and duration_ms <= 300000) then 'long'
	when (duration_ms > 300000) then 'very long'
	end durationClass,
danceability,
case when (danceability <= 0.25) then 'low danceability'
	when (danceability > 0.25 and danceability <= 0.50) then 'low/moderate danceability'
	when (danceability > 0.50 and danceability <= 0.75) then 'moderate/high danceability'
	when (danceability > 0.75) then 'high danceability'
	end danceabilityClass,
valence,
case when (valence <= 0.25) then 'low valence'
	when (valence > 0.25 and valence <= 0.50) then 'low/moderate valence'
	when (valence > 0.50 and valence <= 0.75) then 'moderate/high valence'
	when (valence > 0.75) then 'high valence'
	end valenceClass,
energy,
case when (energy <= 0.25) then 'low energy'
	when (energy > 0.25 and energy <= 0.50) then 'low/moderate energy'
	when (energy > 0.50 and energy <= 0.75) then 'moderate/high energy'
	when (energy > 0.75) then 'high energy'
	end energyClass,
loudness,
case when (loudness < -45 ) then 'very quiet'
	when (loudness > -45 and loudness <= -30) then 'quiet'
	when (loudness > -30 and loudness <= -15) then 'moderate'
	when (loudness > -15 and loudness <= 0) then 'loud'
	when (loudness > 0 and loudness <= 15) then 'very loud'
	end loudnessClass,
speechiness,
case when (speechiness <= 0.33) then 'just music'
	when (speechiness > 0.33 and speechiness <= 0.66) then 'both music and speech'
	when (speechiness > 0.66) then 'just speech'
	end speechinessClass,
acousticness,
case when (acousticness <= 0.25) then 'low acousticness'
	when (acousticness > 0.25 and acousticness <= 0.50) then 'low/moderate acousticness'
	when (acousticness > 0.50 and acousticness <= 0.75) then 'moderate/high acousticness'
	when (acousticness > 0.75) then 'high acousticness'
	end acousticnessClass,
instrumentalness,
case when (instrumentalness <= 0.25) then 'less instrumental'
	when (instrumentalness > 0.25 and instrumentalness <= 0.75) then 'moderate instrumentalness'
	when (instrumentalness > 0.75) then 'more instrumental'
	end instrumentalnessClass,
liveness,
case when (liveness <= 0.33) then 'studio recording'
	when (liveness > 0.33 and liveness <= 0.66) then 'moderate liveness'
	when (liveness > 0.66) then 'live recording'
	end livenessClass
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
order by id
limit 5;