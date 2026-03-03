-- HACKER NEWS
-- TASK 1
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

-- TASK 2
SELECT SUM(score)
FROM hacker_news;

-- TASK 3
SELECT user, SUM(score)
FROM hacker_news 
GROUP BY user
HAVING SUM(score) > 200;

-- TASK 4
SELECT (1.0 + 2.0 + 3.0) / 6.0;

-- TASK 5
SELECT COUNT(*)
FROM hacker_news
WHERE url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';

-- TASK 6
SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source'
FROM hacker_news
GROUP BY 1;

-- TASK 7
SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source', COUNT(*)
FROM hacker_news
GROUP BY 1;

-- TASK 8
SELECT timestamp
FROM hacker_news
LIMIT 10;

-- TASK 9
SELECT timestamp,
   strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;

-- TASK 10
SELECT strftime('%H', timestamp), 
   AVG(score),
   COUNT(*)
FROM hacker_news
GROUP BY 1
ORDER BY 2 DESC;

-- TASK 11
-- What's the best time to post a story?

SELECT strftime('%H', timestamp) AS 'Hour', 
   ROUND(AVG(score), 1) AS 'Average Score', 
   COUNT(*) AS 'Number of Stories'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;



