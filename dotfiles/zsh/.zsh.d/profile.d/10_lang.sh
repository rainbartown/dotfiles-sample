# On Linux console, only ASCII characters are available
case "$TERM" in
    "linux" )
        export LANG=C
        ;;
    * )
        ;;
esac
