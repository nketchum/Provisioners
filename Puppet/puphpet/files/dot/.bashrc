[ -r /etc/bashrc ] && source /etc/bashrc
[ -r /etc/bash_completion ] && source /etc/bash_completion
[ -r ~/.git-completion.bash ] && source ~/.git-completion.bash
[ -r ~/.git-prompt.sh ] && source ~/.git-prompt.sh
[ -r /usr/local/rvm/scripts/rvm ] && source /usr/local/rvm/scripts/rvm

__has_parent_dir () {
    # Utility function so we can test for things like .git/.hg without firing up a
    # separate process
    test -d "$1" && return 0;

    current="."
    while [ ! "$current" -ef "$current/.." ]; do
        if [ -d "$current/$1" ]; then
            return 0;
        fi
        current="$current/..";
    done

    return 1;
}

__vcs_name() {
    if [ -d .svn ]; then
        echo " [svn]";
    elif __has_parent_dir ".git"; then
        echo " [$(__git_ps1 '%s'])";
    elif __has_parent_dir ".hg"; then
        echo " [hg:$(hg branch)]"
    fi
}

black=$(tput -Txterm setaf 0)
#red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
#yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
#lt_blue=$(tput -Txterm setaf 6)
white=$(tput -Txterm setaf 7)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

# Nicely formatted terminal prompt
export PS1='\n\[$dk_blue\]\u@\h\[$bold\]\[$black\]:\[$reset\]\[$green\]\w\[$pink\]$(__vcs_name) \[$white\]\[$bold\]\$\[$reset\] '

alias ls='ls -F --color=always'
alias dir='dir -F --color=always'
alias l='ls -lF  --color=always'
alias ll='ls -alhF  --color=always'
alias cp='cp -iv'
alias rm='rm -i'
alias mv='mv -iv'
alias grep='grep --color=auto -in'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'