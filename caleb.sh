#!/bin/bash

function process_student {
    IFS='/'; temp=($1); unset IFS;
    IFS='.'; folder=(${temp[4]}); unset IFS;
	#mkdir ./${folder[0]}
    #cd ./${folder[0]}
	git clone $1
	#cd ..
}

while IFS='' read -ra line || [[ -n "$line" ]]; do
	echo "Text read from file: $line"
    process_student "$line"
done < "$1"
