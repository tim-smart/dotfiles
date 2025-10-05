#!/usr/bin/env bash
git add .
sudo nix run nix-darwin -- switch --flake .?submodules=1#macbook
