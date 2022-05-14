#!/bin/bash

OPTS="-q -2 -L ./library"

if [ -z "$SPINC" ]
then
    SPINC="flexspin"
fi

if [ "$1" == "clean" ]
then
    find . -name \*.binary \*.p2asm -exec rm {} \;
    exit
fi

while read line
do
    ${SPINC} $OPTS "$line" >/dev/null
    if [ $? != 0 ]
    then 
        echo
        echo "${SPINC} $OPTS $line"
        ${SPINC} $OPTS "$line"
        echo
    fi
done < <(cat MANIFEST|grep spin2)
#done < <(find . -name \*.spin2)

