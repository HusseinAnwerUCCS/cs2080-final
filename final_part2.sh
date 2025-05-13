#!/usr/bin/env bash
# Copyright (c) Hussein Anwer may 13 2025
echo "section 2:filesystem and perms section"
echo "2a create users like alice and bob and adding them to group"
sudo addgroup test_users
sudo useradd -m alice
sudo useradd -m bob
sudo usermod -aG test_users alice
sudo usermod -aG test_users bob
echo "groups for alice :"
sudo groups alice
echo "groups for bob : "
sudo groups bob
echo "2b make  3 files and 1 directory inside home/alice : "
echo "alice.txt bob.txt both.txt"
echo "docker_test directory"
sudo touch /home/alice/alice.txt
sudo touch /home/alice/bob.txt
sudo touch /home/alice/both.txt
sudo mkdir /home/alice/docker_test
echo " created files:"
sudo ls -l /home/alice
echo "2c change file owner and group assoc"
echo "giving ownership of alice.txt and both.txt to alice"
sudo chown alice /home/alice/alice.txt
sudo chown alice /home/alice/both.txt
echo "give ownership of bob.txt to bob"
sudo chown bob /home/alice/bob.txt
echo "change group of docker_test to test_users"
sudo chgrp test_users /home/alice/docker_test
echo " all listed perms of files and directory after ownership changes: "
sudo ls -l /home/alice
echo "2d set the acl perms for bob to access alice.txt"
echo "switch to to alice to write sample line into alice.txt"
sudo -u alice bash -c 'echo " thsi is a test line from alice " > /home/alice/alice.txt'
sudo chown alice:test_users /home/alice/alice.txt
sudo chmod 770 /home/alice/alice.txt
sudo chmod 751 /home/alice

echo "giving bob read+write access to alice.txt with setfacl"
sudo setfacl -m u:bob:rw /home/alice/alice.txt
echo "show the current acl entries for alice.txt"
sudo getfacl /home/alice/alice.txt
echo "switch to bob to test access"
sudo -u bob bash -c 'cat /home/alice/alice.txt'


