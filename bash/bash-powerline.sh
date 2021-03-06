#!/usr/bin/env bash

#POWERLINE_GIT=0
__powerline() {
    readonly RESET='\[\033[m\]'
    readonly COLOR_CWD='\[\033[0;34m\]' # blue
    readonly COLOR_SERVER='\[\033[0;92;1m\]' # bright green
    readonly COLOR_GIT='\[\033[0;36m\]' # cyan
    readonly COLOR_SUCCESS='\[\033[0;32m\]' # green
    readonly COLOR_FAILURE='\[\033[0;31m\]' # red

    readonly SYMBOL_GIT_BRANCH='⎇  '
    readonly SYMBOL_GIT_MODIFIED='*'
    readonly SYMBOL_GIT_PUSH='↑'
    readonly SYMBOL_GIT_PULL='↓'
    readonly SYMBOL_GIT_STASH='⛁ '

    readonly SERVER="$(whoami)@$(cat /etc/hostname)$COLOR_RESET:"
    readonly ISJPOWERLINESET="yes"


    if [[ -z "$PS_SYMBOL" ]]; then
       PS_SYMBOL='$'
    fi

    __git_info() {
        [[ $POWERLINE_GIT = 0 ]] && return # disabled
        hash git 2>/dev/null || return # git not found
        local git_eng="env LANG=C git"

        local ref=$($git_eng symbolic-ref --short HEAD 2>/dev/null)

        if [[ -n "$ref" ]]; then # prepend branch symbol
            ref=$SYMBOL_GIT_BRANCH$ref
        else # get tag name or short unique hash
            ref=$($git_eng describe --tags --always 2>/dev/null)
        fi

        [[ -n "$ref" ]] || return  # not a git repo

        local marks

        while IFS= read -r line; do # scan first two lines of output from `git status`
            if [[ $line =~ ^## ]]; then # header line
                [[ $line =~ ahead\ ([0-9]+) ]] && marks+=" $SYMBOL_GIT_PUSH${BASH_REMATCH[1]}"
                [[ $line =~ behind\ ([0-9]+) ]] && marks+=" $SYMBOL_GIT_PULL${BASH_REMATCH[1]}"
            else # branch is modified if output contains more lines after the header line
                marks="$SYMBOL_GIT_MODIFIED$marks"
                break
            fi
        done < <($git_eng status --porcelain --branch 2>/dev/null)  # note the space between the two <

        local stash=$($git_eng status --show-stash | ag '(stash)' | ag '\d+' -o)
        if [[ -z "$stash" ]]; then
          stash=""
        else
          stash="$SYMBOL_GIT_STASH$stash "
        fi;
        # print the git branch segment without a trailing newline
        printf " $stash$ref$marks"
    }


    ps1() {
        local s=$?
        if [ $s -eq 0 ]; then
            local symbol="$COLOR_SUCCESS$PS_SYMBOL $RESET"
        else
            local symbol="$COLOR_FAILURE|$s| $PS_SYMBOL $RESET" # also show error code $?
        fi

        local cwd="$COLOR_CWD\w$RESET"
        if shopt -q promptvars; then
            __powerline_git_info="$(__git_info)"
            local git="$COLOR_GIT\${__powerline_git_info}$RESET"
        else
            # promptvars is disabled. Avoid creating unnecessary env var.
            local git="$COLOR_GIT$(__git_info)$RESET"
        fi

        PS1="$COLOR_SERVER$SERVER$cwd$git$symbol"
    }

    PROMPT_COMMAND="ps1${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
}

if [[ -z "$ISJPOWERLINESET" ]]; then
  __powerline
  unset __powerline
fi

