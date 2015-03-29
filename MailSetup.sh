#! /bin/bash

# Send mails
sudo apt-get install ssmtp
sudo apt-get install mailutils

# Receive mails
sudo apt-get install fetchmail
cp ./mail/.fetchmailrc ~/.fetchmailrc
sudo chown pi ~/.fetchmailrc
sudo chown pi ./mail/mailparser.sh
sudo chmod +x ~/.fetchmailrc
sudo chmod +x ./mail/mailparser.sh
