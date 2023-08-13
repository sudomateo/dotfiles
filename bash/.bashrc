# .bashrc

# Source global definitions.
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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
			;;
	esac
}

# Configure system PATH.
pathmunge /usr/local/bin after
pathmunge /usr/local/sbin after
pathmunge /usr/bin after
pathmunge /usr/sbin after
pathmunge /bin after
pathmunge /sbin after

# Configure user specific PATH.
pathmunge ${HOME}/bin
pathmunge ${HOME}/.local/bin

# Programming configuration. Latter pathmunge calls take precedence over
# earlier calls.

# Node.js.
export NVM_DIR="${HOME}/.local/nvm"
if [ -s "${NVM_DIR}/nvm.sh" ]; then
    . "${NVM_DIR}/nvm.sh"
fi
if [ -s "${NVM_DIR}/bash_completion" ]; then
    . "${NVM_DIR}/bash_completion"
fi

# Rust.
export RUSTUP_HOME=${HOME}/.local/rustup
export CARGO_HOME=${HOME}/.local/cargo
pathmunge ${CARGO_HOME}/bin

# Go.
# The go installation is located at ~/.local/go, leaving no great place to
# place GOPATH. I settled for this location to keep it in ~/.local.
export GOPATH=${HOME}/.local/gopath
# For the Go binary itself.
pathmunge ${HOME}/.local/go/bin
# For the binaries installed by go install.
pathmunge ${GOPATH}/bin

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions.
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -s "${rc}" ]; then
			. "${rc}"
		fi
	done
fi
unset rc

export PATH
