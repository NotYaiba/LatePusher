#!/bin/sh
/bin/rm -rf ~/.LatePusher.sh  > /dev/null 2>&1


curl -fsSL https://raw.githubusercontent.com/NotYaiba/LatePusher/master/LatePusher.sh > ~/.LatePusher.sh

chmod +x ~/.LatePusher.sh
echo "alias LatePusher="$HOME/.LatePusher.sh"" >> $HOME/.zshrc
# source ~/.zshrc
# echo "source ~/.LatePusher.sh" >> $HOME/.zshrc
