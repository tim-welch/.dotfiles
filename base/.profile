# In an interactive login shell (e.g. a terminal, tmux, or ssh connection), bash looks for login
# scripts in this order:
#
# /etc/profile - this is always executed if it exists
# 
# bash then looks in the home directory for one of these scripts, executing the first readable
# file found and ignoring the others.
#
# ~/.bash_profile
# ~/.bash_login
# ~/.profile

# I use this file for very basic environment setup that is needed by all shells. It is expected
# that the shell's profile script will call this script.

# XDG Base Directories
# Keep the home directory as clean as possible
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# Default applications
# These are defined here because regardless of shell, I want to use the same applications.
# Also note these are not defined as part of an application's configuration. Applications
# do not get to choose whether they are default or not.
export EDITOR=vim
export GIT_EDITOR=$EDITOR
export VISUAL=$EDITOR
export TERMINAL=
export BROWSER=

# Run any configuration profile scripts
# Configuration directories can place scripts in ~/.config/profile to be run
# as part of the login profile.
if [ -d "$HOME/.config/profile" ]; then
	echo "Sourcing profile scripts"
fi

# Configure nix home manager
[ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ] && . "$HOME/.nix-profile/etc/profile.d/nix.sh"

# Make sure user bin directories are at the beginning of PATH
[ -d "$HOME/bin" ] && PATH="$HOME/bin:${PATH#*$HOME/bin}"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:${PATH#*$HOME/.local/bin}"
export PATH

# Register my SSH id
keychain --nogui --quiet $HOME/.ssh/id_rsa
source $HOME/.keychain/$(hostname)-sh

