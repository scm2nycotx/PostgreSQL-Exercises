CREATE TABLE restaurant2 (
  id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL,
  address VARCHAR,
  catagory VARCHAR
  );

CREATE TABLE reviewer (
  id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL,
  email VARCHAR,
  karma INTEGER CHECK (karma >= 0 AND Karma <= 7)
  );

CREATE TABLE review (
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  review VARCHAR,
  stars INTEGER CHECK (stars >= 0 AND stars <= 5),
  reviewer_id INTEGER REFERENCES reviewer (id),
  restaurant_id INTEGER REFERENCES restaurant2 (id)
  );

INSERT INTO restaurant2 VALUES (DEFAULT, 'Moon Tower', '2773 Chapel Street, Houston, TX 77002', 'BBQ'),
(DEFAULT, 'Lupe Tortilla', '1751 Woodrow Way, Houston, TX 77006', 'Mexican'),
(DEFAULT, 'Yia Yia Marys', '2840 Werninger Street, Sugar Land, TX 77479', 'Mediterranean'),
(DEFAULT, 'Pappadeaux Seafood', '2030 Bird Spring Lane, Houston, TX 77479', 'American'),
(DEFAULT, 'Fogo de Chão', '3104 Shadowmar Drive, Katy, TX 77477', 'Brazilian'),
(DEFAULT, 'Regal Seafood House', '4340 Oakmound Drive, Houston, TX 77478', 'Chinese'),
(DEFAULT, 'Taste of Texas', '1082 Geneva Street, Houston, TX 77008', 'American'),
(DEFAULT, 'Yauatcha at Houston', '2572 Blackwell Street, Houston, TX 77009', 'Chinese'),
(DEFAULT, 'Pappas Bar-B-Q', '2624 Scheuvront Drive, Pear Land, TX 77499', 'American'),
(DEFAULT, 'Floyds Cajun Seafood', '1595 Lonely Oak Drive, Houston, TX 77577', 'Cajun/Louisiana'),
(DEFAULT, 'Mi Luna', '1391 Star Route, Houston, TX 77003', 'Spanish'),
(DEFAULT, 'Keepers', '3631 Happy Hollow Road, Houston, TX 77056', 'Japanese'),
(DEFAULT, 'Sugar Thai Fine Cuisine', '3967 Arbor Court, Sugar Land, TX 77479', 'Thai')

INSERT INTO reviewer VALUES (DEFAULT, 'Chih-Ming Sun', 'scm2nycotx@gmail.com', 6),
(DEFAULT, 'James C Sevilla', 'mikel1990@yahoo.com', 5),
(DEFAULT, 'Amy J Cook', 'amy_jerde1970@hotmail.com', 3),
(DEFAULT, 'Mary R Wise', 'asia2000@gmail.com', 2),
(DEFAULT, 'Glenn M Hill', 'rollin1970@yahoo.com', 1),
(DEFAULT, 'Jacqueline J Harman', 'cheyenne1987@yahoo.com', 4),
(DEFAULT, 'Anthony S Warren', 'veda1993@yahoo.com', 7)

INSERT INTO review VALUES (DEFAULT, '5 star food!', 'Dined in many times, and definite recommend!', 5, 7, 13),
(DEFAULT, 'Great good!', 'Yumy yumy, definite recommend!', 5, 1, 2),
(DEFAULT, 'Perfect food!', 'Perfect place to dine in and definite recommend!', 5, 2, 9),
(DEFAULT, 'Good and nice!', 'Nice good and nice service, will try again next time!', 4, 3, 7),
(DEFAULT, 'OK for food and service!', 'It is average, not too bad!', 3, 5, 11),
(DEFAULT, 'Too Expensive!', 'Too expensive and service is not good, not recommend!', 2, 4, 1),
(DEFAULT, 'Try to Avoid!', 'waiting time is too long and food is not fresh!', 1, 6, 3),
(DEFAULT, 'Never come again!', 'Too expensive, bad service, and food is not good!', 0, 3, 4),
(DEFAULT, 'Average!', 'It is ok for such price level!', 3, 2, 8),
(DEFAULT, 'Disappointed!', 'Food is not as good as what is said on web!', 2, 7, 5),
(DEFAULT, 'Good!', 'Delicious and affordable, definitely recommend!', 4, 5, 11),
(DEFAULT, 'Fantastic!', 'Great place for dine in with family and friends, definitely recommend!', 5, 7, 4),
(DEFAULT, 'Not Bad!', 'Food and service are so so, but it is not pricy!', 3, 6, 2),
(DEFAULT, 'It is ok', 'Nothing new and exciting!', 3, 3, 12),
(DEFAULT, 'Wonderful!', 'Teste is great and service is nice, highly recommend!', 4, 4, 5),
(DEFAULT, 'Never come again!', 'Expensive and nothing special, poor servie', 1, 6, 10),
(DEFAULT, 'No, No, No!', 'The worst food I have ever had!!', 0, 2, 8)
