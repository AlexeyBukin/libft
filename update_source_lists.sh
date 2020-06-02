#!/bin/bash

# if one arg - cd to dir
if [ $# -eq 1 ]
then
    if [ -n "$1" ]
    then
        cd "$1" || exit
    fi
fi

if [[ ! -f Makefile ]] ; then
    echo 'Cannot find Makefile, aborting.'
    exit
fi

C_FILES=$(find src     -type f -name '*.c' | sed 'N;N;s/\n/ /g' | sed 's/$/ \\\\\\/'| sed '$s/\\\\\\//' | column -t)
H_FILES=$(find include -type f -name '*.h' | sed 'N;N;s/\n/ /g' | sed 's/$/ \\\\\\/'| sed '$s/\\\\\\//' | column -t)

MAKE_UPDATED=$(sed ':a; /\\$/N; s/\\\n//; ta' Makefile  |
sed "s|SRC_FILES = .*\.c$|SRC_FILES = \\\\\n$C_FILES|g" |
sed "s|HEADER_FILES = .*\.h$|HEADER_FILES = \\\\\n$H_FILES|g")

echo "$MAKE_UPDATED" > Makefile
echo "$PWD/ - Updated Makefile"

if [[ ! -f CMakeLists.txt ]] ; then
    echo 'Cannot find CMakeLists.txt, aborting.'
    exit
fi

C_FILES_CMAKE=$(find src     -type f -name '*.c' | sed 'N;N;s/\n/ /g' |  sed 's/$/ \\/'| sed '$s/\\//' | sed 's/^/\\t\\t/' | column -t)

CMAKE_UPDATED=$(sed ':a; /\\$/N; s/\\\n//; ta' CMakeLists.txt | sed "/^.*\.c$/d" |
sed "s|set(\${PROJECT_NAME}_SOURCES|set(\${PROJECT_NAME}_SOURCES\n$C_FILES_CMAKE|g")

echo "$CMAKE_UPDATED" > CMakeLists.txt
echo "$PWD/ - Updated CMakeLists.txt"