INSERT INTO team (team_id, team_name, owner, coach, country_id) VALUES
(0, 'Arsenal', 'Stan Kroenke', 'Mikel Arteta', 0),
(1, 'Bayern Munich', null, 'Thomas Tuchel', 2),
(2, 'Liverpool', 'Fenway Sports Group', 'Jürgen Klopp', 0),
(3, 'PSG', 'Qatar Sports Investments', 'Christophe Galtier', 4),
(4, 'Chelsea', 'Todd Boehly', 'Frank Lampard', 0),
(5, 'Manchester United', 'Glazer brothers', 'Erik ten Hag', 0),
(6, 'Real Madrid', null, 'Carlo Ancelotti', 3),
(7, 'Barselona', null, 'Xavi', 3),
(8, 'Juventus', 'Agnelli family', 'Massimiliano Allegri', 1),
(9, 'Napoli', 'Filmauro S.r.l.', 'Luciano Spalletti', 1)


INSERT INTO player (player_id, player_name, country_id, birth_dt) VALUES
(0, 'Bukayo Saka', 0, '2001-09-05'),
(1, 'Marc-André ter Stegen', 2, '1992-05-30'),
(2, 'Mohamed Salah', 33, '1992-07-15'),
(3, 'Kepa Arrizabalaga', 3, '1994-10-03'),
(4, 'Bruno Fernandes', 7, '1994-05-11'),
(5, 'Neymar', 4, '1992-12-20'),
(6, 'Luka Modrić', 11, '1985-05-11'),
(7, 'Serge Gnabry', 2, '1995-10-08'),
(8, 'Juan Cuadrado', 59, '1988-05-18'),
(9, 'Khvicha Kvaratskhelia', 42, '2001-02-12');

INSERT INTO country (country_id, country_name, continent) VALUES
(0, 'England', 'Europe'),
(1, 'Italy', 'Europe'),
(2, 'Germany', 'Europe'),
(3, 'Spain', 'Europe'),
(4, 'France', 'Europe'),
(7, 'Portugal', 'Europe'),
(11, 'Croatia', 'Europe'),
(33, 'Egypt', 'Africa'),
(42, 'Georgia', 'Asia'),
(59, 'Columbia', 'South America');

INSERT INTO player_contract (player_id, team_id, valid_from, valid_to) VALUES
(0, 0, '2019-07-13', '2024-12-30'),
(1, 1, '2014-06-18', '2018-05-11'),
(1, 7, '2018-05-11', '2023-05-30'),
(2, 9, '2016-02-07', '2018-11-26'),
(2, 2, '2018-11-26', '2024-08-14'),
(3, 4, '2019-08-12', '2025-01-01'),
(4, 4, '2015-12-14', '2020-10-30'),
(4, 5, '2020-10-30', '2024-10-29'),
(5, 7, '2012-08-13', '2017-09-07'),
(5, 3, '2017-09-07', '2023-08-01'),
(7, 3, '2011-12-10', '2013-07-15'),
(7, 0, '2013-07-15', '2017-05-14'),
(7, 1, '2017-05-14', '2023-09-10'),
(8, 4, '2013-07-14', '2018-05-06'),
(8, 8, '2018-05-06', '2023-11-10');

INSERT INTO transfer (player_id, from_team_id, to_team_id, cost, transfer_dttm) VALUES
(5, 7, 3, 220000000, '2017-09-07'),
(7, 3, 0, 5000000, '2013-07-15'),
(7, 0, 1, 30000000, '2017-05-14'),
(1, 1, 7, 20000000 , '2018-05-11'),
(8, 4, 8, 10000000, '2018-05-06'),
(2, 9, 2, 40000000, '2018-11-26'),
(4, 4, 5, 5000000, '2020-10-30');

INSERT INTO stadium (stadium_id, stadium_name, capacity, town) VALUES
(0, 'Emirates', 57000, 'London'),
(1, 'Allianz Arena', 75000, 'Munich'),
(2, 'Enfield', 54000, 'Liverpool'),
(3, 'Parc des Princes', 48000, 'Paris'),
(4, 'Stamford Bridge', 45000, 'London'),
(5, 'Old Trafford', 74000, 'Manchester'),
(6, 'Santiago Bernabéu', 81000, 'Madrid'),
(7, 'Camp Nou', 90000,  'Barselona'),
(8, 'Juventus Stadium', 42000, 'Turin'),
(9, 'Stadio Diego Armando Maradona', 54000, 'Naples');

INSERT INTO tournament (tournament_id, tournament_name) VALUES
(0, 'English Premier League'),
(1, 'La Liga'),
(2, 'Serie A'),
(3, 'Bundesliga'),
(4, 'League one'),
(5, 'FA Cup'),
(6, 'Champions League'),
(7, 'Europa League'),
(8, 'Copa del Rey');

INSERT INTO team_to_tournament (team_id, tournament_id) VALUES
(0, 0),
(0, 5),
(1, 3),
(1, 6),
(2, 0),
(3, 4),
(3, 6),
(4, 0),
(5, 0),
(5, 7),
(6, 1),
(6, 6),
(6, 8),
(7, 1),
(7, 8),
(7, 7),
(8, 2),
(9, 2);

INSERT INTO match (match_id, team1_id, team2_id, team1_goals, team2_goals, match_dttm, tournament_id,
                   stadium_id, attendance) VALUES
(0, 0, 2, 2, 2, '2023-04-10', 0, 2, 52736),
(1, 7, 6, 0, 4, '2023-04-05', 8, 6, 72629),
(2, 8, 9, 3, 2, '2022-03-23', 2, 9, 45028),
(3, 5, 7, 2, 2, '2022-02-12', 7, 5, 69726),
(4, 4, 5, 1, 0, '2020-08-07', 0, 4, 42984),
(5, 1, 6, 0, 2, '2017-11-04', 6, 1, 73948),
(6, 0, 4, 3, 2, '2019-07-14', 5, 0, 53672),
(7, 3, 1, 1, 0, '2018-04-11', 6, 3, 46832);
