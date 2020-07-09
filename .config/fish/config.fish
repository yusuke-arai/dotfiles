# Replace the process to tmux
if [ -z "$TMUX" -a x"$TERM" != x"screen" ]
    which tmux && exec tmux -u
end
