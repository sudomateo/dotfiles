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

# Configure Go environment variables.
pathmunge ${HOME}/.local/go/bin
export GOBIN=${HOME}/go/bin
pathmunge ${GOBIN}

# Configure user specific PATH.
pathmunge ${HOME}/bin
pathmunge ${HOME}/.local/bin

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
