-- NEW YORK RESTAURANTS
-- TASK 1
SELECT *
FROM nomnom
LIMIT 5;

-- TASK 2
SELECT DISTINCT neighborhood 
FROM nomnom
LIMIT 5;

-- TASK 3
SELECT DISTINCT cuisine 
FROM nomnom
LIMIT 5;

-- TASK 4
SELECT *
FROM nomnom 
WHERE cuisine = 'Chinese'
LIMIT 5;

-- TASK 5
SELECT *
FROM nomnom
WHERE review >= 4
LIMIT 5;

-- TASK 6
SELECT *
FROM nomnom
WHERE cuisine = 'Italian'
AND price = '$$$';

-- TASK 7
SELECT *
FROM nomnom
WHERE name LIKE '%meatball%';

-- TASK 8
SELECT *
FROM nomnom
WHERE neighborhood IN ('Midtown', 'Downtown', 'Chinatown');

-- TASK 9
SELECT *
FROM nomnom 
WHERE health IS NULL;

-- TASK 10
SELECT *
FROM nomnom 
ORDER BY review DESC 
LIMIT 10;

-- TASK 11
SELECT *, CASE WHEN review > 4.5 THEN 'Extraordinary'
            WHEN review > 4 THEN 'Excellent'
            WHEN review > 3 THEN 'Good'
            WHEN review > 2 THEN 'Fair'
            ELSE 'Poor' END AS Standard
FROM nomnom;

