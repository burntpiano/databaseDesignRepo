#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# username
echo "Enter your username:"
read USERNAME

# look up data
USER_ROW=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME';")

if [[ -z $USER_ROW ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # insert dummy values
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME');" > /dev/null
  GAMES_PLAYED=0
  BEST_GAME="N/A"
else
  # existing user
  IFS='|' read GAMES_PLAYED BEST_GAME <<< "$USER_ROW"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# number gen
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

echo "Guess the secret number between 1 and 1000:"

GUESSES=0

while true
do
  read GUESS

  # check int
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  (( GUESSES++ ))

  if [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    # grats
    echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    # update scoreboard
    NEW_GAMES_PLAYED=$(( GAMES_PLAYED + 1 ))

    if [[ $BEST_GAME == "N/A" || $GUESSES -lt $BEST_GAME ]]
    then
      $PSQL "UPDATE users SET games_played = $NEW_GAMES_PLAYED, best_game = $GUESSES WHERE username = '$USERNAME';" > /dev/null
    else
      $PSQL "UPDATE users SET games_played = $NEW_GAMES_PLAYED WHERE username = '$USERNAME';" > /dev/null
    fi

    break
  fi
done
