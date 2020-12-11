# Set zsh setting directory
[ -d ${HOME}/.zsh.d ] || return
export ZDOTDIR=${HOME}/.zsh.d


# Load .zshenv
[  -r ${ZDOTDIR}/.zshenv ] && . ${ZDOTDIR}/.zshenv
