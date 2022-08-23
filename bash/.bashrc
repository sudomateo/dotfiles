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
pathmunge /bin after
pathmunge /sbin after

# Configure user specific PATH.
pathmunge ${HOME}/bin
pathmunge ${HOME}/.local/bin

# Go configuration.
pathmunge ${HOME}/.local/go/bin
export GOPATH=${HOME}/.local/lib/go
export GOBIN=${HOME}/.local/lib/go/bin
pathmunge ${GOBIN}

# Rust configuration.
export RUSTUP_HOME=${HOME}/.local/lib/rustup
export CARGO_HOME=${HOME}/.local/lib/cargo
pathmunge ${CARGO_HOME}/bin

# Node.js configuration.
export NPM_CONFIG_PREFIX=${HOME}/.local
export NPM_CONFIG_CACHE=${HOME}/.cache/npm

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions.
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "${rc}" ]; then
			. "${rc}"
		fi
	done
fi
unset rc
