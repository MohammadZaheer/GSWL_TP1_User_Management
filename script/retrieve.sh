#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

xls2csv $DIR/GSWL_TP1_User_Management/xls/usersinfo.xls > $DIR/GSWL_TP1_User_Management/csv/usersinfo.csv

input="$DIR/GSWL_TP1_User_Management/csv/usersinfo.csv"
array=($(awk -F: '{ print $1 }' /etc/passwd ))
i=0;

while IFS= read -r line
do
	i=0
	for item in ${array[*]}
	do
		if [ "$line" = "\$item\"" ]; then
			i=$((i+1))
		fi
	done
	if [ "$i" = 0 ]; then
		var="$(echo $line | sed 's/\"//g')"
		useradd $line
		mkhomedir_helper $line
	fi
done < $input
