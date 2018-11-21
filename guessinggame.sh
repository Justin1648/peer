#!/usr/bin/env bash
# File: guessinggame.sh

# Ask user to guess the number of files in the current directory.
echo "Welcome to Guessing Game.  Please guess how many files are in the current directory: "

# Record the user's guess
read guess

# Record the number of files in the directory.
actual=$( ls -1 | wc -l )

# Write a while loop that continues until the correct number of files is guessed.
while [[ $guess -ne $actual ]]
do

# Verify a number was entered.
	if ! [[ "$guess" =~ ^-?[0-9]+$ ]]
	then
		echo "Please enter intigers only. Guess again: "
		read guess

# Verify a non-negative number was entered.
	elif [[ $guess -lt 0 ]]
	then
		echo "Please enter positive numbers only.  Guess again: "
		read guess

# Was the guess too low?
	elif [[ $guess -lt $actual ]]
	then
		echo "Your guess is too low. Please guess again: "
		read guess

# Was the guess too high?
	elif [[ $guess -gt $actual ]]
	then
		echo "Your guess is too high.  Please guess again:"
		read guess
	fi
done

# If the while loop was exited, the user guessed correctly.  Congratulate them.
echo "Congragulations, $guess is the correct number of files."
