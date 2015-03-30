#! /bin/bash

# Send mails (http://www.raspberry-projects.com/pi/software_utilities/email/ssmtp-to-send-emails)
echo "Installing softwares to send mails"
sudo apt-get install ssmtp
sudo apt-get install mailutils

TmpFile=/tmp/mailsetup.tmp
ConfigFile=/etc/ssmtp/ssmtp.conf

touch $TmpFile

Entries=(root mailhub hostname AuthUser AuthPass FromLineOverride UseSTARTTLS)
Values=(postmaster "$PI_SMTP_ADDRESS:$PI_SMTP_PORT" raspberrypi "$PI_MAIL" "$PI_MAILPWD" YES YES)

echo "Softwares installed. Configuring..."
for index in ${!Entries[*]}
do
    sudo sed -i "s/${Entries[$index]}=.*/${Entries[$index]}="${Values[$index]}"/w $TmpFile" $ConfigFile
    if [ -s $TmpFile ]; then
        echo "Modifying the entry: ${Entries[$index]}"
        cat /dev/null > $TmpFile
    else
       echo "Adding the entry: ${Entries[$index]}"
       echo "${Entries[$index]}=${Values[$index]}" >> $ConfigFile
    fi
done

rm $TmpFile

# Receive mails (http://www.raspberry-projects.com/pi/software_utilities/email/fetchmail-to-receive-email)
echo "Installing softwares to fetch mails"
sudo apt-get install fetchmail

echo "Softwares installed. Configuring..." 
ParserFile="./mail/mailparser.sh"
FetcherFile="~/.fetchmailrc"

cp ./mail/.fetchmailrc $FetcherFile
sudo chown pi $FetcherFile
sudo chown pi $ParserFile
chmod +x $FetcherFile
chmod +x $ParserFile

sed -i "s/PI_MAILPWD/"$PI_MAILPWD"/g" $FetcherFile
sed -i "s/PI_MAIL/"$PI_MAIL"/g" $FetcherFile

#Missing: cron for regular mail fetch , real mail parser
