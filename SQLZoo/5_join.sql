/* Exercises at https://sqlzoo.net/wiki/The_JOIN_operation */
/* 5 - JOIN */
SELECT matchid, player FROM goal 
    WHERE teamid = 'GER';

SELECT id,stadium,team1,team2 FROM game
  WHERE id = 1012;

SELECT player, teamid, stadium, mdate FROM game 
  JOIN goal ON (game.id=goal.matchid)
  WHERE goal.teamid = 'GER'

SELECT team1, team2, player FROM game
  JOIN goal ON (game.id = goal.matchid)
  WHERE player LIKE 'Mario%'

SELECT player, teamid, coach, gtime FROM goal
  JOIN eteam ON goal.teamid = eteam.id
  WHERE gtime<=10;

SELECT mdate, teamname FROM game
  JOIN eteam ON game.team1 = eteam.id
  WHERE eteam.coach = 'Fernando Santos';

SELECT player FROM game
  JOIN goal ON goal.matchid = game.id
  WHERE game.stadium = 'National Stadium, Warsaw';

SELECT DISTINCT player
  FROM game JOIN goal ON goal.matchid =game. id 
  WHERE teamid != 'GER' AND (team2 = 'GER' OR team1 = 'GER');

SELECT DISTINCT teamname, COUNT(*) FROM eteam 
  JOIN goal ON id=teamid
  GROUP BY teamname

SELECT stadium, COUNT(*) FROM goal
  JOIN game ON game.id = goal.matchid
  GROUP BY stadium

SELECT matchid, mdate, COUNT(matchid) FROM goal
  JOIN game ON goal.matchid = game.id
  WHERE (team1 = 'POL' OR team2 = 'POL')
  GROUP BY matchid;

SELECT matchid, mdate, COUNT(teamid) FROM goal
  JOIN game ON goal.matchid = game.id
  WHERE (teamid = 'GER')
  GROUP BY matchid