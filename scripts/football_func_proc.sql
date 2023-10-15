--- вывести статистику выступлений команды
CREATE OR REPLACE FUNCTION get_team_stats(in int, out win int, out draw int, out lose int) AS $$
    SELECT (SELECT count(*)
    FROM ft.match
    WHERE (team1_id = $1 and team1_goals > team2_goals) OR
            (team2_id = $1 and team2_goals > match.team1_goals)) as wins,
(SELECT count(*)
    FROM ft.match
    WHERE (team1_id = $1 and team1_goals = team2_goals) OR
            (team2_id = $1 and team2_goals = match.team1_goals)) as draws,
(SELECT count(*)
    FROM ft.match
    WHERE (team1_id = $1 and team1_goals < team2_goals) OR
            (team2_id = $1 and team2_goals < match.team1_goals)) as wins;
$$ LANGUAGE SQL;


--- процедура, удаляющая сведения о всех контрактах игрока, кроме последнего
CREATE PROCEDURE remove_old_contracts(
IN id INTEGER
)
LANGUAGE plpgsql
AS
$$
BEGIN
DELETE
FROM ft.player_contract pc
WHERE pc.player_id = id AND pc.valid_from <> (SELECT max(pc2.valid_from)
                                              FROM ft.player_contract pc2
                                              WHERE pc2.player_id = id);
END;$$

