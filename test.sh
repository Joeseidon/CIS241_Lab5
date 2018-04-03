#1/bin/bash

#Determine if there is a command line argument
if [ $# -eq 0 ]
	then 
		echo "A command line argument is required"
		exit 1
fi

#Determine if there are too many command line arguments 
if [[ $# > 1 ]]
	then
		echo "Only one argument"
		exit 1
fi
i = 0
#Determine action for command line argument
for f in "$@"; do
	echo "$f"
	if [[ "$f" = "-1" ]]
		then
			i = 1
			echo "Local Files and Directories:"
			
	elif [[ "$f" = "-c" ]]
		then
			echo "File and Directory Count:"
			#Locates all files (including hidden files) in the current directory and sub directories
			find .//. ! -name . -print | grep -c //
			echo "Memory Usage:"
			#Display the number of bytes used by files and directories in the current directory 
			{ find .//. ! -name . -print "%s+"; echo 0; } | bc
	elif [[ "$f" = "--help" ]]
		then 
			echo "To run this file, type sh followed by test.sh (this program)."
			echo "Before pressing enter, you must enter one of the following arguments:"
			echo "-l, to display all files"
			echo "-c, to count the files and display bytes used"
	fi
done

if [[ i = 1 ]]
	then
		ls -las --human-readable
fi
echo "Attempting to make backup directory..."
#Creates a backup folder in the home directory if it doesn't already exist 
[ -d ~/backup ] && echo "Directory Exists" || mkdir ~/backup