# Call .profile to get basic environment set up
source $HOME/.profile

# Clean home directory
mkdir -p "$XDG_DATA_HOME"/bash

# History
HISTSIZE=1000
SAVEHIST=1000
HISTCONTROL=ignoreboth # don't save duplicates or commands starting with space
export HISTFILE="$XDG_DATA_HOME"/bash/history

# Completions
export BASH_COMPLETIONS_DIR="$XDG_CONFIG_HOME/bash/completions"
[ -f /usr/share/bash-completion/bash-completion ] && source /usr/share/bash-completion/bash-completion
if [ -d "$BASH_COMPLETIONS_DIR" ]; then
    for f in "$BASH_COMPLETIONS_DIR"/*; do . "$f"; done
fi

# Aliases
export BASH_ALIAS_DIR="$XDG_CONFIG_HOME"/bash/aliases
if [ -d "$BASH_ALIAS_DIR" ]; then
    for f in "$BASH_ALIAS_DIR"/*; do . "$f"; done
fi

# Run bashrc
[ -f $HOME/.bashrc ] && source $HOME/.bashrc

