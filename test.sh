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

#Determine action for command line argument
for f in "$@"; do
	if [[ "$f" = "-l" ]]
		then
			echo "Local Files and Directories:"
			ls -la
			
	elif [[ "$f" = "-c" ]]
		then
			echo "File and Directory Count:"
			#Locates all files (including hidden files) in the current directory and sub directories
			ls -Aq | wc -l
			echo "Memory Usage:"
			#Display the number of bytes used by files and directories in the current directory 
			find . -type f -mtime -30 -exec ls -l {} \; | awk '{ s+=$5 } END { print s }'
	elif [[ "$f" = "--help" ]]
		then 
			echo "To run this file, type sh followed by test.sh (this program)."
			echo "Before pressing enter, you must enter one of the following arguments:"
			echo "-l, to display all files"
			echo "-c, to count the files and display bytes used"
	fi
done

echo "Attempting to make backup directory..."
#Creates a backup folder in the home directory if it doesn't already exist 
[ -d ~/backup ] && echo "Directory Exists" || mkdir ~/backup

echo "Counting number of files and directories in the current path."
echo "File and Directory Count:"
#Locates all files (including hidden files) in the current directory and sub directories
ls -Aq | wc -l
echo "Memory Usage:"
#Display the number of bytes used by files and directories in the current directory 
find . -type f -mtime -30 -exec ls -l {} \; | awk '{ s+=$5 } END { print s }'