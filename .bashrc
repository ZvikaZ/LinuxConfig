# .bashrc
echo '.bashrc'

export HOMEBREW_NO_ENV_FILTERING=1
eval $(/home/cluster/users/zvikah/.linuxbrew/Homebrew/bin/brew shellenv)
export XDG_DATA_DIRS="/home/cluster/users/zvikah/.linuxbrew/Homebrew/share:$XDG_DATA_DIRS"

# it just gives stupid errors, I'm not it's useful at all
#Z # Source global definitions
#Z if [ -f /etc/bashrc ]; then
#Z         . /etc/bashrc
#Z fi

# expand environment variable when used for directories
# https://superuser.com/questions/604109/bash-variable-name-not-being-expanded-with-tab-completion
shopt -s direxpand

# User specific aliases and functions
source ~/.aliases

export PATH="/home/cluster/users/zvikah/bin:$PATH"
export PATH="/home/cluster/users/zvikah/temp/tigervnc-1.10.1.x86_64/usr/bin:$PATH"
export PATH="/home/cluster/users/zvikah/tools/vim/bin:$PATH"
export PATH="/home/cluster/users/zvikah/tools/icewm/bin:$PATH"

export EDITOR="/home/cluster/users/zvikah/tools/vim/bin/vim"
export PS1="[\w]\\$ "

# actually, it affects only xfce-terminal tab headings
export PROMPT_COMMAND='printf "\033]0;%s\007" "${PWD/#$HOME/~}"'

export CDA='/home/cluster/users/zvikah'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/users/studs/msc/zvikah/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/users/studs/msc/zvikah/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/users/studs/msc/zvikah/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/users/studs/msc/zvikah/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# remove duplicates from PATH
# taken from https://unix.stackexchange.com/questions/40749/remove-duplicate-path-entries-with-awk-command
PATH=`printf %s "$PATH" | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'`


