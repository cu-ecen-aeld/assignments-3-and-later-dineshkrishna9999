#!/bin/bash  
  
# Check if both arguments are provided  
if [ $# -ne 2 ]  
then  
    echo "Both a file path and a string to write must be provided"  
    exit 1  
fi  
  
# Check if the directory path exists, if not create it  
dir=$(dirname $1)  
if [ ! -d $dir ]  
then  
    mkdir -p $dir  
fi  
  
# Write the provided string into the file  
echo $2 > $1  
  
# Check if the write was successful  
if [ $? -ne 0 ]  
then  
    echo "The file could not be created"  
    exit 1  
fi  
  
exit 0  
