[ -n "${ZDOTDIR}" ] || return


# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac


# Load rc settings
if [ -d ${ZDOTDIR} -a -d ${ZDOTDIR}/rc.d ]; then
    for file in ${ZDOTDIR}/rc.d/*.sh; do
        [ -r ${file} ] && . ${file}
    done
    unset file
fi


# Remove PATH duplication
typeset -U path cdpath fpath manpath
