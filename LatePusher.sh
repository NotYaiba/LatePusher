


function screenIsLocked { [ "$(/usr/libexec/PlistBuddy -c "print :IOConsoleUsers:0:CGSSessionScreenIsLocked" /dev/stdin 2>/dev/null <<< "$(ioreg -n Root -d1 -a)")" = "true" ] && return 0 || return 1; }



function pushToGit {
    cd "$DIRECTORY" ; git pull origin front-end  ; git add . ;  git commit -m "Late Pusher Push You are Welcome | $now" ; git push origin front-end
}
function isGitRepo {
    git -C $DIRECTORY   rev-parse
    if [ $? == 0 ]
        then
            return 1;
        else
            return 0;
    fi
}
function LatePusher {
   
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
}


if [ $# -eq 1 ] 
    then
        DIRECTORY=$1
    else
        echo "Pass the path of the directory that you wanna LatePush!"
         
    echo "shit"
    if isGitRepo; then
        LatePusher
    else
        echo "This is not a giit repo"
    fi
fi