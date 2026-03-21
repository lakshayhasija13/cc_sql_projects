-- TASK 1
SELECT * 
FROM state_climate
LIMIT 5;

-- TASK 2
SELECT state, year, tempc, AVG(tempc) OVER(PARTITION BY state ORDER BY year ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_avg_temp
FROM state_climate
LIMIT 5;

-- TASK 3
SELECT state, year, tempf, FIRST_VALUE(tempf) OVER(PARTITION BY state ORDER BY tempf ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS lowest_temp
FROM state_climate
LIMIT 5;

-- TASK 4
SELECT state, year, tempf, LAST_VALUE(tempf) OVER(PARTITION BY state ORDER BY tempf DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS highest_temp
FROM state_climate
LIMIT 5;

-- TASK 5
SELECT state, year, tempf, (tempf - LAG(tempf, 1, 0) OVER(PARTITION BY state ORDER BY year)) AS change_in_temp
FROM state_climate
ORDER BY change_in_temp DESC
LIMIT 5;

-- TASK 6
SELECT state, year, tempf, RANK() OVER(ORDER BY tempf) AS coldest_rank
FROM state_climate
LIMIT 5;

-- TASK 7
SELECT state, year, tempf, RANK() OVER(PARTITION BY state ORDER BY tempf DESC) AS warmest_rank
FROM state_climate
LIMIT 5;

-- TASK 8
SELECT NTILE(4) OVER(PARTITION BY state ORDER BY tempf) AS quartile, year, state, tempf
FROM state_climate 
LIMIT 5;

-- TASK 9
SELECT NTILE(5) OVER(ORDER BY tempf) AS quintile, year, state, tempf
FROM state_climate 
LIMIT 5;

-------END--------


