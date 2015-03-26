#!/bin/bash
MY_PATH=$(readlink -f $0)
MY_PATH=`dirname $MY_PATH`
echo $MY_PATH
COUNTER=0
while [ $COUNTER -lt 4 ]; do
    let P=COUNTER+1
    $MY_PATH/p-timer.sh 25 "Pomodoro $P/4" "Pomodoro started, you have 25 minutes" "Pomodoro ended." 
    if [ $COUNTER -lt 3 ]; then
        $MY_PATH/p-timer.sh 5 "Brake" "Short brake started (5 minutes)" "Brake ended.\nClick Yes to continue with the next Pomodoro"
    
        if zenity --question --text "Continue with another Pomodoro?\n\n(You have completed $P out of 4)"; then
            echo "Ok, otro pomodoro"
        else
            exit
        fi
    fi
    let COUNTER=COUNTER+1
done
zenity --info --text="You've completed 4 pomodoros,\ntake a long brake (15-30 minutes).\n\nThen you can restart this cycle (it's not automatic)."
