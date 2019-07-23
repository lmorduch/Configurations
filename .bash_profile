### Custom Coloring ###
# custom prompt #
PS1="\033[0;36m\][\033[0;35m\]\$(date +%Y-%m-%d)\033[0;36m\]][\033[0;32m\]\$(date +%H:%M:%S):\[\033[33m\]\w\[\033[36m\]]\[\033[31m\] \u\$\n\[\033[37m\]"

#colors for ls
export CLICOLOR=1

export LSCOLORS=bxfxDxdxcxegedagagacad

### aliases ###
alias pyclean="find . -name '*.pyc' -delete"
alias logclean="find . -name '*.log' -delete"

alias agi="ag -i --context"

alias fname="find . -name"

alias emacs="emacs -nw"

alias adag="adb logcat | ag"

dockin() {
    docker exec -it "$1" /bin/bash
}

### history stuff ###
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
    if [ $# -eq 0 ]; then
        open .;
    else
        open "$@";
    fi;
}

# Python pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

### Path stuff ###
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

source ~/git-completion.bash

### NVM ###
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
