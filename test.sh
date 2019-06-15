#!/bin/bash

if [ -z "$SPINC" ]
then
    SPINC="fastspin"
fi

if [ "$1" == "clean" ]
then
    find . -name \*.binary -exec rm {} \;
    exit
fi

while read line
do
    ${SPINC} -L "./library" "$line" >/dev/null
    if [ $? != 0 ]
    then 
        echo
        echo "${SPINC} -L ./library $line"
        ${SPINC} -L ./library "$line"
        echo
    fi
done < <(find . -name \*.spin2)

