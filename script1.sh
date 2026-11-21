#!/bin/bash
if [ -z $1]
then
      echo "usage is $0 <num>"
      exit 0
fi
echo "The last failed login attempt came from ip address"
grep -i "disconnected from" /var/log/auth.log|tail -1 |cut -d: -f4|cut -f7 -d" "
echo "user:$USER in dir: $PWD"
LOG="/var/log/auth.log"
echo "logs:$LOG..."
P="user"
echo "top $1 attackers:"
grep -i "$P" $LOG | cut -d : -f 4 | cut -d " " -f 7 |  sort | uniq -c | sort -nr | head -$1
