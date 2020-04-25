#!/bin/bash

color_message()
{
	echo -e "\033[$1m - $2\033[0m"
}

show_public_key()
{
	color_message 92 "Done"
	ssh-keygen -y -f $1 | xclip -selection clipboard &> /dev/null
	echo " - Key is already on your CTRL + V, enjoy."
	echo " - Maybe it isn't on your CTRL + V yet, so you can copy here: "
	color_message 1 " === START KEY === "
	ssh-keygen -y -f $1
	color_message 1 " === END KEY === "
	echo " - Go to profile.intra.42.fr > Settings > SSH Key > New SSH Key > CTRL + V."	
}

generate_ssh()
{
	ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -N "" -q <<< y &> /dev/null
	if [[ -s ~/.ssh/id_rsa.pub ]] && [[ -s ~/.ssh/id_rsa ]]; then
		show_public_key ~/.ssh/id_rsa
	else
		color_message 91 "Something went wrong, I couldn't generate your SSH key."
	fi
}

choose_option()
{
	read -p " - $1 " option
	if [[ $option = "yes" || $option = "y" || $option = "YES" || $option = "Y" ]]; then
		$2
	elif [[ $option = "no" || $option = "n" || $option = "NO" || $option = "N" ]]; then
		$3 $4
	else
		color_message 91 "I can't understand what you're saying."
	fi
}

if [[ -s ~/.ssh/id_rsa && -s ~/.ssh/id_rsa.pub ]]; then
	color_message 91 "Seems like you alredy have SSH pair keys on your system."	
	choose_option "Did you want generate a new pair? If don't I will extract your public key (yes/no):"  generate_ssh show_public_key ~/.ssh/id_rsa
else
	generate_ssh
fi
