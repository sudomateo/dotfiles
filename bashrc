# Aliases
alias ls='ls --color=auto'
alias l='ls -la'
alias ll='ls -l'

# Shell prompt
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
      
__set_ps1

# EDITOR
command -v vim &> /dev/null && export EDITOR=vim || export EDITOR=vi

# Golang
mkdir -p ${HOME}/go/{bin,pkg,src} &> /dev/null
export GOPATH=${HOME}/go
export GOBIN=${GOPATH}/bin

# PATH
export PATH="${HOME}/.local/bin:${HOME}/bin:${GOBIN}:${PATH}"

# Local overrides
if [[ -f "${HOME}/.bashrc.local" ]]; then
  source "${HOME}/.bashrc.local"
fi
