#!/bin/bash

read -p "Enter the username " i
adduser $i
#mkdir /home/$i/.ssh && chown $i:$i ./home/$i/.ssh      && chmod 700 /home/$i/.ssh

mkdir mkdir -p /home/$i/.ssh && chown -R $i:$i /home/$i/.ssh && chmod 700 /home/$i/.ssh && touch /home/$i/.ssh/authorized_key && chown -R $i:$i /home/$i/.ssh/authorized_keys && chmod 600 /home/$i/.ssh/authorized_key
