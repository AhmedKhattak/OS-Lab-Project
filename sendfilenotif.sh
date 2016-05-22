#!/bin/bash
#OS LAB PROJECT 
#Group Members Ahmed Rafiullah 01-134132-016 , Ahmed Siddiqui 01-134132-014
#Gmail settings must be configured before using this script
#this script has not been tested in networks behind proxies
#find largest file by sorting within the limit here limit is 100mb in bytes because of poisx rules
FILES=$(find . -maxdepth 1  -size +102400000c -printf 'File : %p  Size: %s\n'|sort -nr|head -n  1)
#file_details=$(echo $FILES | tr " " "\n")
# script to send email using ssmpt
# email subject
SUBJECT="File Size Exceeded"
# Email To ?
EMAIL="khattak.ahmed@yahoo.com" #the mail used here must be same as the one  used in the ssmtp line
# Email text/message
EMAILMESSAGE="/tmp/emailmessage.txt" # create file in temp directory
echo "To: ahmedmassod007@gmail.com
From: bahria.test016@gmail.com
Subject: Sent from a terminal!

$FILES has exceeded its size limit please deal with it.
"> $EMAILMESSAGE
echo "End Transmission" >>$EMAILMESSAGE
echo "Sending..."
echo "\n\n" >>$EMAILMESSAGE #need new line to simulatectrl-d as it is required to send the mail from ssmtp
#this mail here notice the ssmtp and the one in the message is same
ssmtp "ahmedmassod007@gmail.com"  < $EMAILMESSAGE #send input to ssmtp to send email
echo "Done." 
