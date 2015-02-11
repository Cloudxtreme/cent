#!/bin/bash


read -p "Git REPO: " repo
read -p "Username: " un
read -p "Password: " pw

git clone https://$un:$pw@github.com/$un/$repo.git
