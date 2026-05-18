#!/usr/bin/env bash
set -e

sudo nixos-rebuild switch --flake /etc/nixos
GENERATION=$(nix-env --list-generations | grep current | awk '{print $1}')
git -C "/etc/nixos" add -A
git -C "/etc/nixos" commit -m "$GENERATION"
git -C "/etc/nixos" push
