#! /bin/bash

FilenameUniqueId=$(date +"%Y%m%d_%H%M%S_%N")
OutputFile="/var/tmp/mail"$FilenameUniqueId
echo "" > $OutputFile
while read x
do 
#echo $x
echo $x >> $OutputFile
done
