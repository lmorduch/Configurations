#custom prompt
PS1="\[\033[0;36m\][\h:\[\033[33m\]\w\[\033[36m\]]\[\033[32m\] \u\$\n\[\033[37m\]"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#colors for ls
export CLICOLOR=1

export LSCOLORS=bxfxDxdxcxegedagagacad

# oz commands
source ~/oz/oz_app/curl/command_helpers.sh                                   

# clean up emacs backups for ruby files
alias cleanrb rm -r *.rb# *.rb~
