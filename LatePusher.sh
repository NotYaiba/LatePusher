#!/bin/sh

function screenIsLocked { [ "$(/usr/libexec/PlistBuddy -c "print :IOConsoleUsers:0:CGSSessionScreenIsLocked" /dev/stdin 2>/dev/null <<< "$(ioreg -n Root -d1 -a)")" = "true" ] && return 0 || return 1; }

DIRECTORY="/goinfre/melkarmi/42Cursus-ft_transcendence"

function pushToGit {
    cd "$DIRECTORY" ; git pull origin front-end  ; git add . ;  git commit -m "Late Pusher Push You are Welcome | $now" ; git push origin front-end
}
while :
do
	
    if screenIsLocked; then
        echo "Screen locked"
        now="$(date +"%r")"
        pushToGit
        break 
    fi
	sleep 5
done
