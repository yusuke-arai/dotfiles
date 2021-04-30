# Replace the process to tmux
if [ -z "$TMUX" -a x"$TERM" != x"screen" ]
    switch "$WSLENV"
        case 'VSCODE*'
            /bin/true # do nothing
        case '*'
            which tmux && exec tmux -u
    end
end
