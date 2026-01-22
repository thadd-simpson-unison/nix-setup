#!/bin/sh

# Launch apps and send output to the void
google-chrome-stable > /dev/null 2>&1 &
codium > /dev/null 2>&1 &
slack > /dev/null 2>&1 &

# Tell the terminal it no longer "owns" these processes
disown

# Kill the terminal/shell session
exit
