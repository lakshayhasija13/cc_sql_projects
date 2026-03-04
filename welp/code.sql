-- WELP PROJECT
-- TASK 1
SELECT * 
FROM places;
SELECT * 
FROM reviews;

-- TASK 2
SELECT *
FROM places
WHERE price_point = '$' OR price_point IS NULL;

-- TASK 3
SELECT *
FROM places
JOIN reviews
ON places.id = reviews.place_id;

-- TASK 4
SELECT *
FROM reviews
JOIN places
ON places.id = reviews.place_id
GROUP BY places.id
HAVING COUNT(*) >= 1;

-- TASK 5
SELECT name, average_rating, username, rating, review_date, note
FROM reviews
JOIN places
ON places.id = reviews.place_id;

-- TASK 6
SELECT name, average_rating, username, rating, review_date, note
FROM reviews
LEFT JOIN places
ON places.id = reviews.place_id;

-- TASK 7
SELECT places.id, places.name
FROM places
LEFT JOIN reviews
ON reviews.place_id = places.id
WHERE reviews.id IS NULL;

