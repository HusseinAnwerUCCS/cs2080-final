#!/usr/bin/env bash
#copyright (c) Hussein Anwer may13, 2025
echo "a. kernel version being used : "
uname -r
echo "b. Linux distro in use:"
lsb_release -a | grep "Distributor ID"
echo "c. running bash version: "
bash --version | head -n 1
echo "d. scripts shell pid:"
echo $$
echo "e. file  perms:"
ls -l $0
