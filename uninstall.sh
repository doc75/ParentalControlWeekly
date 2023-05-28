#!/bin/bash

#####
#
# Project       : Poor man's parental control - uninstall scripts
# Started       : August 27, 2017
# Last Modified : August, 2017
# Author        : Thomas Baeckeroot
# Module        : uninstall.sh
# Description   : Uninstalls the "Poor man's parental control" from the computer.

set +x
echo "- Uninstall scripts for Parental Time Control -"
echo
echo "This script will remove files and remove"
echo "configuration -crontab- from your system."
echo
echo "Check if limit-usage-time.sh has been added to cron..."
sudo crontab -l | grep limit-usage-time.sh > /dev/null
if [ "$?" == "0" ]; then
	echo "Parental control script in cron. Removing..."
        sudo crontab -l | grep -v MAILTO | grep -v /root/pc_week/limit-usage-time.sh > /tmp/modified_crontab.cron
        # Programming crontab back without limit-usage-time.sh:
        sudo crontab /tmp/modified_crontab.cron
else
	echo "limit-usage-time.sh not detected in cron, no need to remove."
fi
echo
ADMIN=`sudo cat /root/pc_week/parental_control_admin.cfg`
echo "Deleting /root/pc_week ..."
sudo rm -rf /root/pc_week/

USERS_AND_TIMES_FILE=/home/$ADMIN/users_and_times.cfg
echo "Moving to trash $USERS_AND_TIMES_FILE ..."
sudo rm $USERS_AND_TIMES_FILE
#echo $?
echo "Terminated."
exit 0

