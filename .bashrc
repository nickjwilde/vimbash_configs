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

if [ ! "$SSH_AUTH_SOCK" ] || [ "$agent_run_state" = 2 ]; then
    agent_start
fi

existing_keys=$(ssh-add -l) 
for key in ${KEY_FILES[@]}; do
    fingerprint=$(ssh-keygen -lf "$SECRET_KEY_PATH$key" | awk '{print $2}')
    echo "$existing_keys" | grep -q "$fingerprint" || ssh-add "$SECRET_KEY_PATH$key";
done

unset env

# git completion of branches
if [ -f ~/.git-completion.bash ];then
    . ~/.git-completion.bash
fi

if [ -f ~/.alias_completion.bash ];then
    . ~/.alias_completion.bash
fi

# add git prompt commands if not available with bash
if [ -f ~/bin/git-prompt.sh ];then
    . ~/bin/git-prompt.sh
fi


source virtualenvwrapper.sh
export WORKON_HOME=$HOME/.pyenvs
mkdir -p $WORKON_HOME
# add /home/bin folder for custom scripts
PATH=$PATH:~/bin

#git to shell
PS1='\e[0;36m\u@\h \A\n'
PS1="$PS1"'\e[33m'
PS1="$PS1"'\w\e[0m |'
PS1="$PS1"'\e[036m'
PS1="$PS1"'`__git_ps1`'
PS1="$PS1"'\e[0m\n\$'
export PS1
export PATH
