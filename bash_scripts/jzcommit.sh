#!/bin/bash
#mac users please put this in /usr/local/bin
#prepend ticket name to commit message
#ticket name is [A-Z]*-[0-9]*
#given your branch name is LMS-12345 you can do jzcommit.sh this is a commit message
#the resulting commit message will become LMS-12345 this is a commit message
currentBranchName=`git rev-parse --abbrev-ref HEAD`
if (($# == 0)); then 
	echo "Commit message cannot be empty"
else

trimmedBranchName=`grep -o -E '[A-Z]*-[0-9]*' <<< "$currentBranchName"`

commitMessage="$trimmedBranchName $@"
exec git commit -m "$commitMessage"
fi
