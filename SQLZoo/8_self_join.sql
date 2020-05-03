/* Exercises at https://sqlzoo.net/wiki/Self_join */
/* 8 - Self JOIN */
SELECT COUNT(*) FROM stops;

SELECT id FROM stops
  WHERE  name = 'Craiglockhart';

SELECT id, name FROM stops
  WHERE id IN (SELECT stop FROM route
    WHERE num = '4' AND company = 'LRT');

SELECT company, num, COUNT(*) FROM route
  WHERE stop=149 OR stop=53
  GROUP BY company, num
  HAVING COUNT(*) = 2;

SELECT a.company, a.num, a.stop, b.stop
  FROM route a JOIN route b ON
    (a.company=b.company AND a.num=b.num)
  WHERE a.stop=53 AND b.stop=149;

SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON
    (a.company=b.company AND a.num=b.num)
      JOIN stops stopa ON (a.stop=stopa.id)
      JOIN stops stopb ON (b.stop=stopb.id)
  WHERE stopa.name='Craiglockhart' AND stopb.name='London Road';

SELECT a.company, a.num
  FROM route a JOIN route b ON
    (a.company=b.company AND a.num=b.num)
      JOIN stops stopa ON (a.stop=stopa.id)
      JOIN stops stopb ON (b.stop=stopb.id)
  WHERE stopa.name='Haymarket' AND stopb.name='Leith'
  GROUP BY a.num

SELECT a.company, a.num
  FROM route a JOIN route b ON
    (a.company=b.company AND a.num=b.num)
      JOIN stops stopa ON (a.stop=stopa.id)
      JOIN stops stopb ON (b.stop=stopb.id)
  WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross'
  GROUP BY a.num

SELECT stopb.name, a.company, a.num
  FROM route a JOIN route b ON
    (a.company=b.company AND a.num=b.num)
      JOIN stops stopa ON (a.stop=stopa.id)
      JOIN stops stopb ON (b.stop=stopb.id)
  WHERE stopa.name='Craiglockhart';