# Bashrc file.

# Command alias.
alias cp='cp -i'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'

# Define shell prompt.
function __set_ps1() {
  local git_prompt_files=(
    "/usr/share/git/git-prompt.sh"
    "/usr/share/git/completion/git-prompt.sh"
  )
  local git_prompt_file
  for git_prompt_file in ${git_prompt_files[*]}; do
    if [[ -f "${git_prompt_file}" ]]; then
      source "${git_prompt_file}"
      export GIT_PS1_SHOWDIRTYSTATE=1
      export PS1='\[\033[38;5;142m\]\W\[\033[38;5;214m\]$(__git_ps1 " (%s)")\[\033[0m\] $ '
      break
    else
      export PS1='\[\033[38;5;142m\]\W\[\033[38;5;214m\]\[\033[0m\] $ '
      break
    fi
  done
}

# Set shell prompt.
__set_ps1

# Add to PATH if not already there.
function pathmunge () {
  if [[ ":${PATH}:" != *":${1}:"* ]]; then
    if [[ "${2}" == "post" ]]; then
      export PATH="${PATH}:${1}"
    else
      export PATH="${1}:${PATH}"
    fi
  fi
}

# Set default editor.
command -v vim &> /dev/null && export EDITOR=vim || export EDITOR=vi

# Golang configuration.
mkdir -p ${HOME}/go/{bin,pkg,src} &> /dev/null
if [[ ${?} -eq 0 ]]; then
  export GOPATH=${HOME}/go
  export GOBIN=${GOPATH}/bin
  pathmunge "${GOBIN}"
fi

# User-specific programs.
mkdir -p ${HOME}/.local/bin &> /dev/null
if [[ ${?} -eq 0 ]]; then
  pathmunge "${HOME}/.local/bin"
fi

if [[ -n "${DESKTOP_SESSION}" ]];then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi
