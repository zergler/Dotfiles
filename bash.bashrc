#-------------------------------------------------------------------------------
# File:		/etc/bash.bashrc
# Authors:	Igor Janjic
# Description:	System configuration file for bash.
#		
#		This file is sourced by all *interactive* bash shells on
#		startup, including some apparently interactive shells such as
#		scp and rcp that can't tolerate any output. So make sure this
#		doesn't display anything or bad things will happen!
#	
#		Test for an interactive shell. There is no need to set anything
#		past this point for scp and rcp, and it's important to refrain
#		from outputting anything in those cases.
##------------------------------------------------------------------------------

# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

# Bash won't get SIGWINCH if another process is in the foreground. Enable
# checkwinsize so that bash will check the terminal size when it regains
# control. Refer to http://cnswww.cns.cwru.edu/~chet/bash/FAQ.
shopt -s checkwinsize

# Enable history appending instead of overwriting.
shopt -s histappend

case ${TERM} in
	xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
		;;
	screen)
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
		;;
esac

# Fortune is a simple program that displays a pseudorandom message from a
# database of quotations at logon and/or logout. If you wish to use it, please
# install "fortune-mod" from the official repositories, then uncomment the
# following line:

#[[ "$PS1" ]] && /usr/bin/fortune

# Colors on ls.
alias ls='ls --color=auto'

# Command prompt.
PS1="\n \[\e[1;37m\]┌─[ \[\e[1;31m\]\u \[\e[1;34m\]@ \[\e[1;32m\]\w \[\e[1;37m\]]\[\e[1;35m\] \n\[\e[1;37m\] └─[\[\e[1;36m\] \d \[\e[1;33m\]\T \[\e[1;37m\]]--> \[\e[0;37m\]" 
PS2="> "
PS3="> "
PS4="+ "

# Try to enable the auto-completion (type: "pacman -S bash-completion" to install it).
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Try to enable the "Command not found" hook ("pacman -S pkgfile" to install it).
# See also: https://wiki.archlinux.org/index.php/Bash#The_.22command_not_found.22_hook.
[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash

# Display arch logo and system information.
archey

# Get colorized man pages.
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}
