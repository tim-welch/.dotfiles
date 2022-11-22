# Since ~/.bash_profile will be picked up first, source .profile
[ -f $HOME/.profile ] && source $HOME/.profile
# Run bashrc
[ -f $HOME/.bashrc ] && source $HOME/.bashrc

. "$HOME/.cargo/env"
