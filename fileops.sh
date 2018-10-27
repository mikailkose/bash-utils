# If duplicate delete both files
md5sum $(find . -name *.xml -print) | sort | awk '{c[$1]++; f[$1]=f[$1]$2"\n";next;} END{ for (var in c) if(c[var]>1 && f[var]!~/ori/ ) print f[var] }' | sed 's/^\*//' | sed '/^$/d' | xargs rm -f

