#!/bin/bash
#OS LAB PROJECT 
#Group Members Ahmed Rafiullah 01-134132-016 , Ahmed Siddiqui 01-134132-014
#Gmail settings must be configured before using this script
#this script has not been tested in networks behind proxies
#find largest file by sorting within the limit here limit is 100mb in bytes because of poisx rules
FILES="" #zero length variable needed for checking in later steps
FILES=$(find . -maxdepth 1 -name "video.mp4" -size +102400000c -printf 'File : %p  Size: %s\n'|sort -nr|head -n  1)
#file_details=$(echo $FILES | tr " " "\n")
# script to send email using ssmpt
# Email text/message
if [ -n "$FILES" ]; then  #checks that the string is non zero length it has been initialized as zero length
EMAILMESSAGE="/tmp/emailmessage.txt" # create file in temp directory
echo "To: recipient@yahoo.com
From: sender@gmail.com
Subject: Sent from a terminal!

$FILES has exceeded its size limit please deal with it.
"> $EMAILMESSAGE
echo "End Transmission" >>$EMAILMESSAGE
echo "Sending..."
echo $EMAILMESSAGE
cat  $EMAILMESSAGE #show the email message
echo "\n\n" >>$EMAILMESSAGE #need new line to simulatectrl-d as it is required to send the mail from ssmtp
#this mail here notice the ssmtp and the one in the message is same
ssmtp "recipient@yahoo.com"  < $EMAILMESSAGE #send input to ssmtp to send email
echo "ssmtp execution completed" #if there is any further output it will be displayed by ssmtp 
else
echo "Condition not set email not sent." 
fi
