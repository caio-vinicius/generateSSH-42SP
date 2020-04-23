#!/bin/bash

echo " - Generate SSH key..."
mkdir -p keys
ssh-keygen -b 2048 -t rsa -f ./keys/sshkey -N "" -q
mv keys/sshkey.pub keys/public_key.pub && mv keys/sshkey keys/private_key
if [[ -s keys/public_key.pub ]] && [[ -s keys/private_key ]]; then
	echo -e "\e[32m - SSH successful created!\e[0m"
	cp keys/public_key.pub ~/.ssh/id_rsa.pub
	cp keys/private_key ~/.ssh/id_rsa
	cat keys/public_key.pub | xclip -selection clipboard
	echo -e "\e[34m - Key is already on your CTRL+V, enjoy:"
	echo -e " - Go to profile.intra.42.fr > Settings > SSH Key > New SSH Key > CTRL + V\e[0m"
	echo " - If it isnt, you can copy here: "
	cat keys/public_key.pub
	echo -e "\e[31m - DISCLAIMER: 2 keys was generated, above is the public key that locate at keys/public_key.pub. The private key locate at keys/private_key dont never share with anyone.\e[0m"
else
	echo -e "\e[41mSomething went wrong, I couldn't generate your SSH key."
fi
