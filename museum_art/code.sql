 -- TASK 1
 SELECT *
FROM met
LIMIT 10;

-- TASK 2
SELECT *
FROM met
LIMIT 10;

-- TASK 3
SELECT COUNT(*)
FROM met
WHERE category LIKE '%celery%';

-- TASK 4
SELECT date, title, medium
FROM met
WHERE date LIKE '%1600%';

-- TASK 5
SELECT country, COUNT(*)
FROM met
WHERE country IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- TASK 6
SELECT category, COUNT(*)
FROM met
GROUP BY 1
HAVING COUNT(*) > 100;

-- TASK 7
SELECT CASE
   WHEN medium LIKE '%gold%'   THEN 'Gold'
   WHEN medium LIKE '%silver%' THEN 'Silver'
   ELSE NULL
  END AS 'Bling',
  COUNT(*)
FROM met
WHERE Bling IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;

-------------END-------------------




