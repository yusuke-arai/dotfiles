# Use fish instead of Bash if exists
if [[ $WSLENV =~ VSCODE ]]; then
  : # do nothing
elif [ -f /usr/bin/fish ]; then
  exec /usr/bin/fish
fi

# History size
export HISTSIZE=10000
export HISTFILESIZE=10000

# Windows (Git Bash)
if [ x"$OS" = x"Windows_NT" ]; then
  export LANG=ja_JP.UTF-8
  if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    source /usr/local/etc/bash_completion.d/git-completion.bash
    source /usr/local/etc/bash_completion.d/git-prompt.sh
  fi
fi

# PS1
git_branch () {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ x"${branch}" != x"" ]; then
    echo -n ' ('${branch}')'
  fi
}

ps1 () {
  local color_default='\e[39m'
  local color_red='\e[31m'
  local color_green='\e[32m'
  local color_yellow='\e[33m'
  local color_blue='\e[34m'
  local color_magenta='\e[35m'
  local color_cyan='\e[36m'

  local bg_default='\e[49m'
  local bg_red='\e[41m'
  local bg_green='\e[42m'
  local bg_yellow='\e[43m'
  local bg_blue='\e[44m'
  local bg_magenta='\e[45m'
  local bg_cyan='\e[46m'

  local git_info=${color_yellow}'`git_branch`'
  echo -n '\n'${color_green}'\w'${git_info}${color_default}'\n$ '
}
PS1=$(ps1)

# Charset of less command
export LESSCHARSET=utf-8

# Colored ls
alias ls="ls --color"

# Poetry
if [ -d "$HOME/.poetry/bin" ]; then
  export PATH="$HOME/.poetry/bin:$PATH"
fi

# ~/.local/bin
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# Volta
if [ -d "$HOME/.volta" ]; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
fi

# .bashrc
if [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi

