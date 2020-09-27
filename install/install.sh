#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y xlsx2csv

sudo apt install catdoc

cd ..
cd src
cp retrieve.service ../../etc/systemd/system

cd ../../etc/systemd/system

chmod u+x retrieve.service

sudo su
./retrieve.service
exit

sudo systemctl enable retrieve
sudo systemctl start retrieve
