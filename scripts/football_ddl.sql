CREATE SCHEMA ft;
SET search_path = ft, pg_catalog;

CREATE TABLE match (
   match_id       INTEGER PRIMARY KEY,
   team1_id       INTEGER REFERENCES team(team_id),
   team2_id       INTEGER REFERENCES team(team_id),
   team1_goals    INTEGER NOT NULL,
   team2_goals    INTEGER NOT NULL,
   match_dttm     TIMESTAMP NOT NULL,
   tournament_id  INTEGER REFERENCES tournament(tournament_id),
   stadium_id     INTEGER REFERENCES stadium(stadium_id),
   attendance     INTEGER
);

CREATE TABLE team (
   team_id     INTEGER PRIMARY KEY,
   team_name   VARCHAR(100) NOT NULL,
   owner       VARCHAR(100),
   coach       VARCHAR(100) NOT NULL,
   country_id  INTEGER REFERENCES country(country_id),
   stadium_id  INTEGER REFERENCES stadium(stadium_id)
);

CREATE TABLE player (
   player_id   INTEGER PRIMARY KEY,
   player_name VARCHAR(100) NOT NULL,
   birth_dt    TIMESTAMP,
   country_id  INTEGER REFERENCES country(country_id)
);

CREATE TABLE player_contract (
   player_id   INTEGER REFERENCES player(player_id),
   team_id     INTEGER REFERENCES team(team_id),
   valid_from  TIMESTAMP NOT NULL,
   valid_to    TIMESTAMP NOT NULL
);

CREATE TABLE transfer (
    player_id      INTEGER REFERENCES player(player_id),
    from_team_id   INTEGER REFERENCES team(team_id),
    to_team_id     INTEGER REFERENCES team(team_id),
    cost           INTEGER NOT NULL,
    transfer_dttm  TIMESTAMP NOT NULL
);

CREATE TABLE country (
    country_id    INTEGER PRIMARY KEY,
    country_name  VARCHAR(100) NOT NULL,
    continent     VARCHAR(100) NOT NULL
);

CREATE TABLE tournament (
    tournament_id    INTEGER PRIMARY KEY,
    tournament_name  VARCHAR(100) NOT NULL
);

CREATE TABLE team_to_tournament (
    team_id        INTEGER REFERENCES team(team_id),
    tournament_id  INTEGER REFERENCES tournament(tournament_id)
);

CREATE TABLE stadium (
    stadium_id   INTEGER PRIMARY KEY,
    stadium_name VARCHAR(100) NOT NULL,
    capacity     INTEGER NOT NULL,
    town         VARCHAR(100)
);

CREATE TABLE player_contract (
    player_id INTEGER REFERENCES player(player_id),
    team_id INTEGER REFERENCES team(team_id),
    valid_from TIMESTAMP NOT NULL,
    valid_to TIMESTAMP NOT NULL
);
