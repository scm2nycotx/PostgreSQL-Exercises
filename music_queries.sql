--1. What are tracks for a given album?
SELECT track.id AS track_id, album.title AS album_title, song.name AS song_name, album.id AS album_id FROM track INNER JOIN album ON track.album_id = album.id INNER JOIN song ON track.song_id = song.id WHERE album.id = 9
--2. What are the albums produced by a given artist?
SELECT album.id AS album_id, album.title AS album_title, artist.id AS artist_id, artist.name AS artist_name FROM album INNER JOIN artist ON album.artist_id = artist.id WHERE artist.id = 5
--3. What is the track with the longest duration?
SELECT track.id AS track_id, album.title AS album_title, song.name AS song_name, track.duration AS max_duration FROM track INNER JOIN album ON track.album_id = album.id INNER JOIN song ON track.song_id = song.id WHERE duration = (SELECT MAX(duration) FROM track) 
--4. What are the albums released in the 60s? 70s? 80s? 90s? 2015~2018?
SELECT album.title, album.release FROM album WHERE album.release < '1970-01-01' and album.release > '1959-12-31' 
SELECT album.title, album.release FROM album WHERE album.release < '1980-01-01' and album.release > '1969-12-31' 
SELECT album.title, album.release FROM album WHERE album.release < '1990-01-01' and album.release > '1979-12-31' 
SELECT album.title, album.release FROM album WHERE album.release < '2000-01-01' and album.release > '1989-12-31'
SELECT album.title, album.release FROM album WHERE album.release < '2019-01-01' and album.release > '2014-12-31' 
--5. How many albums did a given artist produce in the 90s? 2015~2018?
SELECT album.title, album.release FROM album INNER JOIN artist ON album.artist_id = artist.id WHERE artist.id = 2 and album.release < '2000-01-01' and album.release > '1989-12-31'
SELECT album.title, album.release FROM album INNER JOIN artist ON album.artist_id = artist.id WHERE artist.id = 2 and album.release < '2019-01-01' and album.release > '2014-12-31'
--6. What is each artist's latest album?
SELECT artist.id, artist.name, album.title, album.release AS latest_release FROM artist INNER JOIN album on artist.id = album.artist_id WHERE release IN (SELECT MAX(release) FROM album GROUP BY artist_id)
--7. List all albums along with its total duration based on summing the duration of its tracks.
SELECT album.id AS album_id, album.title, SUM(track.duration) AS total_duration FROM album INNER JOIN track on album.id = track.album_id GROUP BY album.id ORDER BY album.id
--8. What is the album with the longest duration?
-->SELECT track.album_id, MAX(track.total_duration) AS max_total_duration FROM (SELECT SUM(track.duration) AS total_duration FROM track GROUP BY album_id)
-->ERROR: pq: subquery in FROM must have an alias
--9. Who are the 5 most prolific artists based on the number of albums they have recorded?
SELECT artist.name, COUNT(album.id) AS album_qty FROM album INNER JOIN artist ON album.artist_id = artist.id GROUP BY album.artist_id, artist.name ORDER BY album_qty DESC LIMIT 5
--10. What are all the tracks a given artist has recorded?
SELECT artist.name, track.id AS track_id, song.name AS song_name, album.title AS album_title, track.duration FROM album 
INNER JOIN track ON track.album_id = album.id 
INNER JOIN artist ON artist.id = album.artist_id 
INNER JOIN song ON track.song_id = song.id WHERE artist.id = 5
--11. What are the top 5 most often recorded songs?
SELECT song.name, COUNT(song.id) AS song_frequency FROM song GROUP BY song.name ORDER BY song_frequency LIMIT 5
--12. Who are the top 5 song writers whose songs have been most often recorded?
SELECT song.song_writer_id, song_writer.name, COUNT(song.id) AS song_recorded_frequency FROM song INNER JOIN song_writer ON song.song_writer_id = song_writer.id GROUP BY song.song_writer_id, song_writer.name ORDER BY song_recorded_frequency LIMIT 5 
--13. Who is the most prolific song writer based on the number of songs he has written?
SELECT song.song_writer_id, song_writer.name, COUNT(song.id) AS song_recorded_frequency FROM song INNER JOIN song_writer ON song.song_writer_id = song_writer.id GROUP BY song.song_writer_id, song_writer.name ORDER BY song_recorded_frequency LIMIT 1 
--14. What songs has a given artist recorded?
SELECT artist.id AS artist_id, artist.name, song.name AS song_name FROM artist INNER JOIN album ON artist.id = album.artist_id INNER JOIN track ON album.id = track.album_id INNER JOIN song ON track.song_id = song.id WHERE artist.id = 2
--15. Who are the song writers whose songs a given artist has recorded?
SELECT artist.id AS artist_id, artist.name AS artist_name, song.name AS song_name, song_writer.name AS song_writer_name FROM artist 
INNER JOIN album ON artist.id = album.artist_id 
INNER JOIN track ON album.id = track.album_id 
INNER JOIN song ON track.song_id = song.id
INNER JOIN song_writer ON song.song_writer_id = song_writer.id WHERE artist.id = 3
--16. Who are the artists who have recorded a given song writer's songs?
SELECT song_writer.name AS song_writer_name, song.name AS song_name, artist.name AS artist_name FROM artist 
INNER JOIN album ON artist.id = album.artist_id 
INNER JOIN track ON album.id = track.album_id 
INNER JOIN song ON track.song_id = song.id
INNER JOIN song_writer ON song.song_writer_id = song_writer.id WHERE song_writer.id = 5

--Bonus Challenge 1
--Allow that an album may have multiple artists:
-->> a lead artist
-->> any number of collaborators
--Given a lead artist, what collaborators has he worked with? Hint: you can give the same table 2 different aliases. For example, a query to find all people you follow would look like `select from "user" as follower, "user" as followee where ...

--Super challenge: given an artist who has worked as a collaborator, who are the other collaborators he has worked with?

--Bonus Challenge 2
--Willie Nelson wishes to be able to search for music by musical instrument. For example:
-->> Get the list of tracks with a violin in it. (You can sub in your instrument of choice)
-->> Get the list of tracks with both a harmonica and an accordion. (Again, sub in your instruments of choice)
-->> Get the list of vocal tracks.
-->> Get the list of instrumental tracks (no vocal).
-->> Get a list of piano solo tracks (piano and no other instrument).
--Make his wish come true.



