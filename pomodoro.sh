#!/bin/bash
MY_PATH=$(readlink -f $0)
MY_PATH=`dirname $MY_PATH`
echo $MY_PATH
COUNTER=0
while [ $COUNTER -lt 4 ]; do
    let P=COUNTER+1
    $MY_PATH/p-timer.sh 1 "Pomodoro $P/4" "Pomodoro started, you have 25 minutes" "Pomodoro ended." 
    $MY_PATH/p-timer.sh 1 "Brake" "Short brake started (5 minutes)" "Brake ended.\nClick Yes to continue with the next Pomodoro"
    if zenity --question --text "Continue?"; then
        echo "Ok, otro pomodoro"
        let COUNTER=COUNTER+1
    else
        exit
    fi
    sleep 2
done
zenity --info --text="You've completed 4 pomodoros,\ntake a long brake (15-30 minutes).\n\nThen you can restart this cycle (it's not automatic)."
