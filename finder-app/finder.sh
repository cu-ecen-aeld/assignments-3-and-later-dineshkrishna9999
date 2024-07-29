#!/bin/bash  
  
# Check if both arguments are provided  
if [ $# -ne 2 ]  
then  
    echo "Both a directory and a search string must be provided"  
    exit 1  
fi  
  
# Check if the provided directory exists  
if [ ! -d $1 ]  
then  
    echo "The provided directory does not exist"  
    exit 1  
fi  
  
# Count the number of files  
num_files=$(find $1 -type f | wc -l)  
  
# Count the number of matching lines  
num_matches=$(grep -r $2 $1 | wc -l)  
  
# Print the results  
echo "The number of files are $num_files and the number of matching lines are $num_matches"  
  
exit 0  
