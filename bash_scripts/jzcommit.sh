#!/bin/bash
currentBranchName=`git rev-parse --abbrev-ref HEAD`
if (($# == 0)); then 
	echo "Commit message cannot be empty"
else
commitMessage="$currentBranchName $@"
exec git commit -m "$commitMessage"
fi
