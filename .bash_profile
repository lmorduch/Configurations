#custom prompt                                                                                                                                                                                                                                
PS1="\[\033[0;36m\][\h:\[\033[33m\]\w\[\033[36m\]]\[\033[32m\] \u\$\n\[\033[37m\]"

#colors for ls                                                                                                                                                                                                                                
export CLICOLOR=1

export LSCOLORS=bxfxDxdxcxegedagagacad

#JANA venv setup                                                                                                                                                                                                                              
source ~/venvs/jana2/bin/activate

alias acki="ack --ignore-file=ext:json --ignore-file=ext:txt --ignore-file=ext:csv --ignore-file=ext:log --ignore-dir=Sputnik/sputnik/static/dist/ -i -r --ignore-file=ext:coverage --ignore-dir=coverage --ignore-dir=sputnik/static/dist/ -\
-ignore-dir=selenium -C 1"

export WORKON_HOME=~/Envs

alias pyclean="find . -name '*.pyc' -delete"

alias agi="ag -i --context"

alias fname="find . -name"
##                                                                                                                                                                                                                                            
# Your previous /Users/lmorduch/.bash_profile file was backed up as /Users/lmorduch/.bash_profile.macports-saved_2015-01-03_at_16:09:27                                                                                                       
##                                                                                                                                                                                                                                            

# MacPorts Installer addition on 2015-01-03_at_16:09:27: adding an appropriate PATH variable for use with MacPorts.                                                                                                                           
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.                                                                                                                                                                     

alias java6="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/bin/java"

alias "do_camus"="java6 -cp target/camus-tools-1.3-SNAPSHOT.jar com.linkedin.camus.etl.kafka.CamusJob -P camus.properties"

alias "do_hadoop"="java6 -cp target/hadoop-jobs-1.3.0-SNAPSHOT.jar"

alias zookeep="~/gitstuff/kafka-0.7.2-incubating-src/bin/zookeeper-server-start.sh ~/gitstuff/kafka-0.7.2-incubating-src/config/zookeeper.properties"

alias penal_colony="~/gitstuff/kafka-0.7.2-incubating-src/bin/kafka-server-start.sh ~/gitstuff//kafka-0.7.2-incubating-src/config/server.properties"

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries                                                                                                                                                                               
export HISTSIZE=100000                   # big big history                                                                                                                                                                                    
export HISTFILESIZE=100000               # big big history                                                                                                                                                                                    
shopt -s histappend                      # append to history, don't overwrite it                                                                                                                                                              

# Save and reload the history after each command finishes                                                                                                                                                                                     
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

sudo ifconfig lo0 alias 127.0.0.2 up
sudo ifconfig lo0 alias 127.0.0.3 up
sudo ifconfig lo0 alias 127.0.0.4 up
sudo ifconfig lo0 alias 127.0.0.5 up
sudo ifconfig lo0 alias 127.0.0.6 up

sudo ifconfig lo0 alias 127.0.1.1 up
sudo ifconfig lo0 alias 127.0.1.2 up
sudo ifconfig lo0 alias 127.0.1.3 up
sudo ifconfig lo0 alias 127.0.1.1 up
sudo ifconfig lo0 alias 127.0.1.2 up
sudo ifconfig lo0 alias 127.0.1.3 up
sudo ifconfig lo0 alias 127.0.1.4 up
sudo ifconfig lo0 alias 127.0.1.5 up
sudo ifconfig lo0 alias 127.0.1.6 up

sudo sh -c 'echo development > /etc/conductor/environment'
sudo  mkdir -p /var/log/conductor /var/run/conductor /var/run/celery
sudo chown lmorduch /var/log/conductor /var/run/conductor /var/run/celery
alias rm="~/.bin/trashit"
