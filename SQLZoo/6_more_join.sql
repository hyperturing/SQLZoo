/* Exercises at https://sqlzoo.net/wiki/More_JOIN_operations */
/* 6 - More JOIN */
SELECT id, title FROM movie
 WHERE yr=1962;

SELECT yr FROM movie
  WHERE title = 'Citizen Kane';

SELECT id, title, yr FROM movie
  WHERE title LIKE 'Star Trek%'
  ORDER BY yr;

SELECT id FROM actor
  WHERE name = 'Glenn Close';

SELECT id FROM movie
  WHERE title = 'Casablanca';

SELECT name FROM actor
  JOIN casting ON casting.actorid = actor.id
  WHERE movieid = 11768;

SELECT name FROM actor
  JOIN casting ON casting.actorid = actor.id
  JOIN movie ON casting.movieid = movie.id
  WHERE title = 'Alien';

SELECT title FROM movie
  JOIN casting ON casting.movieid = movie.id
  JOIN actor ON casting.actorid = actor.id
  WHERE actor.name = 'Harrison Ford';

SELECT title FROM movie
  JOIN casting ON casting.movieid = movie.id
  JOIN actor ON casting.actorid = actor.id
  WHERE actor.name = 'Harrison Ford' AND ord != 1;

SELECT movie.title, actor.name FROM movie
  JOIN casting ON casting.movieid = movie.id
  JOIN actor ON casting.actorid = actor.id
  WHERE yr = 1962 AND casting.ord = 1;

SELECT yr, COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

SELECT DISTINCT movie.title, actor.name FROM movie
  JOIN casting ON movie.id=movieid
  JOIN actor ON actorid=actor.id
  WHERE movieid IN (
  SELECT movieid FROM casting
    WHERE actorid IN (
      SELECT id FROM actor
      WHERE name = 'Julie Andrews')) AND casting.ord = 1;

SELECT actor.name FROM actor
  WHERE actor.id IN (SELECT casting.actorid FROM casting
     WHERE casting.ord = 1
  GROUP BY casting.actorid
  HAVING count(casting.ord) >= 30);

SELECT movie.title, COUNT(casting.movieid) FROM movie
    JOIN casting ON casting.movieid = movie.id
    WHERE movie.yr = 1978
  GROUP BY movie.title
  ORDER BY  COUNT(casting.movieid) DESC, movie.title;

SELECT DISTINCT actor.name FROM actor
  JOIN casting ON casting.actorid = actor.id
  WHERE casting.movieid IN (SELECT casting.movieid FROM casting
    JOIN actor ON actor.id = casting.actorid
    WHERE actor.name = 'Art Garfunkel') AND actor.name != 'Art Garfunkel'