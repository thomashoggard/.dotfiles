#!/bin/bash

SESSION="league-web"
# DIR=$(~/repos/league-web/)

# Cleanup environment before restarting.

echo Killing Docker Containers
docker container kill $(docker container ls -q)
tmux kill-session -t $SESSION

cd ~/repos/league-web

tmux new-session -d -s $SESSION 

# Code
tmux rename-window -t $SESSION code 
tmux send-keys -t code 'vi .' C-m 

# Servers
cd ~/repos/league-web/apps/league-b2b

## widget runner
tmux new-window -t league-web -n servers 
tmux send-keys -t $SESSION:servers 'npm run wr' C-m

## main app 
tmux split-pane -t $SESSION:servers 
tmux send-keys -t $SESSION:servers 'npm start' C-m

## nginx
tmux split-pane -t $SESSION:servers 
tmux send-keys -t $SESSION:servers 'npm run nginx' C-m

## onboarding module 
cd ~/repos/league-web/modules/onboarding
tmux split-pane -t $SESSION:servers 
tmux send-keys -t $SESSION:servers 'npm start' C-m

# Terminal
tmux new-window -n terminal

# Everything is setup and ready to begin, connect to the session!
tmux attach-session -t $SESSION:code
