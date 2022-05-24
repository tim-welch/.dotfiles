# Everything goes into .bashrc instead of .bash_profile because
# .bashrc always runs
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

# Quit if not interactive
[[ $- != *i* ]] && return

# Configure the shell
set -o vi             # Enable vi mode
shopt -s autocd       # cd into a directory
shopt -s checkjobs    # check for stopped or running jobs before exiting shell
shopt -s checkwinsize # Reset LINES and COLUMNS after each command completes
shopt -s dotglob      # Match dotfiles in pathname expansion
shopt -s globstar     # Enable ** in pathnames
shopt -s histappend   # Append to HISTFILE rather than overwrite
shopt -s histverify   # Don't automattically execute history substitution
shopt -s nocaseglob   # Ignore case when performing pathname expansion
#shopt -s progcomp_alias # Allow programmable completion through aliases

# Prompt
source "$XDG_CONFIG_HOME/bash/prompt"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
