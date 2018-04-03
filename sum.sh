#1/bin/bash
#By default, for loop iterates over $@ (command line arguments)
for i do
	sum=$(expr $sum + $i)
done
echo $sum