# Aliases
alias cp='cp -i'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'

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

# Editor
command -v vim &> /dev/null && export EDITOR=vim || export EDITOR=vi
