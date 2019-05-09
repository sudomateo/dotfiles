# bash configuration
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# environment variables
export PATH="${HOME}/.local/bin:${HOME}/bin:${PATH}"

# aliases
alias ls='ls --color=auto'
alias l='ls -la'
alias ll='ls -l'

# shell prompt
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

# local bashrc
if [[ -f "${HOME}/.bashrc.local" ]]; then
  source "${HOME}/.bashrc.local"
fi
