--1. List all the reviews for a given restaurant given a specific restaurant ID.
SELECT restaurant2.id, restaurant2.name, review.title AS review_title, review.stars AS review_stars, review.review FROM restaurant2 INNER JOIN review ON restaurant2.id = review.restaurant_id WHERE restaurant2.id = 2 ORDER BY restaurant2.id;
--2. List all the reviews for a given restaurant, given a specific restaurant name.
SELECT restaurant2.name, review.title AS review_title, review.stars AS review_stars, review.review FROM restaurant2 INNER JOIN review ON restaurant2.id = review.restaurant_id WHERE restaurant2.name = 'Mi Luna' ORDER BY restaurant2.id;
--3. List all the reviews for a given reviewer, given a specific author name.
SELECT reviewer.name, review.title AS review_title, review.stars AS review_stars, review.review FROM reviewer INNER JOIN review ON reviewer.id = review.reviewer_id WHERE reviewer.name = 'Chih-Ming Sun';
--4. List all the reviews along with the restaurant they were written for. In the query result, select the restaurant name and the review text.
SELECT restaurant2.name, review.title AS review_title, review.stars AS review_stars, review.review FROM restaurant2 INNER JOIN review ON restaurant2.id = review.restaurant_id ORDER BY restaurant2.id;
--5. Get the average stars by restaurant. The result should have the restaurant name and its average star rating.
SELECT restaurant2.id, restaurant2.name, ROUND(AVG(review.stars), 1) AS average_stars FROM restaurant2 INNER JOIN review ON restaurant2.id = review.restaurant_id GROUP BY restaurant2.id ORDER BY id;
--6. Get the number of reviews written for each restaurant. The result should have the restaurant name and its review count.
SELECT restaurant2.name, COUNT(review.review) AS review_count FROM restaurant2 INNER JOIN review ON restaurant2.id = review.restaurant_id GROUP BY restaurant2.name ORDER BY name;
--7. List all the reviews along with the restaurant, and the reviewer's name. The result should have the restaurant name, the review text, and the reviewer name. 
--   Hint: you will need to do a three-way join - i.e. joining all three tables together.
SELECT restaurant2.id, restaurant2.name AS restaurant_name, review.stars AS review_stars, review.review, reviewer.name AS reviewer_name FROM review INNER JOIN restaurant2 ON restaurant2.id = review.restaurant_id INNER JOIN reviewer ON reviewer.id = review.reviewer_id ORDER BY restaurant2.id;
--8. Get the average stars given by each reviewer. (reviewer name, average star rating)
SELECT reviewer.id, reviewer.name, ROUND(AVG(review.stars), 1) AS average_stars FROM reviewer INNER JOIN review ON reviewer.id = review.reviewer_id GROUP BY reviewer.id ORDER BY reviewer.id;
--9. Get the lowest star rating given by each reviewer. (reviewer name, lowest star rating)
SELECT reviewer.id, reviewer.name, MIN(review.stars) AS lowest_stars FROM reviewer INNER JOIN review ON reviewer.id = review.reviewer_id GROUP BY reviewer.id ORDER BY reviewer.id;
--10. Get the number of restaurants in each category. (category name, restaurant count)
SELECT catagory, COUNT(name) AS restaurant_count FROM restaurant2 GROUP BY catagory ORDER BY catagory;
--11. Get number of 5 star reviews given by restaurant. (restaurant name, 5-star count)
SELECT restaurant2.id, restaurant2.name, COUNT(review.stars) AS five_star_count FROM restaurant2 INNER JOIN review ON restaurant2.id = review.restaurant_id WHERE review.stars = 5 GROUP BY restaurant2.id ORDER BY restaurant2.id;
--12. Get the average star rating for a food category. (category name, average star rating)
SELECT catagory, ROUND(AVG(review.stars), 1) AS average_stars FROM restaurant2 INNER JOIN review ON restaurant2.id = review.restaurant_id GROUP BY restaurant2.catagory ORDER BY restaurant2.catagory;
