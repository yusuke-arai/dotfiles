# For Mac OS
if [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
  source /usr/local/etc/bash_completion.d/git-prompt.sh
fi

# PS1
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

  if [ "$(type -t __git_ps1)" = "function" ]; then
    local git_info=${color_cyan}'`__git_ps1 " (%s)"`'
  fi
  echo -n '\n'${color_green}'\u@\h '${color_yellow}'\w'${git_info}${color_default}'\n$ '
}
PS1=$(ps1)

# Binaries of haskell programs
export PATH=~/.local/bin:$PATH
