#1/bin/bash

if [ $# -eq 0 ]
	then 
		echo "A command line argument is required"
		exit 1
fi

for f in "$@"; do
	echo "$f"
	if [[ "$f" = "-1" ]]
		then
			echo "L entered"
			ls -las --human-readable
	elif [[ "$f" = "-c" ]]
		then
			echo "C entered"
	elif [[ "$f" = "--help" ]]
		then 
			echo "help entered"
	fi
done

[ -d ~/backup ] && echo "Directory Exists" || mkdir ~/backup

ls -ls --human-readable