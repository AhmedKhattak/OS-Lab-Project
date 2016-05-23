#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/sendfilenotif.sh
#OS LAB PROJECT 
#Group Members Ahmed Rafiullah 01-134132-016 , Ahmed Siddiqui 01-134132-014
#Gmail settings must be configured before using this script
#this script has not been tested in networks behind proxies
#find largest file by sorting within the limit here limit is 100mb in bytes because of poisx rules
OUTPUT="maillog.txt"
FILES=""
FILES=$(find . -maxdepth 1 -name "video.mp4" -size +102400000c -printf 'File : %p  Size: %s\n'|sort -nr|head -n  1)
#file_details=$(echo $FILES | tr " " "\n")
# script to send email using ssmpt
# Email text/message
if [ -n "$FILES" ]; then  #checks that the string is non zero length it has been initialized as zero length
EMAILMESSAGE="/tmp/emailmessage.txt" # create file in temp directory
echo "To: khattak.ahmed@yahoo.com
From: bahria.test016@gmail.com
Subject: Sent from a terminal!

$FILES has exceeded its size limit please deal with it.
"> $EMAILMESSAGE
echo "End Transmission" >>$EMAILMESSAGE
echo "Sending...">>$OUTPUT
echo $EMAILMESSAGE
cat  $EMAILMESSAGE>>$OUTPUT #show the email message
echo "\n\n" >>$EMAILMESSAGE #need new line to simulatectrl-d as it is required to send the mail from ssmtp
#this mail here notice the ssmtp and the one in the message is same
ssmtp "khattak.ahmed@yahoo.com"  < $EMAILMESSAGE #send input to ssmtp to send email
echo "ssmtp execution completed">>$OUTPUT
else
echo "Condition not set email not sent.">>$OUTPUT 
fi
echo " ">>$OUTPUT
echo " ">>$OUTPUT
