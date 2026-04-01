-- TASK 1
SELECT *
FROM stream
LIMIT 5;
SELECT *
FROM chat
LIMIT 5;

-- TASK 2
SELECT DISTINCT game 
FROM stream;

-- TASK 3
SELECT DISTINCT channel
FROM stream;

-- TASK 4
SELECT game, COUNT(*) AS viewers
FROM stream
GROUP BY game;

-- TASK 5
SELECT country, COUNT(*) AS number_of_LoL
FROM stream
WHERE game = 'League of Legends'
GROUP BY country;

-- TASK 6
SELECT player, COUNT(*) AS streamers
FROM stream
GROUP BY player;

-- TASK 7
SELECT game, 
       CASE WHEN game IN ('League of Legends','Dota 2', 'Heroes of the Storm') THEN 'MOBA'
       WHEN game IN ('Counter-Strike: Global Offensive') THEN 'FPS'
       WHEN game IN ('DayZ', 'ARK: Survival Evolved') THEN 'Survival'
       ELSE 'Other' END AS genre,
       COUNT(*) AS Streamers
FROM stream
GROUP BY game 
ORDER BY game;

-- TASK 8
SELECT time,
   strftime('%S', time)
FROM stream
GROUP BY 1
LIMIT 20;


-- TASK 9
SELECT strftime('%H', time) AS hour,
       COUNT(*) AS view_count
FROM stream
WHERE country = 'US'
GROUP BY 1
LIMIT 20;

-- TASK 10
SELECT *
FROM stream
JOIN chat
USING (device_id);
-------------------------
