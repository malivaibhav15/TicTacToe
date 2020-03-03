#!/bin/bash -x
size=3
declare -A board
function board()
{
	for (( rows=0;rows<$size;rows++ ))
	do
		for (( columns=0;columns<$size;columns++ ))
		do
			board[$rows,$columns]=""
		done
	done
}
function assigningLetter()
{
	echo "Player1 assigned=X"
}
function toss()
{
	toss=$((RANDOM%2))
	if [[ $toss -eq 1 ]]
	then
		echo "Player1 won the toss and elected to play first"
	else
		echo "cpu won the toss and elected to play first"
	fi
}
function displayBoard()
{
	for ((rows=0;rows<$size;rows++ ))
	do
		echo "----------"
		for (( columns=0;columns<$size;columns++ ))
		do
			echo -n "|" ${board[$rows,$columns]} " "
		done
		printf "|"
		echo
	done
	echo "----------"
}
function chooseCell()
{
	read -p "enter your choice=" choice
	case $choice in
		1)
			board[0,0]=X
			;;
		2)
			board[0,1]=X
			;;
		3)
			board[0,2]=X
			;;
		4)
			board[1,0]=X
			;;
		5)
			board[1,1]=X
			;;
		6)
			board[1,2]=X
			;;
		7)
			board[2,0]=X
			;;
		8)
			board[2,1]=X
			;;
		9)
			board[2,2]=X
			;;
		*)
   	echo "Wrong choice"
   esac
}
function chooseCpu()
{
	if [[ ${board[1,1]} != O && ${board[1,1]} != X ]]
	then
   	board[1,1]=O
	elif [[ ${board[0,2]} != O && ${board[0,2]} != X ]]
	then
   	board[0,2]=O
	elif [[ ${board[2,0]} != O && ${board[2,0]} != X ]]
	then
   	board[2,0]=O
	elif [[ ${board[2,2]} != O && ${board[2,2]} != X ]]
	then
   	board[2,2]=O
	elif [[ ${board[0,0]} != O && ${board[0,0]} != X ]]
	then
   	board[0,0]=O
	elif [[ ${board[0,1]} != O && ${board[0,1]} != X ]]
	then
   	board[0,1]=O
	elif [[ ${board[1,2]} != O && ${board[1,2]} != X ]]
	then
   	board[1,2]=O
	elif [[ ${board[1,0]} != O && ${board[1,0]} != X ]]
	then
   	board[1,0]=O
	elif [[ ${board[2,1]} != O && ${board[2,1]} != X ]]
	then
   	board[2,1]=O
	fi
}

board
assigningLetter
toss
displayBoard
chooseCell
chooseCpu
