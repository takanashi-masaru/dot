# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias la='ll -a'
alias grep="grep --color"
alias ..='cd ..'

HISTSIZE=50000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# プロンプト
PS1="[\u@\[\e[0;34m\]\h\[\e[0m\]]: \[\033[33m\]\w\[\033[0m\]\[\033[36m\]\$(__git_ps1)\[\033[00m\]\n\$ "

# git-completion.bash / git-prompt.sh
# wget https://raw.githubusercontent.com/git/git/v2.5.0/contrib/completion/git-completion.bash
# wget https://raw.githubusercontent.com/git/git/v2.5.0/contrib/completion/git-prompt.sh
# が必要
if [ -f /root/git-completion.bash ]; then
    source /root/git-completion.bash
fi
if [ -f /root/git-prompt.sh ]; then
    source /root/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto


# 重複履歴を無視
export HISTCONTROL=ignoredups

export CLICOLOR=1
export LESSCHARSET=utf-8
export LC_CTYPE=ja_JP.UTF-8

export EDITOR=vim alias vi="vim"
