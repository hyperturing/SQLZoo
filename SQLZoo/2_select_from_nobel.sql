/* Exercises at https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial */
/* 2 - SELECT Nobel Tutorial */
SELECT yr, subject, winner FROM nobel
    WHERE yr = 1950;

SELECT winner FROM nobel
    WHERE yr = 1962 AND subject = 'Literature';

SELECT yr, subject FROM nobel
    WHERE winner = 'Albert Einstein';

SELECT winner FROM nobel
    WHERE yr >= 2000 AND subject = 'Peace';

SELECT * FROM nobel
    WHERE yr BETWEEN 1980 AND 1989
    AND subject = 'Literature';

SELECT * FROM nobel
    WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter', 
                  'Barack Obama');

SELECT winner FROM nobel
    WHERE winner LIKE 'John%';

SELECT yr, subject, winner FROM nobel
    WHERE (yr =1980 AND subject = 'Physics') OR (yr = 1984 AND subject = 'Chemistry');

SELECT yr, subject, winner FROM nobel
    WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

SELECT yr, subject, winner FROM nobel
    WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004);

SELECT * FROM nobel
    WHERE winner = 'PETER GRÜNBERG';

SELECT * FROM nobel
    WHERE winner = 'EUGENE O''NEILL';

SELECT winner, yr, subject FROM nobel
    WHERE winner LIKE 'Sir%'
    ORDER BY yr DESC, subject;

SELECT winner, subject FROM nobel
  WHERE yr=1984
  ORDER BY subject IN ('Physics','Chemistry'), subject, winner;