import os
import pytest
from . import execute_sql_to_df
from . import read_sql

@pytest.fixture()
def select_script():
    path = "scripts/advanced_requests.sql"
    return read_sql(path)


@pytest.fixture()
def select_df0(select_script, sqlalchemy_conn):
    return execute_sql_to_df(
        conn=sqlalchemy_conn,
        sql=select_script.split(';')[0]
    )

@pytest.fixture()
def select_df1(select_script, sqlalchemy_conn):
    return execute_sql_to_df(
        conn=sqlalchemy_conn,
        sql=select_script.split(';')[1]
    )

@pytest.fixture()
def select_df2(select_script, sqlalchemy_conn):
    return execute_sql_to_df(
        conn=sqlalchemy_conn,
        sql=select_script.split(';')[2]
    )

@pytest.fixture()
def select_df3(select_script, sqlalchemy_conn):
    return execute_sql_to_df(
        conn=sqlalchemy_conn,
        sql=select_script.split(';')[3]
    )

@pytest.fixture()
def select_df4(select_script, sqlalchemy_conn):
    return execute_sql_to_df(
        conn=sqlalchemy_conn,
        sql=select_script.split(';')[4]
    )

@pytest.fixture()
def select_df5(select_script, sqlalchemy_conn):
    return execute_sql_to_df(
        conn=sqlalchemy_conn,
        sql=select_script.split(';')[5]
    )

# убедимся, что результаты запросов имеют правильные размеры,
# а также проверим произвольные значения в ключевых столбцах таблиц
def test(select_df0, select_df1, select_df2, select_df3, select_df4, select_df5):
    assert select_df0['tournament_cnt'].iloc[0] == 3
    assert select_df0.shape == (6, 2)
    assert select_df1['attendance'].iloc[1] == 73948
    assert select_df1.shape == (8, 3)
    assert select_df2['year'].iloc[3] == 2018
    assert select_df2.shape == (7, 3)
    assert select_df3['sum'].iloc[6] == 35000000
    assert select_df3.shape == (7, 3)
    assert select_df4['dense_rank'].iloc[5] == 3
    assert select_df4.shape == (8, 4)
    assert select_df5['prev_team'].iloc[11] == 'Barselona'
    assert select_df5.shape == (15, 3)

