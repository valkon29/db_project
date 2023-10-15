--- скроем месяцы и дни рождения игроков, оставив только год
CREATE OR REPLACE VIEW player_protected_view AS
SELECT player_name, country_id, to_char(birth_dt, 'YYYY:**:**') as birth_dt
FROM ft.player;

--- скроем клубных владельцев
CREATE OR REPLACE VIEW team_protected_view AS
SELECT team_name, coach, country_id, substring(owner for 1) || repeat('*', char_length(owner) - 2) ||
       substring(owner from char_length(owner)) as owner
FROM ft.team;

--- получим читабельную таблицу для трансферов
CREATE OR REPLACE VIEW transfer_view AS
SELECT p.player_name, t1.team_name, t2.team_name, cost, transfer_dttm
FROM ft.transfer
INNER JOIN ft.player p on p.player_id = transfer.player_id
INNER JOIN ft.team t1 on transfer.from_team_id = t1.team_id
INNER JOIN ft.team t2 on transfer.to_team_id = t2.team_id;

--- найдем, сколько голов забила каждая команда
CREATE OR REPLACE VIEW team_goals_view AS
SELECT t.team_name, avg(team1_goals) as avg_goals_scored
FROM ft.match m
INNER JOIN ft.team t ON m.team1_id = t.team_id
GROUP BY t.team_name
ORDER BY avg_goals_scored DESC;

--- посчитаем, сколько суммарно заплачено за игроков каждой страны
CREATE OR REPLACE VIEW team_goals_view AS
SELECT c.country_name, sum(t.cost) as sum_cost
FROM ft.transfer t
INNER JOIN ft.player p ON t.player_id = p.player_id
INNER JOIN ft.country c ON p.country_id = c.country_id
GROUP BY c.country_name
ORDER BY sum_cost DESC;

--- посчитаем среднюю посещаемость матчей каждой команды
CREATE OR REPLACE VIEW avg_team_attendance_view AS
SELECT t.team_name, avg(attendance) as avg_attendance
FROM (SELECT team1_id as team_id, attendance
FROM ft.match
UNION ALL
SELECT team2_id as team_id, attendance
FROM ft.match) as team_attendance
INNER JOIN ft.team t ON t.team_id = team_attendance.team_id
GROUP BY t.team_name
ORDER BY avg_attendance DESC;
