#!/bin/bash -x
size=3
function displayBoard()
{
	for (( rows=0;rows<$size;rows++ ))
	do
		for (( columns=0;columns<$size;columns++ ))
		do
			displayBoard[$rows,$columns]=""
		done
	done
}
function assigningLetter()
{
	read -p "Enter the choice for sign you want 1."O" 2."X"=" choice
	if [[ $choice -eq 1 ]]
	then
		player1="O"
		player2="X"
	else
		player1="X"
      player2="O"
	fi
	echo "Player1 assigned="$player1
	echo "Player2 assigned="$player2
}
displayBoard
assigningLetter
