SET search_path = ft, pg_catalog;

SELECT player_name
FROM player
WHERE NOW() > birth_dt + interval '25 years';

SELECT stadium_name
FROM stadium
WHERE capacity >= 70000;

SELECT team_name
FROM team
INNER JOIN team_to_tournament ON team.team_id = team_to_tournament.team_id
WHERE tournament_id = (SELECT tournament_id
                       FROM tournament
                       WHERE tournament_name = 'Champions League');

SELECT count(*)
FROM match
WHERE team1_goals + match.team2_goals >= 4;

UPDATE team
SET coach = 'Thomas Tuchel'
WHERE team_name = 'Chelsea';

UPDATE player
SET birth_dt = '1996-10-08'
WHERE player_name = 'Serge Gnabry';

UPDATE stadium
SET capacity = 55000
WHERE stadium_name = 'Parc des Princes';

UPDATE player_contract
SET valid_to = '2025-12-10'
WHERE valid_to > now();

DELETE
FROM player
WHERE player_id = 9;

DELETE
FROM match
WHERE team1_id = 3;

DELETE
FROM player_contract
WHERE valid_to < '2014-01-01';
