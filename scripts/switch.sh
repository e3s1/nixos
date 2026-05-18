#!/usr/bin/env bash
set -e

sudo nixos-rebuild switch --flake /etc/nixos
GENERATION=$(sudo nix-env -p /nix/var/nix/profiles/system --list-generations | grep current | awk '{print $1}')
echo "Successfully built generation $GENERATION"
git -C "/etc/nixos" add -A
git -C "/etc/nixos" commit -m "$GENERATION"
git -C "/etc/nixos" push
