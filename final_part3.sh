#!/usr/bin/env bash
# Copyright (c) Hussein Anwer 5/13/2025
echo "section 3: docker and git"
cd /home/alice/docker_test
git init
echo "FROM ubuntu" >Dockerfile
echo "RUN apt-get update && apt-get install -y nginx" >>Dockerfile
#the trickiest aprt for me, I have been endlessly traumatized by this one specefic aspect of code, not just in this class but in
#another that has a similair issue which causes the whole code to break down 
echo "<html><body><h1>Hello</h1></body></html>" > index.html
echo '#!/bin/bash' >app.sh
echo 'linenum=$(($(cat *.html -n | tail -1 | awk '\''{print $1}'\'') - 2))' >> app.sh
# add  name and date 2 lines before the html ends'
echo 'sed -i "${linenum}i <p> This is the final exam submission of Hussein on May 13th </p>" *.html' >> app.sh
echo 'systemctl restart nginx' >>app.sh
chmod +x app.sh
git add Dockerfile app.sh index.html
git commit -m "added docker file and app.sh for Part 3"
