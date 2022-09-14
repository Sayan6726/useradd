#!/bin/bash

if [ $(id -u) -eq 0 ]; then
        read -p "Enter username : " username
        read -s -p "Enter password : " password
        egrep "^$username" /etc/passwd >/dev/null
        if [ $? -eq 0 ]; then
                echo "$username exists!"
                exit 1
        else
                pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
                useradd -m -p "$pass" "$username" && mkdir -p /home/$username/.ssh && chown -R $username:$username /home/$username/.ssh && chmod 700 /home/$username/.ssh && touch /home/$username/.ssh/authorized_key && chown -R $username:$username /home/$username/.ssh/authorized_keys && chmod 600 /home/$username/.ssh/authorized_key
                [ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
        fi
else
        echo "Only root may add a user to the system."
        exit 2
fi
