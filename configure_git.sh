#!/bin/bash

# Record the username to be plugged in for GIT
read -p "GIT Username" un

# Start doing the work
echo "Configure git for: $un"
	git config --global user.name "$un"
	sleep 1
	git config --global user.email "$un@gmail.com"
	sleep 1
	git config --global credential.helper cache
	sleep 1
	git config --global credential.helper 'cache --timeout=3600'
	
echo "Git install and configuration: complete."
echo "WARNING: Git SSH will still need to be manually configured."
