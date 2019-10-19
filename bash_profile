# Source bashrc
if [[ -f ${HOME}/.bashrc ]]; then
  source ${HOME}/.bashrc
fi

# Golang
mkdir -p ${HOME}/go/{bin,pkg,src} &> /dev/null
if [[ ${?} -eq 0 ]]; then
  export GOPATH=${HOME}/go
  export GOBIN=${GOPATH}/bin
  export PATH="${GOBIN}:${PATH}"
fi

# User-specific programs
mkdir -p ${HOME}/.local/bin &> /dev/null
if [[ ${?} -eq 0 ]]; then
  export PATH="${HOME}/.local/bin:${PATH}"
fi
