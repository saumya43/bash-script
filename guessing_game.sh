#!/bin/bash
set -e
Numguess=0
echo "Guess a number between 1 and 20"
(( secret =  RANDOM % 20 + 1 ))

while [[ guess -ne secret ]]
do
    (( Numguess = Numguess + 1 ))
    read -p "Enter guess: " guess
    if (( guess > $secret ));
    then 
       echo "number is greater, input lesser number"
    elif (( guess < $secret ));
    then
        echo "number is smaller, enter little bigger number"
    fi
    
done

echo "hurrah! you guessed it right in $Numguess guesses. \n"