#!/bin/bash

echo "Testing Disk Speed"
echo "2 GB sample size"

dd if=/dev/zero of=test bs=1048576 count=2048

dd if=test of=/dev/null bs=1048576

echo "Complete"


