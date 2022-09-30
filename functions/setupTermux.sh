#!/bin/bash

setupTermux(){
	export DEBIAN_FRONTEND=noninteractive
	apt-get update && 
		apt-get -o "Dpkg::Options::=--force-confold"  upgrade -q -y --force-yes &&
		apt-get -o "Dpkg::Options::=--force-confold"  dist-upgrade -q -y --force-yes
	pkg autoclean
	pkg update -y && pkg upgrade -y
	pkg install git wget jq rsync unzip whiptail binutils build-essential liblz4 libuv ninja -y
	
	FOLDER=~/storage
	if [ ! -d "$FOLDER" ]; then	
		termux-setup-storage
	fi
	
}