/* Exercises at https://sqlzoo.net/wiki/SELECT_basics */
/* 0 - SELECT Basics */
SELECT population FROM world
    WHERE name = 'Germany'

SELECT name, population FROM world
    WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world