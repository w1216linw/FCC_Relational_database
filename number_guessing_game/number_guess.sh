#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=game --tuples-only --no-align -c"

#generate a random number between 1 - 1000
RANDOM_NUMBER=$(($RANDOM % 10 + 1))
GUESS_COUNT=1

MAIN() {
  #Prompt the user for a username
  echo -e "\nEnter your username:"
  read USERNAME

  USER_ID=$($PSQL "Select user_id from game where username='$USERNAME'")
  if [[ -z $USER_ID ]]
  then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    INSERT_PLAYER_RESULT=$($PSQL "insert into game(username) values('$USERNAME')")
  else
    #GAME_PLAYED
    GAME_PLAYED=$($PSQL "select game_played from game where username = '$USERNAME'")
    #BEST_GAME
    BEST_GAME=$($PSQL "select best_game from game where username = '$USERNAME'")
    echo -e "\nWelcome back, $USERNAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  echo -e "\nGuess the secret number between 1 and 1000:"
  read USER_GUESS

  while [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  do
    echo -e "\nThat is not an integer, guess again:"
    read USER_GUESS
  done

  GUESS

  #Get info from database
  GAME_PLAYED=$($PSQL "select game_played from game where username = '$USERNAME'")
  BEST_GAME=$($PSQL "select best_game from game where username = '$USERNAME'")

  if [[ $GUESS_COUNT -gt $BEST_GAME ]]
  then
    UPDATE_BEST_GAME=$($PSQL "update game set best_game=$GUESS_COUNT where username = '$USERNAME'")
  fi
  
  GAME_PLAYED=$((GAME_PLAYED + 1))
  UPDATE_GAME_PLAYED=$($PSQL "update game set game_played=$GAME_PLAYED where username = '$USERNAME'")

  echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
}

GUESS() {
  while [ $USER_GUESS != $RANDOM_NUMBER ]
    do
      if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
      then
        echo -e "\nThat is not an integer, guess again:"
        read USER_GUESS    
      fi
      GUESS_COUNT=$((GUESS_COUNT+1))
      if [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
      then
        echo -e "\nIt's higher than that, guess again:"
        read USER_GUESS
      else
        echo -e "\nIt's lower than that, guess again:"
        read USER_GUESS
      fi
    done
}



MAIN