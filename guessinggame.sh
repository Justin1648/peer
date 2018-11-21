#!/usr/bin/env bash
# File: guessinggame.sh


# Create integer check function to verify inputs are positive integers.
function integer {
	while [[ ! $guess =~ ^-?[0-9]+$ ]]
	do
		echo "Positive integers only please.  Guess again: "
		read guess
		if [[ $guess -lt 0 ]]
		then
			echo "Positive integers only please.  Guess again: "
			read guess
		fi
	done
}

# Ask user to guess the number of files in the current directory.  Record guess, verify positive integer.
echo "Welcome to Guessing Game.  Please guess how many files are in the current directory: "
read guess
integer $guess

# Record the number of files in the directory.
actual=$( ls -1 | wc -l )

# Write while loop: continues until the correct number of files guessed. Nested "if" loop for responses.
while [[ $guess -ne $actual ]]
do

# Was the guess too low?
	if [[ $guess -lt $actual ]]
	then
		echo "Your guess is too low. Please guess again: "
		read guess
		integer $guess

# Was the guess too high?
	elif [[ $guess -gt $actual ]]
	then
		echo "Your guess is too high.  Please guess again:"
		read guess
		integer $guess
	fi
done

# If the while loop was exited, the user guessed correctly.  Congratulate them.
echo "Congragulations, $guess is the correct number of files."
