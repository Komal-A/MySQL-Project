USE sql_store;
-- Command to see all the columns of table customers
SELECT *
FROM customers;

						-- Part-1   Task - 1 part(a)
-- This query selects specific columns from the 'customers' table and calculates a modified points value for each customer.
SELECT 
    last_name,
    first_name,
    points,
    (points * 10) + 100 AS modified_points
FROM
    customers;
    
						-- Task - 1 Part(b)
-- This Query Calculates a discount factor based on the points of customers.
-- The formula adds 10 to the points and then multiplies the result by 100 to calculate the discount factor.
-- The calculated discount factor is aliased as 'discount_factor' for readability.
SELECT 
    last_name,
    first_name,
    points,
    (points + 10) * 100 AS discount_factor
FROM
    customers;

						-- Task - 2 
-- This query selects the name and unit price of products from the 'products' table.
-- It also calculates a new price for each product by multiplying the unit price by 1.1 (increasing the price by 10%) and aliases it as 'new_price'.
SELECT 
    name, unit_price, unit_price * 1.1 AS new_price
FROM
    products;


						-- Task - 3
-- This query selects all columns from the 'customers' table.
-- It filters the results to only include rows where the birth date is after January 1, 1990.
SELECT 
    *
FROM
    customers
WHERE
    birth_date > '1990-01-01';
    
						-- Task - 4 
-- This query selects the name of the product from the 'products' table.
-- It orders the results based on the quantity in stock in descending order, meaning the product with the highest quantity in stock will be at the top.
-- It limits the result set to only one row, ensuring that only the product with the highest quantity in stock is returned.
SELECT 
    name
FROM 
    products
ORDER BY 
    quantity_in_stock DESC
LIMIT 
    1;
    
						-- Task - 5
-- This query selects the name of the product from the 'products' table.
-- It orders the results based on the unit price in descending order, meaning the product with the highest unit price will be at the top.
-- It limits the result set to only one row, ensuring that only the product with the highest unit price is returned.
 SELECT 
    name
FROM
    products
ORDER BY unit_price DESC
LIMIT 1;                   

						-- Task - 6    
-- This query selects the first name, last name, address, and birth date of customers from the 'customers' table.
-- It orders the results based on the birth date in ascending order, meaning the customer with the earliest birth date will be at the top.
-- It limits the result set to only one row, ensuring that only the customer with the earliest birth date is returned.

SELECT 
    first_name, last_name, address, birth_date
FROM
    customers
ORDER BY birth_date
LIMIT 1;

						-- PART-2    
USE world;
						-- Task - 1
-- This query counts the number of distinct districts (District) in the 'city' table where the district is labeled as 'USA'.                        
SELECT 
    COUNT(DISTINCT District) AS number_of_cities_in_USA
FROM
    city
WHERE
    District = 'USA';
    
						-- Task - 2
-- This query calculates the population and average life expectancy for the country with the country code 'ARG'.
SELECT 
    Population, AVG(LifeExpectancy) AS AVG_life_expectancy
FROM
    country
WHERE
    Code = 'ARG';


						-- Task - 3
-- This query selects the name and life expectancy of countries from the 'country' table.
-- It orders the results based on life expectancy in descending order, meaning the country with the highest life expectancy will be at the top.
-- It limits the result set to only one row, ensuring that only the country with the highest life expectancy is returned.
SELECT 
    Name, LifeExpectancy
FROM
    country
ORDER BY LifeExpectancy DESC
LIMIT 1;

						-- Task - 4
-- This query selects the names of cities from the 'city' table.
-- It filters the results to include only cities whose names start with the letter 'F'.
-- It limits the result set to a maximum of 25 rows.
SELECT 
    Name
FROM
    city
WHERE
    Name LIKE 'F%'
LIMIT 25;              

						-- Task - 5 
-- This query selects the ID, Name, and Population columns from the 'city' table. It retrieves data from the 'city' table.
-- It limits the result set to only the first 10 rows.
SELECT 
    ID, Name, Population
FROM
    city
LIMIT 10;

						-- Task - 6
-- This query selects the names of cities from the 'city' table. It filters the results to include only cities with a population greater than 2,000,000.
SELECT 
    Name
FROM
    city
WHERE
    Population > 2000000;  
    
						-- Task - 7
-- This query selects the names of cities from the 'city' table. It filters the results to include only cities whose names start with the letters 'Be'.
SELECT 
    Name
FROM
    city
WHERE
    Name LIKE 'Be%';  
    
						-- Task - 8
-- This query selects all columns from the 'city' table. It filters the results to include only cities with a population between 500,000 and 1,000,000 (inclusive).
SELECT 
    *
FROM
    city
WHERE
    Population BETWEEN '500000' AND '1000000';

						-- Task - 9
-- This query selects all columns from the 'city' table. It orders the results based on the population in ascending order, meaning the city with the smallest population will be at the top.
-- It limits the result set to only one row, ensuring that only the city with the smallest population is returned.

SELECT 
    *
FROM
    city
ORDER BY Population ASC
LIMIT 1; 

						-- Task - 10
-- This query selects all columns from the 'city' table. It retrieves data from the 'city' table. It orders the results based on the 'Name' column in ascending order.
SELECT *
FROM city
ORDER BY Name ASC;

						-- Task - 11
-- This query selects the 'Population' and 'Name' columns from the 'country' table. It retrieves data from the 'country' table.
-- It orders the results based on the 'Population' column in descending order, meaning the country with the largest population will be at the top.
-- It limits the result set to only one row, ensuring that only the country with the largest population is returned.
SELECT Population, Name
FROM country
ORDER BY Population DESC
LIMIT 1;

						-- OPTIONAL TASK 1
-- This query selects the name of the capital city of Spain (ESP) using a join.
-- It retrieves the capital city information from the 'city' table and country information from the 'country' table.
-- It joins the 'city' table with the 'country' table based on the city ID and the capital city ID.
-- The join condition ensures that the city ID matches the capital city ID of Spain.
-- The query then selects the name of the capital city.
-- Finally, it filters the results to include only the country with the country code 'ESP' (Spain).
SELECT city.Name AS Capital
FROM city
JOIN country ON city.ID = country.Capital
WHERE country.Code = 'ESP';

						-- OPTIONAL TASK 2
-- This query selects distinct languages spoken in the Caribbean region.
-- It retrieves language information from the 'countrylanguage' table and country information from the 'country' table.
-- It joins the 'country' table with the 'countrylanguage' table based on the country code.
-- The WHERE clause filters the results to include only countries in the Caribbean region.
-- The DISTINCT keyword ensures that each language is listed only once, eliminating duplicates.

SELECT DISTINCT cl.Language
FROM country c
JOIN countrylanguage cl ON c.Code = cl.CountryCode
WHERE c.Region = 'Caribbean';

						-- OPTIONAL Task 3
-- This query selects the names of cities from the 'city' table located in the Europe continent.
-- It uses a subquery to retrieve the country codes of countries in the Europe continent from the 'country' table.
-- The outer query then selects cities where the country code matches those retrieved from the subquery.
SELECT Name AS City
FROM city
WHERE CountryCode IN (
    SELECT Code
    FROM country
    WHERE Continent = 'Europe'
);
