CREATE TABLE restaurant (
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL,
  distance NUMERIC(3, 1) CHECK (distance >= 0),
  stars NUMERIC(3,1) CHECK (stars >= 0),
  catagory VARCHAR,
  favorite_dish VARCHAR,
  takeout BOOLEAN,
  last_visit DATE
  );
INSERT INTO restaurant VALUES (DEFAULT, 'Moon Tower', 3, 5, 'BBQ', 'Hamburger', TRUE, '2017-09-24'),
(DEFAULT, 'Lupe Tortilla', 5, 4.5, 'Mexican', 'Sizzling Beef Fajitas', FALSE, '2018-05-05'),
(DEFAULT, 'Yia Yia Marys', 20, 5, 'Mediterranean', 'Jumbo Sea Scallops', FALSE, '2017-11-22'),
(DEFAULT, 'Pappadeaux Seafood', 10, 4.4, 'American', 'Alaskan Halibut Piccata', TRUE, '2018-01-01'),
(DEFAULT, 'Fogo de Chão', 15, 4, 'Brazilian', 'Steak', TRUE, '2018-02-02'),
(DEFAULT, 'Regal Seafood House', 11.8, 4.1, 'Chinese', 'Seafood', FALSE, '2016-11-11'),
(DEFAULT, 'Taste of Texas', 25, 3.9, 'American', 'Steak', FALSE, '2015-10-23'),
(DEFAULT, 'Yauatcha at Houston', 15, 3.8, 'Chinese', 'Dim Sum', TRUE, '2018-01-01'),
(DEFAULT, 'Pappas Bar-B-Q', 12.3, 4.2, 'American', 'Bar-B-Q', FALSE, '2017-05-30'),
(DEFAULT, 'Floyds Cajun Seafood', 4.8, 3.7, 'Cajun/Louisiana', 'Crawfish Etouffée', TRUE, '2018-02-21'),
(DEFAULT, 'Mi Luna', 18, 4.1, 'Spanish', 'Pinchos De Camarones', FALSE, '2017-12-09'),
(DEFAULT, 'Keepers', 3, 5, 'Japanese', 'Beef Fried Rice', TRUE, '2018-06-02'),
(DEFAULT, 'Sugar Thai Fine Cuisine', 3, 4.1, 'Thai', 'Massamun Curry Beef', FALSE, '2016-07-02')
