#!/bin/bash
echo "[!] \n This won't work if you don't have git, brew, docker, Chromium, and ruby installed. I didn't want to make it smart enough to check \n [!]"
git clone https://github.com/justinlarson/web-app-hacking-workshop-solutions.git &
brew install hydra mysql python3 &
git clone https://github.com/sqlmapproject/sqlmap.git &
git clone https://github.com/danielmiessler/SecLists.git &
git clone https://github.com/nccgroup/autochrome.git &
ruby autochrome/autochrome.rb
open ~/Applications/Chromium.app &
git clone https://github.com/sethlaw/vtm.git 
brew services start mysql
mysqladmin -u root create vtmdb
cd vtm
pip3.7 install -r requirements.txt
python3 manage.py migrate
python3 manage.py loaddata taskManager/fixtures/*
python3 manage.py runserver & 
docker run --detach --rm -it -p 80:80 cyrivs89/web-dvws &
docker pull bkimminich/juice-shop
docker run --detach --rm -p 3000:3000 bkimminich/juice-shop
