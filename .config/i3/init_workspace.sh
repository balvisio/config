#!/bin/bash

# https://github.com/yedhink
# Feel free to share with your friends

# install wmctrl. Its a prerequisite to make this script work.

# Launch it in your i3 config file
# exec --no-startup-id ~/.config/i3/init_workspace.sh
#
# obviously, make it executable : # chmod +x init_workspace.sh
# HAVE FUN !

# App you want to start :
apps=(
 #if you're using urxvt then replace st with that   
  "google-chrome"
  "gnome-terminal"
  "slack"
  "idea.sh"
  "spotify --disable-gpu"
  "indicator-stickynotes"
    )

  # Which workspace to assign your wanted App :
workspaces=(
  "1:home"
  "1:home"
  "2:slack"
  "3:intelliJ"
  "4:spotify"
  "5:notes"
)

# counter of opened windows
owNB=0

# add paths of apps to array
arr=()
arr+=(
    '/usr/bin'
    '/usr/bin'
    '/usr/bin'
    '/home/balvisio/idea-IC-191.7479.19/bin'
    '/usr/bin'
    '/usr/bin'
)

windows=(
0
1
2
3
4
5
)

sleep_arr=(
0
0
0
0
0
0
)

for iwin in ${!apps[*]}
do
    while [ "$owNB" -lt ${windows[$iwin]} ] # wait before start other programs
    do
        owNB=$(wmctrl -l | wc -l) # Get number of actual opened windows
    done
    sleep ${sleep_arr[$iwin]}
    i3-msg workspace ${workspaces[$iwin]} # move in wanted workspace
    ${arr[$iwin]}/${apps[$iwin]} & # start the wanted app
done
sleep 5
i3-msg workspace ${workspaces[0]} # move in wanted workspace

####### ABSOLUTELY OPTIONAL ########
## inject message(s) into terminal (first one created : /dev/pts/0)

# wait a moment
sleep 4 
