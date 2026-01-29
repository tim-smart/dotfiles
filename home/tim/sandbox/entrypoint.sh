#!/bin/bash

if ! command -v nix >/dev/null 2>&1; then
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
    --extra-conf "sandbox = false" \
    --no-start-daemon \
    --no-confirm

  nix profile add \
    nixpkgs#direnv \
    nixpkgs#git \
    nixpkgs#neovim \
    nixpkgs#nodejs_24 \
    nixpkgs#ripgrep \
    nixpkgs#fd \
    nixpkgs#gnused \
    nixpkgs#curl \
    nixpkgs#wget \
    nixpkgs#gh \
    nixpkgs#jq \
    nixpkgs#less \
    nixpkgs#coreutils \
    nixpkgs#tree
else
  groupadd -r nixbld
  for n in $(seq 1 32); do
    useradd -c "Nix build user $n" -d /var/empty -g nixbld -G nixbld -M -N -r -s "$(which nologin)" nixbld$n;
  done
fi

npm="$(nix eval nixpkgs#nodejs_24 --raw)/bin/npm"

export PATH="${PATH}:/nix/var/nix/profiles/default/bin"
export PATH="$($npm config get prefix -g)/bin:$PATH"

$npm install -g npm@latest lalph@latest @openai/codex@latest opencode-ai@dev
eval "$(direnv hook bash)"

if [ ! -f ~/.local/share/opencode/auth.json ]; then
  opencode auth login
fi
if [ ! -f ~/.codex/auth.json ]; then
  codex login --device-auth
fi

if [ ! -f ~/.config/gh/hosts.yml ]; then
  gh auth login
fi

git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
gh auth setup-git

direnv allow || true

exec /bin/bash
