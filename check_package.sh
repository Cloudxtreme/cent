#!/bin/bash

function check_package
{
if yum -qq install $pkg; then
    echo "Successfully installed $pkg"
else
    echo "Error installing $pkg"
fi
}
