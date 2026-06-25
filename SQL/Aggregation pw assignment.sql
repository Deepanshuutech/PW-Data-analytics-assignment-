--      AGGREGATION IN SQL — ASSIGNMENT SOLUTION

USE world;

-- Q1: Count how many cities are there in each country?
-- ANS 1

SELECT
    co.Name          AS CountryName,
    COUNT(ci.ID)     AS TotalCities
FROM country co
INNER JOIN city ci
    ON co.Code = ci.CountryCode
GROUP BY co.Code, co.Name
ORDER BY TotalCities DESC;

-- Q2: Display all continents having more than 30 countries.
-- ANS 2

SELECT
    Continent,
    COUNT(*) AS NumberOfCountries
FROM country
GROUP BY Continent
HAVING COUNT(*) > 30
ORDER BY NumberOfCountries DESC;

-- Q3: List regions whose total population exceeds 200 million.
-- ANS 3

SELECT
    Region,
    SUM(Population) AS TotalPopulation
FROM country
GROUP BY Region
HAVING SUM(Population) > 200000000
ORDER BY TotalPopulation DESC;

-- Q4: Find the top 5 continents by average GNP per country.
-- ANS 4

SELECT
    Continent,
    ROUND(AVG(GNP), 2) AS AvgGNP
FROM country
WHERE GNP IS NOT NULL
GROUP BY Continent
ORDER BY AvgGNP DESC
LIMIT 5;

-- Q5: Find the total number of official languages spoken
--     in each continent.
-- ANS 5

SELECT
    co.Continent,
    COUNT(DISTINCT cl.Language) AS OfficialLanguages
FROM country co
INNER JOIN countrylanguage cl
    ON co.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY co.Continent
ORDER BY OfficialLanguages DESC;

-- Q6: Find the maximum and minimum GNP for each continent.
-- ANS 6 

SELECT
    Continent,
    MAX(GNP) AS MaxGNP,
    MIN(GNP) AS MinGNP
FROM country
GROUP BY Continent
ORDER BY MaxGNP DESC;

-- Q7: Find the country with the highest average city population.
-- ANS 7 

SELECT
    co.Name                          AS CountryName,
    ROUND(AVG(ci.Population), 0)     AS AvgCityPopulation
FROM country co
INNER JOIN city ci
    ON co.Code = ci.CountryCode
GROUP BY co.Code, co.Name
ORDER BY AvgCityPopulation DESC
LIMIT 1;

-- Q8: List continents where the average city population
--     is greater than 200,000.
-- ANS 8 

SELECT
    co.Continent,
    ROUND(AVG(ci.Population), 0) AS AvgCityPopulation
FROM country co
INNER JOIN city ci
    ON co.Code = ci.CountryCode
GROUP BY co.Continent
HAVING AVG(ci.Population) > 200000
ORDER BY AvgCityPopulation DESC;

-- Q9: Find the total population and average life expectancy
--     for each continent, ordered by avg life expectancy DESC.
-- ANS 9

SELECT
    Continent,
    SUM(Population)                      AS TotalPopulation,
    ROUND(AVG(LifeExpectancy), 2)        AS AvgLifeExpectancy
FROM country
GROUP BY Continent
ORDER BY AvgLifeExpectancy DESC;

-- Q10: Find the top 3 continents with the highest average life
--      expectancy, but only where total population > 200 million.
-- ANS 10

SELECT
    Continent,
    SUM(Population)               AS TotalPopulation,
    ROUND(AVG(LifeExpectancy), 2) AS AvgLifeExpectancy
FROM country
GROUP BY Continent
HAVING SUM(Population) > 200000000
   AND AVG(LifeExpectancy) IS NOT NULL
ORDER BY AvgLifeExpectancy DESC
LIMIT 3;

