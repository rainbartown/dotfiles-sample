[ -n "${ZDOTDIR}" ] || return


# Load profiles
if [ -d ${ZDOTDIR}/profile.d ]; then
    for file in ${ZDOTDIR}/profile.d/*.sh; do
        [ -r "$file" ] && . $file
    done
    unset file
fi
