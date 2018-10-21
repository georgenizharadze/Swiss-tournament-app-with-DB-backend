# Swiss tournament application with database back-end

This project contains a Python module that uses the PostgreSQL database to keep track of players and matches in a game tournament.
The game tournament uses the Swiss system for pairing up players in each round: players are not eliminated, and each player should be paired with another player with the same number of wins, or as close as possible.

## Running the application 

To run this application, you need Python 2.7 and PostgreSQL database management system. Connection between Python and the database back-end is enabled by `psycopg2` library, thus you also need to have it installed. 

The `tournament.py` file contains functions required to interact with the database and perform calculations to enable "Swiss" pairings for each round in the tournament. You can familairize yourself with the functions through the docstrings provided in the file. Once you know what each function does, import everything in your Python interpreter or script from the `tournaments.py` file and implement required operations. We also provide a file with tests, `tournament_test.py`, which you can run (and modify, if needed), to make sure the functions `tournament.py` file perform properly. 