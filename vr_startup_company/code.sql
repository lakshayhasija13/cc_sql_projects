-- TASK 1 : FETCH FIRST FEW ROWS FROM BOTH TABLES
SELECT *
FROM employees
LIMIT 5;
SELECT *
FROM projects
LIMIT 5;

-- TASK 2 : JOIN [SEE SCHEMA FOR 2 TABLES]
SELECT *
FROM employees
JOIN projects
ON employees.current_project = projects.project_id;

-- TASK 3 : EMPLOYEES WITH NO PROJECT
SELECT first_name, last_name
FROM employees
LEFT JOIN projects 
ON employees.current_project = projects.project_id
WHERE current_project IS NULL;

-- TASK 4 : PROJECTS WITH NO EMPLOYEES
SELECT project_name
FROM projects
WHERE project_id NOT IN (
  SELECT current_project 
  FROM employees
);

-- TASK 5 : PROJECT WITH MOST EMPLOYEES
SELECT project_name, COUNT(*) AS number_of_employees
FROM projects 
JOIN employees
ON employees.current_project = projects.project_id
WHERE current_project IS NOT NULL
GROUP BY project_name 
ORDER BY number_of_employees DESC
LIMIT 1;

-- TASK 6 : PROJECT WITH MULTIPLE EMPLOYEES
SELECT project_name 
FROM projects
WHERE project_id IN (
  SELECT current_project
  FROM employees
  WHERE employees.current_project IS NOT NULL
  GROUP BY current_project
  HAVING COUNT(employee_id) > 1
);

-- TASK 7 : DO WE HAVE ENOUGH DEVELOPERS IF EACH PROJECT NEEDS AT LEAST TWO DEVELOPERS ?
SELECT (COUNT(*) * 2) - (
  SELECT COUNT(*)
  FROM employees
  WHERE current_project IS NOT NULL
    AND position = 'Developer') AS 'Count'
FROM projects;

-- TASK 8 : MOST COMMON PERSONALITY
SELECT personality 
FROM employees
GROUP BY personality
ORDER BY COUNT(personality) DESC
LIMIT 1;

-- TASK 9 : PROJECTS WITH MOST COMMON PERSONALITY
SELECT project_name 
FROM projects
INNER JOIN employees 
  ON projects.project_id = employees.current_project
WHERE personality = (
   SELECT personality
   FROM employees
   GROUP BY personality
   ORDER BY COUNT(personality) DESC
   LIMIT 1);

-- TASK 10 : EMPLPYEES WITH MOST REPRESENTED PERSONALITY
SELECT last_name, first_name, personality, project_name
FROM employees
INNER JOIN projects 
  ON employees.current_project = projects.project_id
WHERE personality = (
   SELECT personality 
   FROM employees
   WHERE current_project IS NOT NULL
   GROUP BY personality
   ORDER BY COUNT(personality) DESC
   LIMIT 1);

