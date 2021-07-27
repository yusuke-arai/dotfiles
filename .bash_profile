# History size
export HISTSIZE=10000
export HISTFILESIZE=10000

# For Mac OS
if [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
  source /usr/local/etc/bash_completion.d/git-prompt.sh
fi

# For Arch Linux
if [ -f /usr/share/bash-completion/bash_completion ]; then
  source /usr/share/bash-completion/bash_completion
  source /usr/share/bash-completion/completions/git
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

  local git_info=${color_cyan}'`git_branch`'
  echo -n '\n'${color_green}'\u@\h '${color_yellow}'\w'${git_info}${color_default}'\n$ '
}
PS1=$(ps1)

# Binaries of haskell programs
echo $PATH | tr : "\n" | grep ~/.local/bin > /dev/null
if [ $? -ne 0 ]; then
  export PATH=~/.local/bin:$PATH
fi

# Charset of less command
export LESSCHARSET=utf-8

# Colored ls
alias ls="ls --color"

# .bashrc
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# fish
if [[ $WSLENV =~ VSCODE ]]; then
  : # do nothing
else
  exec /usr/bin/fish
fi

export PATH="$HOME/.poetry/bin:$PATH"
