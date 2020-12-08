#
# ~/.bashrc
#

### SET VI MODE IN BASH ###
set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vue='cd Cursos-Video/ct_vue-cli/'
alias bot='cd 1core/botcore/connectWss/'
PS1='[\u@\h \W]\$ '

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# Bash powerline
source ~/.bash-powerline.sh

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# colorscript random
neofetch random

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/hotratx/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/hotratx/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/hotratx/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/hotratx/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

