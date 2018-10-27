# If duplicate delete both files
md5sum $(find . -name *.xml -print) | awk '{c[$1]++;if(c[$1]==1){t[$1]=$2}else{f1[$1]=t[$1]; f2[$1]=$2;}} END{ for (var in f2) {print f2[var];} for (car in f1){ print f1[car];}}' | sed 's/^*//'

