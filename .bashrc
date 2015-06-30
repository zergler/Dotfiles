#-------------------------------------------------------------------------------
# File:		~/.bashrc
# Authors:	Igor Janjic
# Description:	User configuration file for bash.
##------------------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#-------------------------------------------------------------------------------
# Configuration
##

# Fortune. :)
fortune

# Vim-like bash.
set -o vi

source /usr/share/doc/pkgfile/command-not-found.bash

alias ls='ls --color=auto'
eval $(dircolors -b $HOME/.dircolors)

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
alias vimprobable2="~/.scripts/bash/vimprobable2-tabbed.sh"
alias wifi-status="sudo systemctl status netctl-auto@wl16s0.service"
alias wifi-restart="sudo systemctl restart netctl-auto@wlp16s0.service"
alias wifi-stop="sudo systemctl stop netctl-auto@wlp16s0.service"
alias wifi-enable="sudo systemctl enable netctl-auto@wlp16s0.service"

# Program configuration file aliases.
alias sbashrc='source ~/.bashrc'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias tmuxrc='vim ~/.tmux.conf'
alias xrc='vim ~/.Xresources'
alias octaverc='vim ~/.octaverc'
alias vimprc='vim ~/.config/vimprobable/vimprobablerc'
alias irssirc='vim ~/.irssi/config'
alias mpdrc='vim ~/.mpd/mpd.conf'
alias ncmpcpprc='vim ~/.ncmpcpp/config'

# Command aliases.
alias blfull='sudo tee /sys/class/backlight/acpi_video0/brightness <<< 11'

#-------------------------------------------------------------------------------
# Exports
##

export HISTFILESIZE=5000
export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH

#-------------------------------------------------------------------------------
# ROS Configuration
##

indigo()
{
  source /opt/ros/indigo/setup.bash
  export LD_LIBRARY_PATH=/opt/ros/indigo/lib:$LD_LIBRARY_PATH
  export PYTHONPATH=/opt/ros/indigo/lib/python2.7/site-packages:$PYTHONPATH
  export PKG_CONFIG_PATH="/opt/ros/indigo/lib/pkgconfig:$PKG_CONFIG_PATH"
  #export ROS_PACKAGE_PATH=/path/to/your/package/path:$ROS_PACKAGE_PATH

  alias catkin_make="catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so"
}

indigo
