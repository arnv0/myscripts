#!/bin/zsh

# Split the current pane vertically (creating a right pane)
tmux split-window -h


# Get the pane IDs
LEFT_PANE=$(tmux list-panes -F "#{pane_id}" | sed -n '1p')
RIGHT_PANE=$(tmux list-panes -F "#{pane_id}" | sed -n '2p')

# In the right pane, run glances
tmux resize-pane -t $RIGHT_PANE -R 4
tmux send-keys -t $RIGHT_PANE 'glances' C-m

# In the left pane, run neofetch
tmux split-window -v -t $LEFT_PANE
tmux resize-pane -t $LEFT_PANE -D 9
tmux send-keys -t $LEFT_PANE 'neofetch' C-m

