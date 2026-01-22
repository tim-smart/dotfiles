{
  config,
  pkgs,
  ...
}: {
  programs.zsh.initContent = ''
    sandbox() {
      args=("$@")

      datadir=.lalph/sandbox

      mkdir -p "$datadir"

      git_author_name=$(git config user.name)
      git_author_email=$(git config user.email)

      # pnpm store
      pnpmstore="$datadir/pnpm-store"

      # gh data
      ghdata="$datadir/gh"

      # opencode data
      opencodedata="$datadir/opencode"
      opencode_state="$opencodedata/state"
      opencode_share="$opencodedata/share"
      mkdir -p "$opencode_state" "$opencode_share"

      # codex data
      codexdata="$datadir/codex"
      mkdir -p "$codexdata"

      docker volume create sandbox-nix-store

      docker run --rm -it \
        -v "$PWD":/app \
        -v sandbox-nix-store:/nix \
        -v "$opencode_state":/root/.local/state/opencode \
        -v "$opencode_share":/root/.local/share/opencode \
        -v "$codexdata":/root/.codex \
        -v "$ghdata":/root/.config/gh \
        -v "$pnpmstore":/root/.local/share/pnpm/store/v10 \
        -e GIT_AUTHOR_NAME="$git_author_name" \
        -e GIT_AUTHOR_EMAIL="$git_author_email" \
        "''${args[@]}" \
        "$(docker build -q /Volumes/Code/dotfiles -f /Volumes/Code/dotfiles/home/tim/sandbox/Dockerfile)"
    }
  '';
}
