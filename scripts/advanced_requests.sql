--- посмотрим, в скольких турнирах участвует каждая команда
SELECT t.team_name, count(tournament_id) as tournament_cnt
FROM ft.team_to_tournament
INNER JOIN ft.team t on team_to_tournament.team_id = t.team_id
GROUP BY t.team_name
HAVING count(tournament_id) > 1
ORDER BY tournament_cnt DESC, team_name;

--- посмотрим на посещаемость в матчах и сравним ее со средней посещаемостью по каждому турниру
SELECT t.tournament_name, m.attendance, avg(attendance) OVER (PARTITION BY m.tournament_id) as avg_attendance
FROM ft.match m
INNER JOIN ft.tournament t ON t.tournament_id = m.tournament_id
ORDER BY tournament_name, attendance;

--- посмотрим, сколько денег было суммарно потрачено клубами на трансферы по годам
SELECT year, cost, sum(cost) over (order by year)
FROM (SELECT extract(year from transfer_dttm) as year, cost
      FROM ft.transfer) as ty;

--- посмотрим, сколько суммарно тратилось на трансферы отдельных игроков в хронологическом порядке
SELECT p.player_name, cost, sum(cost) over (partition by t.player_id order by transfer_dttm)
FROM ft.transfer t
INNER JOIN ft.player p on t.player_id = p.player_id
ORDER BY player_name, transfer_dttm;

--- упорядочим матчи по числу забитых мячей, посчитаем dense_rank
SELECT t1.team_name as team1_name, t2.team_name as team2_name, team1_goals + team2_goals as goals_cnt,
       dense_rank() over (order by team1_goals + team2_goals desc)
FROM ft.match
INNER JOIN ft.team t1 on match.team1_id = t1.team_id
INNER JOIN ft.team t2 ON match.team2_id = t2.team_id;

--- выведем контракты всех игроков вместе с их предыдущим клубом
SELECT p.player_name, t.team_name,
       lag(t.team_name, 1) over (partition by pc.player_id order by pc.valid_from) as prev_team
FROM ft.player_contract pc
INNER JOIN ft.player p on pc.player_id = p.player_id
INNER JOIN ft.team t on pc.team_id = t.team_id
ORDER BY p.player_name, pc.valid_from;

