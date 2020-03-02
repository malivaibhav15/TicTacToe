#!/bin/bash -x
read -p "Enter the number of rows and column=" size
function displayBoard()
{
for (( column=0;column<size;column++ ))
do
	for (( rows=0;rows<size;rows++ ))
	do
		displayBoard[$column,$rows]=""
	done
done
}
displayBoard
