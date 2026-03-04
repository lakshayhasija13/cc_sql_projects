-- TASK 1
SELECT *
FROM transactions
LIMIT 5;

-- TASK 2
SELECT SUM(money_in)
FROM transactions;

-- TASK 3
SELECT SUM(money_out)
FROM transactions;

-- TASK 4
SELECT COUNT(money_in)
FROM transactions
WHERE currency = 'BIT';

-- TASK 5
SELECT MAX(money_in)
FROM transactions;
SELECT MAX(money_out)
FROM transactions;

-- TASK 6
SELECT AVG(money_in)
FROM transactions
WHERE currency = 'ETH';

-- TASK 7
SELECT date, 
   AVG(money_in), 
   AVG(money_out)
FROM transactions
GROUP BY date;

-- TASK 8
SELECT date AS 'Date', 
   ROUND(AVG(money_in), 2) AS 'Average Buy',
   ROUND(AVG(money_out), 2) AS 'Average Sell'
FROM transactions
GROUP BY date;

----------------END-------------------------------
