
#!/bin/sh
#
# print total memory usage in percent of each user logged in

set -e

TOTAL=$(free | awk '/Mem:/ { print $2 }')


for USER in $(getent passwd | awk -F ":" '{print $1}' | sort -u)
#for USER in $(who | awk '{print $1}' | sort -u)
do
    ps hux -U $USER | awk -v user=$USER -v total=$TOTAL '{ sum += $6} END { printf "%s %.2f\n", user, sum / total * 100; }'
done





