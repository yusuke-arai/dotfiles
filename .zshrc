# Replace the process to tmux
if [[ -o INTERACTIVE && -z "$TMUX" && x"$TERM" != x"screen" ]]; then
    which tmux && exec tmux
fi

# History
HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups

# cd
setopt auto_cd
setopt auto_pushd

# Correct command
setopt correct

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# PS1
setopt PROMPT_SUBST

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

  local git_info=${color_cyan}'$(git_branch)'
  echo -n '\n'${color_green}'%n@%m '${color_yellow}'%~'${git_info}${color_default}'\n$ '
}
PROMPT=$(ps1)

# Binaries of haskell programs
echo $PATH | tr : "\n" | grep ~/.local/bin > /dev/null
if [ $? -ne 0 ]; then
  export PATH=~/.local/bin:$PATH
fi

# Charset of less command
export LESSCHARSET=utf-8

# Colored ls
alias ls="ls --color"

