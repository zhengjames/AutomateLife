#!/bin/bash
#mac users please put this in /usr/local/bin
#prepend ticket name to commit message
#ticket name is (LMS|CR)-[0-9]*
currentBranchName=`git rev-parse --abbrev-ref HEAD`
if (($# == 0)); then 
	echo "Commit message cannot be empty"
else

trimmedBranchName=`grep -o -E '[A-Z]*-[0-9]*' <<< "$currentBranchName"`

commitMessage="$trimmedBranchName $@"
exec git commit -m "$commitMessage"
fi
