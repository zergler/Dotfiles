#-------------------------------------------------------------------------------
# File:		~/.bashrc
# Authors:	Igor Janjic
# Description:	User configuration file for bash.
##------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Configuration
##

# Fortune. :)
fortune

# Vim-like bash.
set -o vi

#-------------------------------------------------------------------------------
# Aliases
##

# Navigation aliases.
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Program aliases.
alias ls='ls --color=auto'
alias vimprobable2="vimprobable2 -e \"\$(tabbed -d)\""
alias wifi-status="sudo systemctl status netctl-auto@wl16s0.service"
alias wifi-restart="sudo systemctl restart netctl-auto@wlp16s0.service"
alias wifi-enable="sudo systemctl enable netctl-auto@wlp16s0.service"

# Program configuration file aliases.
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias tmuxrc='vim ~/.tmux.conf'
alias vimpbm='vim ~/.config/vimprobable/bookmarks'
alias vimprc='vim ~/.config/vimprobable/vimprobablerc'
alias xrc='vim ~/.Xresources'
alias octaverc='vim ~/.octaverc'

# School aliases.
alias undergrad='cd ~/Academics/Undergraduate'
alias grad='cd ~/Academics/Graduate'
alias cv='cd ~/Academics/Virginia\ Tech/Graduate/\[ECE\ 5554\]\ Computer\ Vision'
alias esd='cd ~/Academics/Virginia\ Tech/Undergraduate/\[5\]\ Super\ Senior/9th\ Semester/\[ECE\ 4534\]\ Embedded\ System\ Design'
alias nad='cd ~/Academics/Virginia\ Tech/Undergraduate/\[5\]\ Super\ Senior/9th\ Semester/\[ECE\ 4564\]\ Network\ Application\ Design'

alias schemgen='cd ~/Programming/SchemGen'
alias pifeed='cd ~/Programming/PiFeed'
alias auto-rover='cd ~/Programming/Auto-Rover'
alias cvhw3='cd ~/Academics/Virginia\ Tech/Graduate/\[ECE\ 5554\]\ Computer\ Vision/Homework/Homework\ 3'

# Command aliases.
alias blfull='sudo tee /sys/class/backlight/acpi_video0/brightness <<< 11'

