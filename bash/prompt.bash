# -*- mode: sh -*-

        RED="\[\033[0;31m\]"
     YELLOW="\[\033[1;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[1;34m\]"
     PURPLE="\[\033[0;35m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

GIT_DIRTY="${RED}✗${COLOR_NONE}"
GIT_CLEAN="${GREEN}✓${COLOR_NONE}"

function parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

function set_git_branch() {
  branch=$(parse_git_branch)
  GIT_BRANCH="${PURPLE}${branch}${COLOR_NONE}"
}

function set_git_state() {
    status="$(git status --porcelain 2> /dev/null)"
    if test $? -eq 0 ; then
        if test -z "${status}" ; then
            GIT_STATE="${GIT_CLEAN}"
        else
            GIT_STATE="${GIT_DIRTY}"
        fi
    else
        GIT_STATE=""
    fi
}

function set_prompt_symbol () {
  if test $1 -eq 0 ; then
      PROMPT_SYMBOL="\$"
  else
      PROMPT_SYMBOL="${LIGHT_RED}\$${COLOR_NONE}"
  fi
}

function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="${BLUE}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
  fi
}

function set_bash_prompt () {
  # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
  # return value of the last command.
  set_prompt_symbol $?

  # Set the PYTHON_VIRTUALENV variable.
  set_virtualenv

  # Set the GIT_BRANCH variable.
  set_git_branch

  # Set GIT_STATE variable
  set_git_state

  # Set the bash prompt variable.
  PS1="${PYTHON_VIRTUALENV}${GREEN}\u${COLOR_NONE}\
@${LIGHT_GREEN}\h${COLOR_NONE} \
\D{%m-%d} \t ${YELLOW}\w${COLOR_NONE}\
${GIT_BRANCH}${GIT_STATE}${PROMPT_SYMBOL} "
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt
