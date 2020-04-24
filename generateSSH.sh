#!/bin/bash

show_public_key()
{
	ssh-keygen -y -f $1 | xclip -selection clipboard &> /dev/null
	echo " - Key is already on your CTRL + V, enjoy."
	echo " - If it isn't on your CTRL + V yet, you can copy here: "
	echo -e "\e[1m === START KEY === \e[0m"
	ssh-keygen -y -f $1
	echo -e "\e[1m === END KEY === \e[0m"
	echo " - Go to profile.intra.42.fr > Settings > SSH Key > New SSH Key > CTRL + V."	
}

generate_ssh()
{
	ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -N "" -q <<< y &> /dev/null
	if [[ -s ~/.ssh/id_rsa.pub ]] && [[ -s ~/.ssh/id_rsa ]]; then
		echo -e "\e[32m - SSH successful created!\e[0m"
		show_public_key ~/.ssh/id_rsa
	else
		echo -e "\e[41mSomething went wrong, I couldn't generate your SSH key."
	fi
}

choose_option()
{
	if [[ $1 = "yes" || $1 = "y" || $1 = "YES" || $1 = "Y" ]]; then
		$2
	elif [[ $1 = "no" || $1 = "n" || $1 = "NO" || $1 = "N" ]]; then
		$3 $4
	else
		echo " - I can't understand what you're saying."
	fi
}

echo " - Working on SSH pair key..."
if [[ -s ~/.ssh/id_rsa && -s ~/.ssh/id_rsa.pub ]]; then
	echo " - Seems like you alredy have SSH pair keys on your system."
	read -p " - Did you want generate a new pair? If don't I will extract your public key (yes/no): " option
	choose_option $option generate_ssh show_public_key ~/.ssh/id_rsa
else
	generate_ssh
fi
