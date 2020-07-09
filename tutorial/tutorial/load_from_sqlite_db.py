"""
Includes fetch_friday function and raw data import
"""

import sqlite3
import pandas as pd
import os


def fetch_fridays(table_name):
    dbpath = "C:\\Users\\danwa\\Documents\\Projects\\acipenser\\nfl_bets\\nfl.db"
    con = sqlite3.connect(dbpath)
    query = "SELECT DISTINCT PREV_FRI FROM {}".format(table_name)
    df = pd.read_sql_query(query, con)
    con.close()

    return df


if __name__ == '__main__':

    # Current working directory
    wd = os.path.dirname(os.path.abspath(__file__))
    dbpath = "C:\\Users\\danwa\\Documents\\Projects\\acipenser\\nfl_bets\\nfl.db"
    con = sqlite3.connect(dbpath)
    df = pd.read_sql_query("SELECT * FROM GB08_11", con)

    con.close()







#EOF