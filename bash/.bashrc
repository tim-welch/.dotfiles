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

