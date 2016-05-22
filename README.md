# OS-Lab-Project
A shell script that sends mail when any file exceeds a size limit set by the user
check the ssmtp settings file it is configured for gmail "yourhostname" will be set automatically when you install ssmtp
Disable 2-step verification in your google account and enable less secure apps this is required https://www.google.com/settings/security/lesssecureapps

    Install ssmtp http://apt.ubuntu.com/p/ssmtp:
    sudo apt-get install ssmtp

    Edit the ssmtp config file:

    gksu gedit /etc/ssmtp/ssmtp.conf

    Append the following text:

    root=username@gmail.com
    mailhub=smtp.gmail.com:465
    rewriteDomain=gmail.com
    AuthUser=username
    AuthPass=password
    FromLineOverride=YES
    UseTLS=YES

    Run ssmtp and provide the recipient email address:

    ssmtp recepient_name@gmail.com

    Provide the message details as follows:

    To: recipient_name@gmail.com
    From: username@gmail.com
    Subject: Sent from a terminal!

    Your content goes here. Lorem ipsum dolor sit amet, consectetur adipisicing.
    (Notice the blank space between the subject and the body.)

    Press Ctrl + D to send.
