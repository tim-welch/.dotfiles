# Order of initialization:
# - Interactive login shell (ssh or local login):
# -- /etc/profile
# -- Then, first of: ~/.bash_profile, ~/.bash_login, ~/.profile
# - Interactive non-login shell (new shell):
# -- ~/.bashrc
# - Non-interactive shell (e.g. to run a shell script)
# -- Source the file in $BASH_ENV

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
export EDITOR=nvim
export GIT_EDITOR=$EDITOR
export VISUAL=$EDITOR
export TERMINAL=
export BROWSER=

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Run any configuration profile scripts
# Configuration directories can place scripts in ~/.config/profile to be run
# as part of the login profile.
if [ -d "$XDG_CONFIG_HOME/profile" ]; then
    for f in "$XDG_CONFIG_HOME/profile"/*; do . "$f"; done
fi

# Configure nix home manager
[ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ] && . "$HOME/.nix-profile/etc/profile.d/nix.sh"

# Configure cargo
if [ -e "$HOME/.cargo/env" ]
then
    . "$HOME/.cargo/env"
elif [ -d "$HOME/.cargo/bin" ]
then
    PATH="$HOME/.cargo/bin:${PATH#*$HOME/.cargo/bin}"
fi

# Configure go
[ -e "/usr/local/go/bin" ] && PATH="/usr/local/go/bin:${PATH#*/usr/local/go/bin}"


# Make sure user bin directories are at the beginning of PATH
[ -d "$HOME/bin" ] && PATH="$HOME/bin:${PATH#*$HOME/bin}"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:${PATH#*$HOME/.local/bin}"
export PATH

# Register my SSH id
[ -e $HOME/.ssh/id_rsa ] && keychain --nogui --quiet $HOME/.ssh/id_rsa
[ -e $HOME/.ssh/id_ed25519 ] && keychain --nogui --quiet $HOME/.ssh/id_ed25519
. $HOME/.keychain/$(hostname)-sh

