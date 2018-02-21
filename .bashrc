# bash_aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.secrets ]; then
    . ~/.secrets
fi

# git global settings
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM='verbose git'
export GIT_PS1_SHOWDIRTYSTATE GIT_PS1_SHOWUPSTREAM

# ssh keys management
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add $SECRET_KEY_PATH
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add $SECRET_KEY_PATH 
fi

unset env

# git completion of branches
if [ -f ~/.git-completion.bash ];then
    . ~/.git-completion.bash
fi

if [ -f ~/.alias_completion.bash ];then
    . ~/.alias_completion.bash
fi
