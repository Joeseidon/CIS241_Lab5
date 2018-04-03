#1/bin/bash

if "$#" = 0
	then 
		echo "A command line argument is required"
		exit 1
fi

for f in "$@"; do
	echo "$f"
	if test "$f" = "-1"
		then
			echo "L entered"
			ls -las --human-readable
	elif test"$f" = "-c"
		then
			echo "C entered"
	elif test "$f" = "--help"
		then 
			echo "help entered"
	fi
done

[ -d ~/backup] && echo "Directory Exists" || mkdir ~/backup

ls -ls --human-readable