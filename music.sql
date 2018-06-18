CREATE TABLE artist (
  id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL
  );
  
CREATE TABLE song_writer (
  id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL
  );

CREATE TABLE song (
  id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL,
  song_writer_id INTEGER REFERENCES song_writer (id)
  );

CREATE TABLE album (
  id SERIAL PRIMARY KEY,
  title VARCHAR UNIQUE NOT NULL,
  release date,
  artist_id INTEGER REFERENCES artist (id)
  );

CREATE TABLE track (
  id SERIAL PRIMARY KEY,
  album_id INTEGER REFERENCES album (id),
  song_id INTEGER REFERENCES song (id),
  duration TIME
  );

INSERT INTO artist VALUES (DEFAULT, 'DRAKE'),
(DEFAULT, 'ED SHEERAN'),
(DEFAULT, 'KENDRICK LAMAR'),
(DEFAULT, 'BRUNO MARS'),
(DEFAULT, 'TAYLOR SWIFT')

INSERT INTO song_writer VALUES (DEFAULT, 'ANDY LIU'),
(DEFAULT, 'JACKY WU'),
(DEFAULT, 'LEON LI'),
(DEFAULT, 'AARON KUAO'),
(DEFAULT, 'CHIHMING SUN')

INSERT INTO album VALUES (DEFAULT, 'Scorpion', '2018-05-26', 1),
(DEFAULT, 'Views', '2016-02-03', 1),
(DEFAULT, 'Nothing Was the Same', '2013-04-07', 1),
(DEFAULT, '÷', '2017-11-12', 2),
(DEFAULT, 'x', '2014-05-05', 2),
(DEFAULT, '+', '2011-08-15', 2),
(DEFAULT, 'Damn', '2017-04-01', 3),
(DEFAULT, 'To Pimp a Butterfly', '2015-05-05', 3),
(DEFAULT, 'Good Kid, M.A.A.D City', '2012-03-15', 3),
(DEFAULT, '24K Magic', '2016-08-09', 4),
(DEFAULT, 'Unorthodox Jukebox', '2012-02-20', 4),
(DEFAULT, 'Doo-Wops & Hooligans', '2010-06-18', 4),
(DEFAULT, 'Reputation', '2017-01-12', 5),
(DEFAULT, '1989', '2014-10-11', 5),
(DEFAULT, 'Red', '2012-09-09', 5)

INSERT INTO song VALUES (DEFAULT, 'Nice for What', 1),
(DEFAULT, 'God"s plan', 2),
(DEFAULT, 'Keep the Family Close', 3),
(DEFAULT, 'g', 4),
(DEFAULT, 'Tuscan Leather', 5),
(DEFAULT, 'Furthest Thing', 5),
(DEFAULT, 'Eraser', 4),
(DEFAULT, 'Castle on the Hill', 3),
(DEFAULT, 'one', 2),
(DEFAULT, 'I am a Mess', 1),
(DEFAULT, 'The A Team', 1),
(DEFAULT, 'Drunk', 2),
(DEFAULT, 'Blood', 3),
(DEFAULT, 'DNA', 4),
(DEFAULT, 'Wesley"s Theory', 5),
(DEFAULT, 'For Free?', 5),
(DEFAULT, 'Sherane a.k.a Master Splinter"s Daughter', 4),
(DEFAULT, 'Bitch, Don"t Kill My Vibe', 3),
(DEFAULT, '24K Magic', 2),
(DEFAULT, 'Chunky', 1),
(DEFAULT, 'Young Girls', 1),
(DEFAULT, 'Locked Out of Heaven', 2),
(DEFAULT, 'Grenade', 3),
(DEFAULT, 'Just the Way You Are', 4),
(DEFAULT, '...Ready for It?', 5),
(DEFAULT, 'End Game', 5),
(DEFAULT, 'Welcome to New York', 4),
(DEFAULT, 'Blank Space', 3),
(DEFAULT, 'State of Grace', 2),
(DEFAULT, 'Red', 1)

INSERT INTO track VALUES (DEFAULT, 1, 1, '00:05:21'),
(DEFAULT, 1, 2, '00:04:11'),
(DEFAULT, 2, 3, '00:03:32'),
(DEFAULT, 2, 4, '00:04:22'),
(DEFAULT, 3, 5, '00:04:33'),
(DEFAULT, 3, 6, '00:05:16'),
(DEFAULT, 4, 7, '00:04:21'),
(DEFAULT, 4, 8, '00:04:22'),
(DEFAULT, 5, 9, '00:03:44'),
(DEFAULT, 5, 10, '00:05:11'),
(DEFAULT, 6, 11, '00:04:03'),
(DEFAULT, 6, 12, '00:03:59'),
(DEFAULT, 7, 13, '00:04:11'),
(DEFAULT, 7, 14, '00:03:55'),
(DEFAULT, 8, 15, '00:05:11'),
(DEFAULT, 8, 16, '00:04:09'),
(DEFAULT, 9, 17, '00:04:44'),
(DEFAULT, 9, 18, '00:05:10'),
(DEFAULT, 10, 19, '00:05:00'),
(DEFAULT, 10, 20, '00:04:27'),
(DEFAULT, 11, 21, '00:04:11'),
(DEFAULT, 11, 22, '00:02:22'),
(DEFAULT, 12, 23, '00:02:58'),
(DEFAULT, 12, 24, '00:04:34'),
(DEFAULT, 13, 25, '00:04:33'),
(DEFAULT, 13, 26, '00:04:12'),
(DEFAULT, 14, 27, '00:03:22'),
(DEFAULT, 14, 28, '00:04:11'),
(DEFAULT, 15, 29, '00:03:33'),
(DEFAULT, 15, 30, '00:03:16')

