#!bin/bash
#${1} src host folder
#${2} dest docker
#${3} dest folder
#${4} template
curl -s -o tmp-exclude.txt https://raw.githubusercontent.com/jasonlamkk/jenkins-shall-copy-what-files/master/${4}/exclude.txt && arrExclude=$(< tmp-exclude.txt ) && rm tmp-exclude.txt

arrFiles=$(ls ${1})
for f in $arrFiles
do
    if [[ ${arrExclude[*]} =~ $f ]]; then
        echo "Skip : ${f}"
    else
        echo "Copying ${f}" && docker cp ${1}/${f} ${2}:${3}/ && echo "Success"
    fi
done