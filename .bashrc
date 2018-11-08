## Aliases
# mathematical cd aliases
alias 1*cd="cd .."
alias 2*cd="cd ../../"
alias 3*cd="cd ../../../"
alias 4*cd="cd ../../../../"
alias 5*cd="cd ../../../../../"
alias 6*cd="cd ../../../../../../"

# ls aliases
# show all hidden files
alias l.="ls -ld .*"
# long listing
alias ll="ls -la"

## Functions
findspobject() {
if [ "$1" == "--help" ]
then
    echo "Usage: <object name> <mtime>"
else
    if [ "$#" -eq 1 ]
    then
        { find . -iname *.xml -type f -print0 | xargs -0 fgrep -l "DOCTYPE $1"; }
    elif [ "$#" -eq 2 ]
    then
        { find . -iname *.xml -type f -mtime -$2 -print0 | xargs -0 fgrep -l "DOCTYPE $1"; }
    else
        echo "Usage: <object name> <mtime>"
    fi
fi
}
