#!/bin/bash

if [ -z "$SPINC" ]
then
    SPINC="fastspin"
fi

if [ "$1" == "clean" ]
then
    find . -name \*.binary \*.p2asm -exec rm {} \;
    exit
fi

while read line
do
    ${SPINC} -q -2 -L "./library" "$line" >/dev/null
    if [ $? != 0 ]
    then 
        echo
        echo "${SPINC} -Wall -q -2 -L ./library $line"
        ${SPINC} -Wall -q -2 -L ./library "$line"
        echo
    fi
done < <(cat MANIFEST|grep spin2)
#done < <(find . -name \*.spin2)

