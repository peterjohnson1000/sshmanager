#!/bin/bash

createNewKeyPair() {
	echo "Do you want to name your SSH key pair? (y/n)"
	read yn
	if [ $yn = "y" ]
	then
		echo "Enter the SSH key pair name"
		read sshname
		ssh-keygen -t rsa -f "$HOME/.ssh/$sshname" -P ""
		printf "\n"
		sshCreationExitCodeChecker
	else
		ssh-keygen -t rsa -f "$HOME/.ssh/id-rsa" -P ""
		printf "\n"
		sshCreationExitCodeChecker
	fi
}

viewAllKeyPair() {
	printf "\n"
	displayCommand=ls -l ~/.ssh
	display=$(basename "$displayCommand")
	echo $display
}

deleteKeyPair() {
	printf "\n"
	echo "All SSH key pairs:"
	ls -l ~/.ssh
	printf "\n"
	echo "Enter SSH key pair id:"
	read sshf 
	rm $HOME/.ssh/$ssh
	rm $HOME/.ssh/$ssh.pub
	if [ $? -eq 0 ]
	then
		printf "\n"
		echo "Sucessfully deleted $ssh"
	else
		printf "\n"
		echo "Failed to delete $ssh"
	fi
}

sshCreationExitCodeChecker() {
        if [ $? -eq 0 ]
	then
		printf "\n"
		echo "SSH key pair has been sucessfully created"
	else
		printf "\n"
		echo "Failed to create SSh key pair"
	fi
}

while true 
do
	printf "\n"
	echo "1. Create a new SSH key pair"
	echo "2. View all SSH key pairs"
	echo "3. Delete a SSH key pair"
	echo "4. Clear Screen"
	echo "5. Exit"
	printf "\n"

	read answer

	if [ $answer -eq 1 ]
	then
		createNewKeyPair
	elif [ $answer -eq 2 ]
	then
		viewAllKeyPair
	elif [ $answer -eq 3 ]
	then
		deleteKeyPair
	elif [ $answer -eq 4 ]
	then
		clear
	else
		echo "Ending.."
		exit
	fi
done
