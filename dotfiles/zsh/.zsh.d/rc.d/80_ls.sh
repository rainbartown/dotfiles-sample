# dircolors
eval_dircolors() {
    if (which dircolors > /dev/null 2>&1); then
        if [ -r ${HOME}/.dircolors ]; then
            eval "$(dircolors -b ${HOME}/.dircolors)"
        else
            eval "$(dircolors -b)"
        fi
    fi
}


# ls
if (ls --time-style=long-iso / > /dev/null 2>&1); then  # GNU coreutils
    alias ls='ls -v --color=auto'
    alias la='ls -A'
    alias ll='ls -alFh --time-style=long-iso'
    eval_dircolors
elif (ls --color=auto / > /dev/null 2>&1); then  # BusyBox
    alias ls='ls -v --color=auto'
    alias la='ls -A'
    alias ll='ls -alFh'
    eval_dircolors
elif (ls -G / > /dev/null 2>&1); then  # BSD
    alias ls='ls -G'
    alias la='ls -AG'
    alias ll='ls -alFhG'
    export LSCOLORS=ExGxFxdaCxDaDahbadacec
else  # POSIX
    alias la='ls -a'
    alias ll='ls -alF'
    alias l='ls -CF'
fi
