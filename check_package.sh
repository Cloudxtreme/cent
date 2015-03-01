#!/bin/bash

# Package checking for each node on the cluster using Cerberus test code

thesis_directories="/mnt/SLURM/GitHub"

function check_package
{
if yum -qq install $pkg; then
    echo "Successfully installed $pkg"
else
    echo "Error installing $pkg"
fi
}


pkg="htop"
check_package

pkg="ImageMagick"
check_package

pkg="GraphicsMagick"
check_package

pkg="tree"
check_package

pkg="stress"
check_package

pkg="mencoder"
check_package

pkg="ffmpeg"
check_package


cd $thesis_directories/cent
git pull
echo "Cent updated"


cd $thesis_directories/senior_thesis
git pull
echo "senior_thesis updated"

cd $thesis_directories/cerberus
git pull
echo "cerberus"
