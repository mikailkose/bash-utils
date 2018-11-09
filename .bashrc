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

# rm aliases
# delete every file if not single
alias rmsingle="md5sum $(find . -name *.txt -print) | awk '{c[$1]++;if(c[$1]==1){cache[$1]=$2} if(c[$1]>1){t[i++]=$2;if(cache[$1]!=""){t[i++]=cache[$1];delete cache[$1]}}} END{ for (var in t) {print t[var];} }' | sed 's/^*//' | xargs rm -f

# rm not containing
alias rm="diff -rq prod/ nori/ | grep -E "^Only in nori*" | sed -n 's/://p' | awk '{print $3"/"$4}' | xargs rm -f"

## Functions
spgrep() {
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
