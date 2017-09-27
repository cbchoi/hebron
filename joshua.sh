#!/bin/bash

function process_student {
	# Tokenizing
    IFS='/'; temp=($1); unset IFS;
    IFS='.'; folder=(${temp[4]}); unset IFS;
    cd ./${folder[0]}
	# Git update
	git pull
	git log --pretty=format:'"%cn, %cd, %s"' --stat > ${folder[0]}_$(date +%Y%m%d_%H:%M:%S).log
	mv ./*.log "../assessment/"
	cd ..
}

# Check Directory
if [ ! -d "assessment" ]; then
	mkdir "assessment"
fi

# Process Students 
while IFS='' read -ra line || [[ -n "$line" ]]; do
	echo "Text read from file: $line"
    process_student "$line"
done < "$1"

# Process Stats

