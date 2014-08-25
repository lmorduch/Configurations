#custom prompt
PS1="\[\033[0;36m\][\h:\[\033[33m\]\w\[\033[36m\]]\[\033[32m\] \u\$\n\[\033[37m\]"

#colors for ls
export CLICOLOR=1

export LSCOLORS=bxfxDxdxcxegedagagacad

# clean up emacs backups for ruby files
alias cleanrb rm -r *.rb# *.rb~
