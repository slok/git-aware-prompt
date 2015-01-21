

# Needs font awesome and powerline
BRANCH_ICON="" #"\357\204\246"
GIT_ICON="" #"\357\207\223"
DIRTY_ICON="" #"\357\200\215"
NOT_DIRTY_ICON="" #"\357\200\214"

find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch=" $GIT_ICON $BRANCH_ICON $branch "
  else
    git_branch=""
  fi
}

find_git_dirty() {
  local status="$(git status --porcelain 2> /dev/null)"
  if [[ "$git_branch" != "" ]]; then
    if [[ "$status" != "" ]]; then
      git_dirty=" $DIRTY_ICON "
    else
        git_dirty=" $NOT_DIRTY_ICON "
    fi
  else
    git_dirty=""
  fi
}

PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"

# Default Git enabled prompt with dirty state
# export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# Another variant:
# export PS1="\[$bldgrn\]\u@\h\[$txtrst\] \w \[$bldylw\]\$git_branch\[$txtcyn\]\$git_dirty\[$txtrst\]\$ "

# Default Git enabled root prompt (for use with "sudo -s")
# export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "
