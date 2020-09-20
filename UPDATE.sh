#!/bin/bash

function __git_prompt_git () {
	GIT_OPTIONAL_LOCKS=0 command git "$@"
}

function current_branch () {
    local ref
	ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
	local ret=$?
	if [[ $ret != 0 ]]
	then
		[[ $ret == 128 ]] && return
		ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null)  || return
	fi
	echo ${ref#refs/heads/}
}

git pull --rebase origin $(current_branch) && rm -rf ~/.oh-my-zsh && ./INSTALL.sh < <(echo nn)
