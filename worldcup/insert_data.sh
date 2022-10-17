#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  if [[ $YEAR != "year" ]]
  then
    #get team
    WINNER_TEAM=$($PSQL "Select team_id from teams where name = '$WINNER'")
    #if not found
    if [[ -z $WINNER_TEAM ]]
    then
      #insert team
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo INSERTED INTO TEAMS, $WINNER
      fi
      WINNER_TEAM=$($PSQL "Select team_id from teams where name = '$WINNER'")
    fi
    #get team
    OPPONENT_TEAM=$($PSQL "Select team_id from teams where name = '$OPPONENT'")
    if [[ -z $OPPONENT_TEAM ]]
    then
      #insert team
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo INSERTED INTO TEAMS, $OPPONENT
      fi
      #get team
      OPPONENT_TEAM=$($PSQL "Select team_id from teams where name = '$OPPONENT'")
    fi

    #insert games into games table
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($YEAR,'$ROUND',$WINNER_TEAM,$OPPONENT_TEAM,$WGOALS,$OGOALS)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo New game inserted into games
    fi
  fi
done