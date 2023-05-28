#!/bin/bash

#####
#
# Project       : Poor man's parental control - script for user to display his time left
# Started       : August 27, 2017
# Last Modified : August, 2017
# Author        : Thomas Baeckeroot
# Module        : parentalcontrol_display_time.sh
# Description   : Script for user to display his time left

#/.../ParentalControl/display_time_left_once.sh
# Basic script to be called by user to display his time left
# TODO Just the general idea here. Still to be streamlined
# TODO Install script should copy it to some place like /usr/bin/
VICTIM=$USER
#TIME_LEFT_FILE=/root/$VICTIM-time-left.cfg
TIME_LEFT_FILE_FOR_USER=/tmp/$VICTIM-time-left.cfg
TIME_LEFT=`cat $TIME_LEFT_FILE_FOR_USER`

STR_REM_HOUR=$((TIME_LEFT / 60))
STR_REM_MIN=$((TIME_LEFT % 60))
if [ $STR_REM_HOUR -eq 0 ]
then
  STR_REM="$STR_REM_MIN minute(s)"
else
  STR_REM="$STR_REM_HOUR h $STR_REM_MIN minute(s)"
fi
STR_REM_TIME="Remaining time:"
STR_MIN_LEFT="$STR_REM\nleft for the week."
if [ "${LANG:0:2}" == "fr" ]
then
	STR_REM_TIME="Temps restant:"
	STR_MIN_LEFT="$STR_REM\npour la semaine."
fi

echo "User $USER"
echo "$STR_REM_TIME"
echo "$STR_MIN_LEFT"
notify-send -t 10000 -i gtk-info "$STR_REM_TIME" "$STR_MIN_LEFT"

