#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

## First, let's populate the table "teams" with team names collected from columns "winner" and "opponent":
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
	if [[ $winner != "winner" ]]; then
		team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
		# if not found, then insert team name
		if [[ -z $team_id ]]; then
			insert_team_name=$($PSQL "INSERT INTO teams(name) VALUES('$winner')")
		fi
	fi
	#
	if [[ $opponent != "opponent" ]]; then
		team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
		# if not found, then insert team name
		if [[ -z $team_id ]]; then
			insert_team_name=$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")
		fi
	fi
done
echo 'Populated SQL table "teams" with names from "games.csv"!'

## Now, let's add all the information from the rest of the columns from "games.csv":
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
	if [[ $year != "year" ]]; then
		# Get ID of winner and opponent
		winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
		opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
		# Then, due to NOT NULL constraint populate all the columns at once:
		$PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$year', '$round', '$winner_id', '$opponent_id', '$winner_goals', '$opponent_goals')"
	fi
done
echo 'Populated SQL table "games" with the rest of the info from "games.csv"!'
