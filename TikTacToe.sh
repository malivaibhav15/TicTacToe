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
resettingTheBoard()
{
	for (( index=0; index<$ROWS; index++ ))
	do
		for (( index2=0; index2<$COLUMNS; index2++ ))
		do
			board[ $ROWS,$COLUMNS ]="-"
		done
	done
}
resettingTheBoard
#FUNCTION TO DISPLAY BOARD
displayBoard()
{
	for((index=0;index<$ROWS;index++))
	do
		echo "----------------"
		for(( index1=0; index1<$COLUMNS; index1++))
		do
			echo -n "|" ${board[$index,$index1]} "" "|"
		done
		echo
	done
	echo "----------------"
}
#FUNCTION FOR ASSIGNING THE LETTER
assignLetter()
{
	echo "Player assigned letter X"
	echo "Computer assigned letter O"
}
assignLetter
#FUNCTION TO CHECK WHO PLAY FIRST
whoPlayFirst()
{
	play=$(( $RANDOM % 2 ))
	if [[ $play -eq 0 ]]
	then
		condition=2
		player=user
		echo "$player won the toss and elected to play first"
	else
		player=Computer
		condition=1
		echo "$player won the toss and elected to play first"
	fi
}
#whoPlayFirst
#FUNCTION FOR DECIDING THE CELL NUMBER
choose()
{
	read -p "enter your choice=" choice
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
choosecpu()
{
#CHECKS WHEATHER CENTER IS AVAILABLE OR NOT
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
#CHECK IF PLAYER CAN WIN,IF HE WINS THEN PLAY THAT MOVE
checkwin()
{
	flagSet=0
	for((index=0;index<3;index++))
	do
		if [[ ${board[$index,0]} == O && ${board[$index,1]} == O && ${board[$index,2]} != X ]]
		then
			flagSet=1
			board[$index,2]=O
			break
		elif [[ ${board[$index,1]} == O && ${board[$index,2]} == O && ${board[$index,0]} != X ]]
		then
			flagSet=1
			board[$index,0]=O
			break
		elif [[ ${board[$index,2]} == O && ${board[$index,0]} == O && ${board[$index,1]} != X ]]
		then
			flagSet=1
			board[$index,1]=O
			break
		elif [[ ${board[0,$index]} == O && ${board[1,$index]} == O && ${board[2,$index]} != X ]]
		then
			flagSet=1
			board[2,$index]=O
			break
		elif [[ ${board[1,$index]} == O && ${board[2,$index]} == O && ${board[0,$index]} != X ]]
		then
			flagSet=1
			board[0,$index]=O
			break
		elif [[ ${board[2,$index]} == O && ${board[0,$index]} == O && ${board[1,$index]} != X ]]
		then
			flagSet=1
			board[1,$index]=O
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
		elif [[ ${board[2,2]} == O && ${board[1,1]} == O && ${board[0,0]} != X ]]
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
#CHECK IF OPPONENT CAN WIN THEN PLAY TO BLOCK
		elif [[ ${board[$index,0]} == X && ${board[$index,1]} == X && ${board[$index,2]} != O ]]
		then
			flagSet=1
			board[$index,2]=O
			break
		elif [[ ${board[$index,1]} == X && ${board[$index,2]} == X && ${board[$index,0]} != O ]]
		then
			flagSet=1
			board[$index,0]=O
			break
		elif [[ ${board[$index,2]} == X && ${board[$index,0]} == X && ${board[$index,1]} != O ]]
		then
			flagSet=1
			board[$index,1]=O
			break
		elif [[ ${board[0,$index]} == X && ${board[1,$index]} == X && ${board[2,$index]} != O ]]
		then
			flagSet=1
			board[2,$index]=O
			break
		elif [[ ${board[1,$index]} == X && ${board[2,$index]} == X && ${board[0,$index]} != O ]]
		then
			flagSet=1
			board[0,$index]=O
			break
		elif [[ ${board[2,$index]} == X && ${board[0,$index]} == X && ${board[1,$index]} != O ]]
		then
			flagSet=1
			board[1,$index]=O
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
#DISPLAY THE WINNER
winner()
{
	flag=0
	for((index=0;index<3;index++))
	do
		if [[ ${board[$index,0]} == O && ${board[$index,1]} == O && ${board[$index,2]} == O ]]
		then
			flag=1
			echo "-----Computer won-----"
			break
		elif [[ ${board[$index,1]} == O && ${board[$index,2]} == O && ${board[$index,0]} == O ]]
		then
			flag=1
			echo "-----Computer won-----"
			break
		elif [[ ${board[$index,2]} == O && ${board[$index,0]} == O && ${board[$index,1]} == O ]]
		then
			flag=1
			echo "-----Computer won-----"
			break
		elif [[ ${board[0,$index]} == O && ${board[1,$index]} == O && ${board[2,$index]} == O ]]
		then
			flag=1
			echo "-----Computer won-----"
			break
		elif [[ ${board[1,$index]} == O && ${board[2,$index]} == O && ${board[0,$index]} == O ]]
		then
			flag=1
			echo "-----Computer won-----"
			break
		elif [[ ${board[2,$index]} == O && ${board[0,$index]} == O && ${board[1,$index]} == O ]]
		then
			flag=1
			echo "-----Computer won-----"
			break
		elif [[ ${board[0,0]} == O && ${board[1,1]} == O && ${board[2,2]} == O ]]
		then
			flag=1
			echo "-----Computer won-----"
			break
		elif [[ ${board[0,0]} == O && ${board[2,2]} == O && ${board[1,1]} == O ]]
		then
			flag=1
			echo "-----Computer won-----"
			break
		elif [[ ${board[2,2]} == O && ${board[1,1]} == O && ${board[0,0]} == O ]]
		then
			flag=1
			echo "-----Computer won-----"
			break
		elif [[ ${board[2,0]} == O && ${board[1,1]} == O && ${board[0,2]} == O ]]
		then
			flag=1
			echo "-----Computer won-----"
			break
		elif [[ ${board[0,2]} == O && ${board[1,1]} == O && ${board[2,0]} == O ]]
		then
			flag=1
			echo "-----Computer won-----"
			break
		elif [[ ${board[2,0]} == O && ${board[0,2]} == O && ${board[1,1]} == O ]]
		then
			flag=1
			echo "-----Computer won-----"
			break
		elif [[ ${board[$index,0]} == X && ${board[$index,1]} == X && ${board[$index,2]} == X ]]
		then
			flag=1
			echo "-----Player won-----"
			break
		elif [[ ${board[$index,1]} == X && ${board[$index,2]} == X && ${board[$index,0]} == X  ]]
		then
			flag=1
			echo "-----Player won-----"
			break
		elif [[ ${board[$index,2]} == X && ${board[$index,0]} == X && ${board[$index,1]} == X  ]]
		then
			flag=1
			echo "------Player won-----"
			break
		elif [[ ${board[0,$index]} == X && ${board[1,$index]} == X && ${board[2,$index]} == X  ]]
		then
			flag=1
			echo "-----Player won-----"
			break
		elif [[ ${board[1,$index]} == X && ${board[2,$index]} == X && ${board[0,$index]} == X  ]]
		then
			flag=1
			echo "-----Player won-----"
			break
		elif [[ ${board[2,$index]} == X && ${board[0,$index]} == X && ${board[1,$index]} == X  ]]
		then
			flag=1
			echo "-----Player won-----"
			break
		elif [[ ${board[0,0]} == X && ${board[1,1]} == X && ${board[2,2]} == X  ]]
		then
			flag=1
			echo "-----Player won-----"
			break
		elif [[ ${board[0,0]} == X && ${board[2,2]} == X && ${board[1,1]} == X  ]]
		then
			flag=1
			echo "-----Player won-----"
			break
		elif [[ ${board[2,2]} == X && ${board[1,1]} == X && ${board[0,0]} == X  ]]
		then
			flag=1
			echo "-----Player won-----"
			break
		elif [[ ${board[2,0]} == X && ${board[1,1]} == X && ${board[0,2]} == X ]]
		then
			flag=1
			echo "-----Player won-----"
			break
		elif [[ ${board[0,2]} == X && ${board[1,1]} == X && ${board[2,0]} == X  ]]
		then
			flag=1
			echo "-----Player won-----"
			break
		elif [[ ${board[2,0]} == X && ${board[0,2]} == X && ${board[1,1]} == X  ]]
		then
			flag=1
			echo "-----Player won-----"
			break
		fi
	done
}
#FUNCTION FOR CHANGING THE TURN AND CHECKING THE WIN
term()
{
	whoPlayFirst
	displayBoard
	condition=2
	while [[ $terms -le 9 && $flag -ne 1 ]]
	do
		if [[ $(($condition % 2)) -eq 0 ]]
		then
			echo "Player is playing"
			choose
			winner
			displayBoard
		else
			echo "Computer is playing"
			checkwin
			winner
			if [[ $flag -eq 0 && $flagSet -eq 0 ]]
			then
				choosecpu
			fi
			displayBoard
		fi
		((condition++))
		((terms++))
	done
	if  [[ $flag -eq 0 ]]
	then
		echo "-----GAME OVER-----"
	fi
}
term
