#!/bin/bash


trap "echo -e '\e[31mNice try!\e[0m'" SIGINT SIGTERM SIGTSTP

echo -e "You have fallen for my trap, how will you get out of here now?"

while true; do
    read -r line


    if [[ "$line" == "PLEASE GET ME OUT OF HERE" ]]; then
        echo "Fine >:( but first, let's play Rock, Paper, Scissors! Think fast!"

        while true; do
	    

            # Read user input
            echo -n "Enter your move (rock, paper, or scissors) you have five seconds: "
            read -t 5 -r user_move


            if [[ -z "$user_move" ]]; then
                echo -e "\n\e[31mTime's up! You lose.\e[0m"
		continue
	    fi

            # Validate the user's move
            if [[ "$user_move" != "rock" && "$user_move" != "paper" && "$user_move" != "scissors" ]]; then
                echo -e "\e[31mInvalid move, you lose!\e[0m"
                continue
            fi


            choices=("rock" "paper" "scissors")
            computer_move=${choices[$((RANDOM % 3))]}
            echo "You chose: $user_move"
            echo "I chose: $computer_move"

            # Determine winner
            if [[ "$user_move" == "$computer_move" ]]; then
                echo -e "\e[31mIt's a tie, but you didn't win XD\e[0m"
            elif [[ ("$user_move" == "rock" && "$computer_move" == "scissors") ||
                    ("$user_move" == "scissors" && "$computer_move" == "paper") ||
                    ("$user_move" == "paper" && "$computer_move" == "rock") ]]; then
                echo -e "\e[32mYou win! You may exit now.\e[0m"
                exit 0
            else
                echo -e "\e[31mI win! You remain trapped. Try again.\e[0m"
	    fi
        done
    else
	echo -e "\e[31mno, try something else\e[0m"
    fi

done
