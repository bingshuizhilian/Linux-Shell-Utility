#! /bin/bash

# case-menu: a menu driven system information program
clear
echo "
Please Select:
1. Display System Information
2. Display Disk Space
3. Display Home Space Utilization
q. Quit
"
read -n1 -p "Enter selection [0-3] > "

case $REPLY in
	q|Q) echo "Program terminated."; exit ;;
	1) echo "Hostname: $HOSTNAME"; uptime ;;
	2) df -h ;;
	3) if [[ $(id -u) -eq 0 ]]; then
		   echo "Home Space Utilization (All Users)"
		   du -sh /home/*
	   else
		   echo "Home Space Utilization ($USER)"
		   du -sh $HOME
	   fi
	   ;;
	*) echo "Invalid entry" >&2
	   exit 1
	   ;;
esac

# case: test a character
read -n 1 -p "Type a character > "
echo
case $REPLY in
[[:upper:]]) echo "'$REPLY' is upper case." ;;&
[[:lower:]]) echo "'$REPLY' is lower case." ;;&
[[:alpha:]]) echo "'$REPLY' is alphabetic." ;;&
[[:digit:]]) echo "'$REPLY' is a digit." ;;&
[[:graph:]]) echo "'$REPLY' is a visible character." ;;&
[[:punct:]]) echo "'$REPLY' is a punctuation symbol." ;;&
[[:space:]]) echo "'$REPLY' is a whitespace character." ;;&
[[:xdigit:]]) echo "'$REPLY' is a hexadecimal digit." ;;&
esac

