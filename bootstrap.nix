#!/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
cd $SCRIPT_DIR
GIT_ROOT=$(git rev-parse --show-toplevel)

echo "Installing nix package manager"
sudo install -d -m755 -o $(id -u) -g $(id -g) /nix
curl -L https://nixos.org/nix/install | sh

