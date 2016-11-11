
/*  Ex join-1

SELECT * from player;

SELECT * from team;

SELECT * from batting;

SELECT * from roster;

SELECT team.ID
, team.teamName
, batting.teamID
, batting.Rank
, batting.battingAvg
from team
Inner Join batting ON team.ID = batting.teamID;

*/
/*
Ex 2

SELECT team.ID
, team.teamName
, batting.teamID
, batting.Rank
, batting.battingAvg
from team
Inner Join batting ON team.ID = batting.teamID where batting.battingAvg = 321;

*/


/*
SELECT player.LastName
FROM player
inner join roster on player.id = roster.playerId;
 */

 /*
 Select player.LastName
 from  player
 Inner Join roster on player.id = roster.playerID
 Inner Join team on roster.teamID = team.ID
 where team.teamName = 'Boston Red Sox';
*/

 /*
 SELECT * FROM vteamRoster;
 DESCRIBE vteamRoster;
 SHOW CREATE VIEW vteamRoster;
 */


/* EX join-2

use baseball;
SELECT *
FROM player
left join batting on player.id = batting.playerId;

*/
/*
use baseball;
SELECT *
FROM team
left join roster on teamID = roster.teamId;
*/
/*
Select p.ID, p.LastName, b.ID, b.playerID, b.Hits
FROM player p left join batting b ON b.playerID =p.ID;
*/


/*
use baseball;
SELECT player.LastName
, player.FirstName
, roster.playerID
, team.teamName
, team.DivisionName
from player
Inner join roster on player.ID = roster.playerID
inner join team on roster.teamID = team.ID
where team.DivisionName = "NL EAST"
;

*/
/*
use baseball;
SELECT player.LastName
, player.FirstName
, roster.playerID
, team.teamName
, team.DivisionName
from player
Inner join roster on player.ID = roster.playerID
inner join team on roster.teamID = team.ID
where team.DivisionName = "NL CENTRAL"
;
*/

/* ex.3

select ID, LastName, FirstName, Birthdate
From player
Order by LastName;
*/
/*
select playerID, playerName, League, DivisionName
, TeamName, HeightInches
From vteamRoster
ORDER BY League, DivisionName, TeamName, HeightInches DESC;
*/
/*
select
 battingAvg
, batting.ID
, team.teamName
FROM team join batting on team.ID = batting.teamID order by battingAvg desc;
;
*/
/*  group by clause ex
select teamName as "TEAM NAME",
AVG(batting.battingAVG) as
"Batting Leaders AVG"
from team inner join batting on team.id =batting.teamID
group by teamName order by "Batting Leaders AVG"
;
*/
/*select count(team.ID) as battingleadercount, team.teamName
from team
inner join batting on team.id = batting.teamID
group by team.teamName
having battingleadercount > 1
order by battingleadercount desc
;
*/
/*

select team.League, AVG(batting.runs)
from team inner join  batting on team.ID = batting.teamID
group by League;
*/
/*
select Count(battingID) as playerCount, teamName, ABBR
from vbattingleaders
Group by teamName
order by playerCount desc;
*/
/*
select v.DivisionName
, AVG(v.Weight) as 'avgWeight'
from vteamRoster v
join batting b on b.playerID = v.playerID
group by v.DivisionName;
*/
/*

use RockStarDay2;

select CONCAT(FirstName,' ', LastName)
as FullName
, Year(BirthDate) as BirthYear
From BandMembers;
