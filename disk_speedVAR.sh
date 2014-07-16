#!/bin/bash
 
# Jordan Westhoff, RIT 2014
 
read -p "Batch size for test (enter in MB) {1024MB in a GB}" sze
 
echo "Testing Disk Speed"
echo "$sze MB sample size"
 
  dd if=/dev/zero of=test bs=1048576 count=$sze
  dd if=test of=/dev/null bs=1048576
 
echo "Disk Speed Check Complete"
