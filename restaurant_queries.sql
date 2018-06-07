--1. The names of the restaurants that you gave a 5 stars to
SELECT name FROM restaurant WHERE stars = 5;
--2. The favorite dishes of all 5-star restaurants
SELECT favorite_dish FROM restaurant WHERE stars = 5;
--3. The the id of a restaurant by a specific restaurant name, say 'Moon Tower'
SELECT id FROM restaurant WHERE name ILIKE '%oon Towe%';
--4. restaurants in the category of 'BBQ'
SELECT name FROM restaurant WHERE category = 'BBQ';
--5. restaurants that do take out
SELECT name FROM restaurant WHERE takeout = TRUE;
--6. restaurants that do take out and is in the category of 'BBQ'
SELECT name FROM restaurant WHERE takeout = TRUE AND category = 'BBQ';
--7. restaurants within 2 miles
SELECT name FROM restaurant WHERE distance <= 2;
--8. restaurants you haven't ate at in the last week
SELECT name FROM restaurant WHERE last_visit < '2018-05-01';
--9. restaurants you haven't ate at in the last week and has 5 stars
SELECT name FROM restaurant WHERE last_visit < '2018-05-01' AND stars = 5;

--Aggregation and Sorting Queries
--1. list restaurants by the closest distance.
SELECT name, distance FROM restaurant ORDER BY distance ASC;
--2. list the top 2 restaurants by distance.
SELECT name, distance FROM restaurant ORDER BY distance ASC LIMIT 2;
--3. list the top 2 restaurants by stars.
SELECT name, stars FROM restaurant ORDER BY stars DESC LIMIT 2;
--4. list the top 2 restaurants by stars where the distance is less than 2 miles.
SELECT name, stars, distance FROM restaurant WHERE distance < 2 ORDER BY stars DESC LIMIT 2 ;
--5. count the number of restaurants in the db.
SELECT COUNT(name) FROM restaurant;
--6. count the number of restaurants by category.
SELECT catagory, COUNT(name) FROM restaurant GROUP BY catagory
--7. get the average stars per restaurant by category.
SELECT catagory, AVG(stars) AS average_stars FROM restaurant GROUP BY catagory;
--8. get the max stars of a restaurant by category.
SELECT catagory, MAX(stars) AS max_stars FROM restaurant GROUP BY catagory;



