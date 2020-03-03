#!/bin/bash -x
size=3
terms=1
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
		n=2
		echo "Player1 won the toss and elected to play first"
	else
		n=1
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
function checkWin()
{
	flagc=0
	for((counter=0;counter<3;counter++))
	do
		if [[ ${board[$counter,0]} == O && ${board[$counter,1]} == O && ${board[$counter,2]} != X ]]
		then
			flagc=1
			board[$counter,2]=O
			break
		elif [[ ${board[$counter,1]} == O && ${board[$counter,2]} == O && ${board[$counter,0]} != X ]]
		then
			flagc=1
			board[$counter,0]=O
			break
		elif [[ ${board[$counter,2]} == O && ${board[$counter,0]} == O && ${board[$counter,1]} != X ]]
		then
			flagc=1
			board[$counter,1]=O
			break
		elif [[ ${board[0,$counter]} == O && ${board[1,$counter]} == O && ${board[2,$counter]} != X ]]
		then
			flagc=1
			board[2,$counter]=O
			break
		elif [[ ${board[1,$counter]} == O && ${board[2,$counter]} == O && ${board[0,$counter]} != X ]]
		then
			flagc=1
			board[0,$counter]=O
			break
		elif [[ ${board[2,$counter]} == O && ${board[0,$counter]} == O && ${board[1,$counter]} != X ]]
		then
			flagc=1
			board[1,$counter]=O
			break
		elif [[ ${board[0,0]} == O && ${board[1,1]} == O && ${board[2,2]} != X ]]
		then
			flagc=1
			board[2,2]=O
			break
		elif [[ ${board[0,0]} == O && ${board[2,2]} == O && ${board[1,1]} != X ]]
		then
			flagc=1
			board[1,1]=O
			break
		elif [[ ${board[2,2]} == O && ${board[1,1]} == O && ${board[0,0]} != X ]]
		then
			flagc=1
			board[2,2]=O
			break
		elif [[ ${board[2,0]} == O && ${board[1,1]} == O && ${board[0,2]} != X ]]
		then
			flagc=1
			board[0,2]=O
			break
		elif [[ ${board[0,2]} == O && ${board[1,1]} == O && ${board[2,0]} != X ]]
		then
			flagc=1
			board[2,0]=O
			break
		elif [[ ${board[2,0]} == O && ${board[0,2]} == O && ${board[1,1]} != X ]]
		then
			flagc=1
			board[1,1]=O
			break
		elif [[ ${board[2,0]} == O && ${board[0,2]} == O && ${board[1,1]} != X ]]
		then
			flagc=1
			board[1,1]=O
			break
		elif [[ ${board[$counter,0]} == X && ${board[$counter,1]} == X && ${board[$counter,2]} != O ]]
		then
			flagc=1
			board[$counter,2]=O
			break
		elif [[ ${board[$counter,1]} == X && ${board[$counter,2]} == X && ${board[$counter,0]} != O ]]
		then
			flagc=1
			board[$counter,0]=O
			break
		elif [[ ${board[$counter,2]} == X && ${board[$counter,0]} == X && ${board[$counter,1]} != O ]]
		then
			flagc=1
			board[$counter,1]=O
			break
		elif [[ ${board[0,$counter]} == X && ${board[1,$counter]} == X && ${board[2,$counter]} != O ]]
		then
			flagc=1
			board[2,$counter]=O
			break
		elif [[ ${board[1,$counter]} == X && ${board[2,$counter]} == X && ${board[0,$counter]} != O ]]
		then
			flagc=1
			board[0,$counter]=O
			break
		elif [[ ${board[2,$counter]} == X && ${board[0,$counter]} == X && ${board[1,$counter]} != O ]]
		then
			flagc=1
			board[1,$counter]=O
			break
		elif [[ ${board[0,0]} == X && ${board[1,1]} == X && ${board[2,2]} != O ]]
		then
			flagc=1
			board[2,2]=O
			break
		elif [[ ${board[0,0]} == X && ${board[2,2]} == X && ${board[1,1]} != O ]]
		then
			flagc=1
			board[1,1]=O
			break
		elif [[ ${board[2,2]} == X && ${board[1,1]} == X && ${board[0,0]} != O ]]
		then
			flagc=1
			board[2,2]=O
			break
		elif [[ ${board[2,0]} == X && ${board[1,1]} == X && ${board[0,2]} != O ]]
		then
			flagc=1
			board[0,2]=O
			break
		elif [[ ${board[0,2]} == X && ${board[1,1]} == X && ${board[2,0]} != O ]]
		then
			flagc=1
			board[2,0]=O
			break
		elif [[ ${board[2,0]} == X && ${board[0,2]} == X && ${board[1,1]} != O ]]
		then
			flagc=1
			board[1,1]=O
			break
		fi
	done
}
board
assigningLetter
toss
displayBoard
chooseCell
chooseCpu
checkWin
