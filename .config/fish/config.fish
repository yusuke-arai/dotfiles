# Create temporary files if running on WSL
if test -n "$WSLENV"
    sudo systemd-tmpfiles --create
end

if test -d "$HOME/.cargo"
    source "$HOME/.cargo/env.fish"
end

if test -d "$HOME/.volta"
    set -gx VOLTA_HOME "$HOME/.volta"
    fish_add_path "$VOLTA_HOME/bin"
end

if test -d "$HOME/.dotnet/tools"
    fish_add_path "$HOME/.dotnet/tools"
end

if test -d "$HOME/.local/bin"
    fish_add_path "$HOME/.local/bin"
end

