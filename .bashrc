#
# ~/.bashrc
#
### Set vi mode in bash
set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

PS1='(myenv)[\u@\h \W]\$ '

# Exa
alias exa='exa -l --icons'

source ~/.bash-powerline.sh

export PATH=~/.local/bin:$PATH
export PATH="$HOME/.poetry/bin:$PATH"
export PYTHONPATH=~/dev/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init bash)"

source ~/.local/share/icons-in-terminal/icons_bash.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
