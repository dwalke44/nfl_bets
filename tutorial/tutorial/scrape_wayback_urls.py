"""
Spider to collect Wayback URLs
"""

os.chdir("C:/Users/danwa/Documents/Projects/acipenser/nfl_bets/nfl-scores-and-betting-data/tutorial/tutorial/")

import os
import scrapy

from load_from_sqlite_db import fetch_fridays

