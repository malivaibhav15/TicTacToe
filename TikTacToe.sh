#!/bin/bash -x
echo "Welcome to Tic-tac-toe game"
declare -A board
#CONSTANT
ROWS=3
COLUMNS=3
#VARIABLES
terms=1
flagSet=0
flag=0
#RESETTING THE BOARD
function resettingTheBoard()
{
	for (( index=1; index<=$ROWS; index++ ))
	do
		for (( index2=1; index2<=$COLUMNS; index2++ ))
		do
			board[ $ROWS,$COLUMNS ]=" "
		done
	done
}
#FUNCTION FOR ASSIGNING THE LETTER
function assignLetter()
{
	echo "Player assigned letter X"
	echo "Computer assigned letter O"
}
#FUNCTION TO CHECK WHO PLAY FIRST
function whoPlayFirst()
{
	play=$(( $RANDOM % 2 ))
	if [[ $play -eq 0 ]]
	then
		condition=2
		player=user
		echo "$player won the toss and elected to play first"
	else
		player=computer
		condition=1
		echo "$player won the toss and elected to play first"
	fi
}
#FUNCTION TO DISPLAY BOARD
function displayBoard()
{
	for((index=0;index<$ROWS;index++))
	do
		echo "----------------"
		for(( index1=0; index1<$COLUMNS; index1++))
		do
			echo -n "|" ${board[$ROWS,$COLUMNS]} "" "|"
		done
		echo
	done
	echo "----------------"
}
#FUNCTION FOR DECIDING THE CELL NUMBER
function choose()
{
	read -p "Enter your choice=" choice
	case $choice in
	1)
		board[0,0]=X;;
	2)
		board[0,1]=X;;
	3)
		board[0,2]=X;;
	4)
		board[1,0]=X;;
	5)
		board[1,1]=X;;
	6)
		board[1,2]=X;;
	7)
		board[2,0]=X;;
	8)
		board[2,1]=X;;
	9)
		board[2,2]=X;;
	*)
		echo "Wrong choice"
	esac
}
#CHECKS WHEATHER CORNERS ARE AVAILABLE OR NOT
function choosecpu()
{
	if [[ ${board[0,2]} != O && ${board[0,2]} != X ]]
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
	fi
}
#CHECKS WHEATHER PLAYER WIN AND THEN PLAY THAT MOVE
function checkWin()
{
	flagSet=0
	for((counter=0;counter<3;counter++))
	do
		if [[ ${board[$counter,0]} == O && ${board[$counter,1]} == O && ${board[$counter,2]} != X ]]
		then
			flagSet=1
			board[$counter,2]=O
			break
		elif [[ ${board[$counter,1]} == O && ${board[$counter,2]} == O && ${board[$counter,0]} != X ]]
		then
			flagSet=1
			board[$counter,0]=O
			break
		elif [[ ${board[$counter,2]} == O && ${board[$counter,0]} == O && ${board[$counter,1]} != X ]]
		then
			flagSet=1
			board[$counter,1]=O
			break
		elif [[ ${board[0,$counter]} == O && ${board[1,$counter]} == O && ${board[2,$counter]} != X ]]
		then
			flagSet=1
			board[2,$counter]=O
			break
		elif [[ ${board[1,$counter]} == O && ${board[2,$counter]} == O && ${board[0,$counter]} != X ]]
		then
			flagSet=1
			board[0,$counter]=O
			break
		elif [[ ${board[2,$counter$]} == O && ${board[0,$counter]} == O && ${board[1,$counter]} != X ]]
		then
			flagSet=1
			board[1,$counter]=O
			break
		elif [[ ${board[0,0]} == O && ${board[1,1]} == O && ${board[2,2]} != X ]]
		then
			flagSet=1
			board[2,2]=O
			break
		elif [[ ${board[0,0]} == O && ${board[2,2]} == O && ${board[1,1]} != X ]]
		then
			flagSet=1
			board[1,1]=O
			break
		elif [[ ${board[2,2] } == O && ${board[1,1]} == O && ${board[0,0]} != X ]]
		then
			flagSet=1
			board[2,2]=O
			break
		elif [[ ${board[2,0]} == O && ${board[1,1]} == O && ${board[0,2]} != X ]]
		then
			flagSet=1
			board[0,2]=O
			break
		elif [[ ${board[0,2]} == O && ${board[1,1]} == O && ${board[2,0]} != X ]]
		then
			flagSet=1
			board[2,0]=O
			break
		elif [[ ${board[2,0]} == O && ${board[0,2]} == O && ${board[1,1]} != X ]]
		then
			flagSet=1
			board[1,1]=O
			break
#CHECKS WHEATHER OPPONENT WINS IF SO THEN PLAYER WILL BLOCK IT
		elif [[ ${board[$counter,0]} == X && ${board[$counter,1]} == X && ${board[$counter,2]} != O ]]
		then
			flagSet=1
			board[$counter,2]=O
			break
		elif [[ ${board[$counter,1]} == X && ${board[$counter,2]} == X && ${board[$counter,0]} != O ]]
		then
			flagSet=1
			board[$counter,0]=O
			break
		elif [[ ${board[$counter,2]} == X && ${board[$counter,0]} == X && ${board[$counter,1]} != O ]]
		then
			flagSet=1
			board[$counter,1]=O
			break
		elif [[ ${board[0,$counter]} == X && ${board[1,$counter]} == X && ${board[2,$counter]} != O ]]
		then
			flagSet=1
			board[2,$counter]=O
			break
		elif [[ ${board[1,$counter]} == X && ${board[2,$counter]} == X && ${board[0,$counter]} != O ]]
		then
			flagSet=1
			board[0,$counter]=O
			break
		elif [[ ${board[2,$counter]} == X && ${board[0,$counter]} == X && ${board[1,$counter]} != O ]]
		then
			flagSet=1
			board[1,$counter]=O
			break
		elif [[ ${board[0,0]} == X && ${board[1,1]} == X && ${board[2,2]} != O ]]
		then
			flagSet=1
			board[2,2]=O
			break
		elif [[ ${board[0,0]} == X && ${board[2,2]} == X && ${board[1,1]} != O ]]
		then
			flagSet=1
			board[1,1]=O
			break
		elif [[ ${board[2,2]} == X && ${board[1,1]} == X && ${board[0,0]} != O ]]
		then
			flagSet=1
			board[2,2]=O
			break
		elif [[ ${board[2,0]} == X && ${board[1,1]} == X && ${board[0,2]} != O ]]
		then
			flagSet=1
			board[0,2]=O
			break
		elif [[ ${board[0,2]} == X && ${board[1,1]} == X && ${board[2,0]} != O ]]
		then
			flagSet=1
			board[2,0]=O
			break
		elif [[ ${board[2,0]} == X && ${board[0,2]} == X && ${board[1,1]} != O ]]
		then
			flagSet=1
			board[1,1]=O
			break
		fi
	done
}
#FUNCTION FOR CHECKING TURN AND CHECKING WIN
function term()
{
	condition=2
	while [[ $terms -le 9 ]]
	do
		if [[ $(($condition % 2)) -eq 0 ]]
		then
			echo "Player is playing"
			choose
			displayBoard
		else
			echo "Computer is playing his move"
			choosecpu
			displayBoard
		fi
		((condition++))
		((terms++))
	done
}
term
