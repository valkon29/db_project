# Физическая модель

---

Таблица **MATCH**:

| Название        | Описание                    | Тип данных     | Ограничение   |
|-----------------|-----------------------------|----------------|---------------|
| `match_id`      | Идентификатор матча         | `INTEGER`      | `PRIMARY KEY` |
| `team1_id`      | Идентификатор первой команды| `INTEGER`      | `FOREIGN KEY` |
| `team2_id`      | Идентификатор второй команды| `INTEGER`      | `FOREIGN KEY` |
| `team1_goals`   | Забила первая команда       | `INTEGER`      | `NOT NULL`    |
| `team2_goals`   | Забила вторая команда       | `INTEGER`      | `NOT NULL`    |
| `match_dttm`    | Дата и время матча          | `TIMESTAMP`    | `NOT NULL`    |
| `tournament_id` | Идентификатор турнира       | `INTEGER`      | `FOREIGN KEY` |
| `stadium_id`    | Идентификатор стадиона      | `INTEGER`      | `FOREIGN KEY` |
| `attendance`    | Посещаемость                | `INTEGER`      |               |

Таблица **TEAM**:

| Название        | Описание                | Тип данных     | Ограничение   |
|-----------------|-------------------------|----------------|---------------|
| `team_id`       | Идентификатор команды   | `INTEGER`      | `PRIMARY KEY` |
| `team_name`     | Имя команды             | `VARCHAR(100)` | `NOT NULL`    |
| `owner`         | Имя владельца           | `VARCHAR(100)` |               |
| `coach`         | Имя тренера.            | `VARCHAR(100)` | `NOT NULL`    |
| `country_id`    | Идентификатор страны    | `INTEGER`      | `FOREIGN KEY` |

Таблица **PLAYER**:

| Название        | Описание                 | Тип данных     | Ограничение   |
|-----------------|--------------------------|----------------|---------------|
| `player_id`     | Идентификатор игрока     | `INTEGER`      | `PRIMARY KEY` |
| `player_name`   | Имя игрока               | `VARCHAR(100)` | `NOT NULL`    |
| `birth_dt`      | Дата рождения            | `TIMESTAMP`    |               |
| `country_id`    | Идентификатор страны     | `INTEGER`      | `FOREIGN KEY` |

Таблица **PLAYER_CONTRACT**:

| Название        | Описание                    | Тип данных     | Ограничение   |
|-----------------|-----------------------------|----------------|---------------|
| `player_id`     | Идентификатор игрока        | `INTEGER`      | `FOREIGN KEY` |
| `team_id`       | Идентификатор команды       | `INTEGER`      | `FOREIGN KEY` |
| `valid_from`    | Начало действия контракта   | `TIMESTAMP`    | `NOT NULL`    |
| `valid_to`      | Окончание действия контракта| `TIMESTAMP`    | `NOT NULL`    |

Таблица **TRANSFER**:

| Название        | Описание                        | Тип данных     | Ограничение   |
|-----------------|---------------------------------|----------------|---------------|
| `player_id`     | Идентификатор игрока            | `INTEGER`      | `FOREIGN KEY` |
| `from_team_id`  | Идентификатор команды-продавца  | `INTEGER`      | `FOREIGN KEY` |
| `to_team_id`    | Идентификатор команды-покупателя| `INTEGER`      | `FOREIGN KEY` |
| `cost`          | Сумма трансфера                 | `INTEGER`      | `NOT NULL`    |
| `transfer_dttm` | Дата и время перехода           | `TIMESTAMP`    | `NOT NULL`    |

Таблица **COUNTRY**:

| Название        | Описание             | Тип данных     | Ограничение   |
|-----------------|----------------------|----------------|---------------|
| `country_id`    | Идентификатор страны | `INTEGER`      | `PRIMARY KEY` |
| `country_name`  | Название страны      | `VARCHAR(100)` | `NOT NULL`    |
| `continent`     | Название части света | `VARCHAR(100)` | `NOT NULL`    |

Таблица **TOURNAMENT**:

| Название         | Описание             | Тип данных     | Ограничение   |
|------------------|----------------------|----------------|---------------|
| `tournament_id`  | Идентификатор турнира| `INTEGER`      | `PRIMARY KEY` |
| `tournament_name`| Название турнира     | `VARCHAR(100)` | `NOT NULL`    |


Таблица **TEAM_TO_TOURNAMENT**:

| Название        | Описание             | Тип данных     | Ограничение   |
|-----------------|----------------------|----------------|---------------|
| `team_id`       | Идентификатор команды| `INTEGER`      | `FOREIGN KEY` |
| `tournament_id` | Идентификатор турнира| `INTEGER`      | `FOREIGN KEY` |

Таблица **STADIUM**:

| Название        | Описание              | Тип данных     | Ограничение   |
|-----------------|-----------------------|----------------|---------------|
| `stadium_id`    | Идентификатор стадиона| `INTEGER`      | `PRIMARY KEY` |
| `stadium_name`  | Название стадиона     | `VARCHAR(100)` | `NOT NULL`    |
| `capacity`      | Вместимость стадиона  | `INTEGER`      | `NOT NULL`    |
| `town`          | Город                 | `VARCHAR(100)` |               |

---
Таблица **MATCH**:
```postgresql
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

```
Таблица **TEAM**:
```postgresql
CREATE TABLE team (
   team_id     INTEGER PRIMARY KEY,
   team_name   VARCHAR(100) NOT NULL,
   owner       VARCHAR(100),
   coach       VARCHAR(100) NOT NULL,
   country_id  INTEGER REFERENCES country(country_id)
);
```

Таблица **PLAYER**:
```postgresql
CREATE TABLE player (
   player_id   INTEGER PRIMARY KEY,
   player_name VARCHAR(100) NOT NULL,
   birth_dt    TIMESTAMP,
   country_id  INTEGER REFERENCES country(country_id)
);
```

Таблица **PLAYER_CONTRACT**:
```postgresql
CREATE TABLE player_contract (
   player_id   INTEGER REFERENCES player(player_id),
   team_id     INTEGER REFERENCES team(team_id),
   valid_from  TIMESTAMP NOT NULL,
   valid_to    TIMESTAMP NOT NULL
);
```


Таблица **TRANSFER**:
```postgresql
CREATE TABLE transfer (
    player_id      INTEGER REFERENCES player(player_id),
    from_team_id   INTEGER REFERENCES team(team_id),
    to_team_id     INTEGER REFERENCES team(team_id),
    cost           INTEGER NOT NULL,
    transfer_dttm  TIMESTAMP NOT NULL
);
```

Таблица **COUNTRY**:
```postgresql
CREATE TABLE country (
    country_id    INTEGER PRIMARY KEY,
    country_name  VARCHAR(100) NOT NULL,
    continent     VARCHAR(100) NOT NULL
);
```

Таблица **TOURNAMENT**:
```postgresql
CREATE TABLE tournament (
    tournament_id    INTEGER PRIMARY KEY,
    tournament_name  VARCHAR(100) NOT NULL
);
```

Таблица **TEAM_TO_TOURNAMENT**:
```postgresql
CREATE TABLE team_to_tournament (
    team_id        INTEGER REFERENCES team(team_id),
    tournament_id  INTEGER REFERENCES tournament(tournament_id)
);
```

Таблица **STADIUM**:
```postgresql
CREATE TABLE stadium (
    stadium_id   INTEGER PRIMARY KEY,
    stadium_name VARCHAR(100) NOT NULL,
    capacity     INTEGER NOT NULL,
    town         VARCHAR(100)
);
```

