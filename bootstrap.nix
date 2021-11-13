#!/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
cd $SCRIPT_DIR
GIT_ROOT=$(git rev-parse --show-toplevel)

$GIT_ROOT/nix-home-manager/.local/bin/setup-nix-home-manager
source ~/.profile
home-manager build
home-manager switch
