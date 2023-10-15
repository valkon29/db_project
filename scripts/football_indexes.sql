--- часто нужно получить матчи в какой-то отрезок времени
CREATE INDEX "match.date"
    ON ft.match
    USING btree
    (match_dttm);

--- часто нас интресуют контракты конкретного игрока с конкретной командой
CREATE INDEX "player_contract.playerid_teamid"
    ON ft.player_contract
    USING btree
    (player_id, team_id);

--- часто нужно выделить все команды из какой-то страны
CREATE INDEX "team.country"
    ON ft.team
    USING btree
    (country_id);

--- поможет узнать турниры, в которых участвует конкретная команда
CREATE INDEX "team_to_tournament.teamid"
    ON ft.team_to_tournament
    USING btree
    (team_id);

--- часто возникает необходимость смотреть трансферы в хронологическом порядке
CREATE INDEX "transfer.date"
    ON ft.transfer
    USING btree
    (transfer_dttm);

--- часто нужно сравнивать трансферы по стоимости
CREATE INDEX "transfer.cost"
    ON ft.transfer
    USING btree
    (cost);