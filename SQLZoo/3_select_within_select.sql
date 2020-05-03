/* Exercises at https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial */
/* 3 - SELECT within SELECT */
SELECT name FROM world
    WHERE population >
        (SELECT population FROM world
        WHERE name='Russia');

SELECT name FROM world
  WHERE continent = 'Europe' AND (gdp / population) > 
    (SELECT gdp/ population FROM world
     WHERE name = 'United Kingdom');

SELECT name, continent FROM world
  WHERE continent IN
    (SELECT DISTINCT continent FROM world
       WHERE name IN ('Argentina', 'Australia'))
  ORDER BY name;

SELECT name, population FROM world
  WHERE population >
   (SELECT population FROM world
      WHERE name = 'Canada')
  AND population < 
   (SELECT population FROM world
      WHERE name = 'Poland')

SELECT name, CONCAT(ROUND(population / 
  (SELECT population FROM world 
    WHERE name = 'Germany') * 100),'%') 
  FROM world
    WHERE continent = 'Europe';

SELECT name FROM world
  WHERE gdp > ALL(SELECT gdp FROM world
                    WHERE continent = 'Europe' AND gdp > 0);

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0);

SELECT continent, name FROM world x
  WHERE LOWER (name) <= ALL
    (SELECT LOWER(name) FROM world y
        WHERE y.continent=x.continent);