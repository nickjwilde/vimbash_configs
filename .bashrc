if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM='verbose git'
export GIT_PS1_SHOWDIRTYSTATE GIT_PS1_SHOWUPSTREAM
