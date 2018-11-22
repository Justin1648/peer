#!/usr/bin/env bash
# File: make

# make a README.md
README.md:
	touch README.md

# README.md should contain name of project
	echo "Project: Guessing Game" > README.md

# README.md should contain date/time make was run
	date >> README.md

# README.md should contain number of lines of code in guessinggame.sh
	wc -l guessinggame.sh >> README.md



