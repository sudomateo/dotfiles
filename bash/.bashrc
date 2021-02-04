# Source /etc/bashrc.
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

# Function pathmunge adds a directory to the beginning or end of PATH if it
# does not already exist.
function pathmunge() {
  case ":${PATH}:" in
    *:"${1}":*)
      ;;
    *)
      if [ "${2}" == "after" ] ; then
        PATH=${PATH}:${1}
      else
        PATH=${1}:${PATH}
      fi
  esac
}

# Function prompt configures the PS1 prompt.
function prompt() {
  local git_prompt_files=(
    "/usr/local/etc/bash_completion.d/git-prompt.sh"
    "/usr/share/doc/git/contrib/completion/git-prompt.sh"
    "/usr/share/git-core/contrib/completion/git-prompt.sh"
    "/usr/share/git/completion/git-prompt.sh"
    "/usr/share/git/git-prompt.sh"
    "/etc/bash_completion.d/git-prompt"
  )
  for git_prompt_file in ${git_prompt_files[*]}; do
    if [ ! -f "${git_prompt_file}" ]; then
      continue
    fi
    source "${git_prompt_file}"
    export GIT_PS1_SHOWDIRTYSTATE=1
    PS1='\[\e[38;5;10m\]\W\[\e[38;5;11m\]$(__git_ps1 " (%s)")\[\e[0m\]\n\[\e[0m\]> '
    return
  done
  PS1='\[\033[38;5;10m\]\w\[\033[38;5;11m\]\[\033[0m\]\n\[\e[0m\]> '
}

# Function completion configures command completion.
function completion () {
  local completion_files=(
    "/usr/local/etc/bash_completion.d/git-completion.bash"
    "/usr/share/doc/git/contrib/completion/git-completion.bash"
  )
  for completion_file in ${completion_files[*]}; do
    if [ ! -f "${completion_file}" ]; then
      continue
    fi
    source "${completion_file}"
    return
  done
}

# Configure EDITOR and VISUAL in order of preference.
if ( command -v nvim > /dev/null 2>&1 ); then
  EDITOR=$(command -v nvim)
  VISUAL=${EDITOR}
  alias vim='nvim'
elif ( command -v vim > /dev/null 2>&1 ); then
  EDITOR=$(command -v vim)
  VISUAL=${EDITOR}
elif ( command -v vi > /dev/null 2>&1 ); then
  EDITOR=$(command -v vi)
  VISUAL=${EDITOR}
fi

# Configure Go environment variables.
pathmunge ${HOME}/.local/go/bin
GOBIN=${HOME}/go/bin
pathmunge ${GOBIN}

# Configure PATH.
pathmunge ${HOME}/bin
pathmunge ${HOME}/.local/bin

# Command aliases.
alias cp='cp -i'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias mv='mv -i'

# Call the functions.
prompt
completion

# Export environment variables.
export EDITOR GOBIN PATH PS1 VISUAL

# Unset all functions since we're done using them.
unset -f completion pathmunge prompt

# macOS
# export CLICOLOR=1
# export LSCOLORS=ExGxFxdxCxDxDxxbadacec
