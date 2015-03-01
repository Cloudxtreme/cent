#!/bin/bash

# Package checking for each node on the cluster using Cerberus test code



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
