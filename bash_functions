#!/usr/bin/bash

# Usage: t_push <remote>
# If inside a git repo, pushed to the testing branch
# of the given remote
t_push() 
{
	[ -d .git ] && git push $1 testing
}
