CREATE TABLE album (
  id SERIAL PRIMARY KEY,
  title VARCHAR UNIQUE NOT NULL,
  artist VARCHAR,
  release date,
  leading_artist_id INTEGER REFERENCES artist (id)
  label VARCHAR
  );

CREATE TABLE track (
  id SERIAL PRIMARY KEY,
  album_id INTEGER REFERENCES album (id),
  song_id INTEGER REFERENCES song (id),
  song VARCHAR,
  duration time,
  );

CREATE TABLE artist (
  id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL,
  );
  
CREATE TABLE song (
  id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL,
  song_writer_id INTEGER REFERENCES song_writer (id),
  );

CREATE TABLE song_writer (
  id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL,
  );