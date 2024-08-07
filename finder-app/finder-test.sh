#!/bin/bash

make clean
make

if [ ! -f writer ]; then
    echo "Error: writer application was not built."
    exit 1
fi

file_path="/tmp/aesd/assignment1/samplefile.txt"
write_string="AESD_IS_AWESOME"

mkdir -p $(dirname ${file_path})
./writer ${file_path} ${write_string}

if [ ! -f ${file_path} ]; then
    echo "Error: File was not created."
    exit 1
fi

if grep -q "${write_string}" "${file_path}"; then
    echo "Success: Found '${write_string}' in ${file_path}."
else
    echo "Error: '${write_string}' not found in ${file_path}."
    exit 1
fi
