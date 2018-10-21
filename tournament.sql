-- Database structure definition for the tournament project.
-- Create database, tables / schema and views 
--
-- Drop tournament database if it exists
DROP DATABASE IF EXISTS tournament;
--
-- Create and connect to the new tournament database
CREATE DATABASE tournament;
\c tournament 
--
-- Create tables 
CREATE TABLE players (
	id SMALLSERIAL PRIMARY KEY,
	name TEXT);

CREATE TABLE matches (
	id SMALLSERIAL PRIMARY KEY,
	winner_id INTEGER REFERENCES players (id),
	loser_id INTEGER REFERENCES players (id)); 
--
-- Create views
-- First, create a view which aggregates wins per player. Left join is used to also
-- capture players who have not yet participated in any match. 
CREATE VIEW winners_count AS 
	SELECT players.name, matches.winner_id, count(winner_id) AS wins 
	FROM players LEFT JOIN matches 
	ON players.id=matches.winner_id 
	GROUP BY players.name, matches.winner_id;
-- Create a view which aggregates losses per player. 
CREATE VIEW losers_count AS 
	SELECT players.name, matches.loser_id, count(loser_id) AS losses 
	FROM players LEFT JOIN matches 
	ON players.id=matches.loser_id 
	GROUP BY players.name, matches.loser_id;
-- The following view joins the previous two to calculate total matches played per player. 
CREATE VIEW wins_and_matches_interim AS
	SELECT winners_count.name, winners_count.wins, winners_count.wins + losers_count.losses AS matches 
	FROM winners_count JOIN losers_count 
	ON winners_count.name=losers_count.name;





