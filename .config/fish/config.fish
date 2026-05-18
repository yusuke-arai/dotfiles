# Create temporary files if running on WSL
if [ -n "$WSLENV" ]
    sudo systemd-tmpfiles --create
end

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.dotnet/tools
source "$HOME/.cargo/env.fish"
