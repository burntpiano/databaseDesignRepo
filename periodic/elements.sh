#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"

# arg
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0
fi

INPUT="$1"

# search choice
if [[ $INPUT =~ ^[0-9]+$ ]]
then
  CONDITION="e.atomic_number = $INPUT"
else
  CONDITION="e.symbol = '$INPUT' OR e.name = '$INPUT'"
fi

RESULT=$($PSQL "
  SELECT e.atomic_number,
         e.name,
         e.symbol,
         t.type,
         p.atomic_mass,
         p.melting_point_celsius,
         p.boiling_point_celsius
  FROM elements AS e
  JOIN properties AS p USING (atomic_number)
  JOIN types AS t USING (type_id)
  WHERE $CONDITION;
")

# err handle
if [[ -z $RESULT ]]
then
  echo "I could not find that element in the database."
  exit 0
fi

IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELT BOIL <<< "$RESULT"

echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
