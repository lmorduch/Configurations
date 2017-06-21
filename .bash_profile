### Custom Coloring ###
# custom prompt #
PS1="\[\033[0;36m\][\h:\[\033[33m\]\w\[\033[36m\]]\[\033[32m\] \u\$\n\[\033[37m\]"

#colors for ls
export CLICOLOR=1

export LSCOLORS=bxfxDxdxcxegedagagacad

### aliases ###
alias pyclean="find . -name '*.pyc' -delete"
alias logclean="find . -name '*.log' -delete"

alias agi="ag -i --context"

alias fname="find . -name"

alias rrm="~/.bin/trashit"

alias emacs="emacs -nw"

### history stuff ###
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

### custom functions ###
function swap()
{
    tmpfile=$(mktemp $(dirname "$1")/XXXXXX)
    mv "$1" "$tmpfile" && mv "$2" "$1" &&  mv "$tmpfile" "$2"
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
    if [ $# -eq 0 ]; then
        open .;
    else
        open "$@";
    fi;
    }

### Path stuff ###
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

### pyenv stuff ###
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
