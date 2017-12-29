# Cygwinの場合、bash_profileはcygwin64/home/[ユーザー]
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Homebrew Completions
BREW_SCRIPTS="$(brew --prefix)/etc/bash_completion.d"
if [ -d "$BREW_SCRIPTS" ]; then for script in $(find $BREW_SCRIPTS -type l) ; do . $script ; done fi
if [ -f "$BREW_SCRIPTS/git-prompt.sh" ]; then PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '; fi
