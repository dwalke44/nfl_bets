############################################

############################################

import os
import json
import pandas as pd


print("Current working directory is: {}".format(os.getcwd()))

os.chdir("C:/Users/danwa/Documents/Projects/acipenser/nfl_bets/nfl-scores-and-betting-data/tutorial/tutorial")

# READ IN CSV
dat = pd.read_csv('GB_test1.csv')
