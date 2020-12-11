[ -n "${ZDOTDIR}" ] || return


# Suppress error if not match in for loop
unsetopt nomatch


# Load env settings
if [  -d ${ZDOTDIR}/env.d ]; then
    for file in ${ZDOTDIR}/env.d/*.sh; do
        [ -r "$file" ] && . $file
    done
    unset file
fi
