#!/bin/bash

# This script is for Whisper VM's in order to make sure that they have write permissions on the shared directory.


FULL=$(hostname).$(dnsdomainname)
echo Hostname=$FULL

touch /mnt/SLURM/vm_test/$FULL.txt
