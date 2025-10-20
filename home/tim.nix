{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./tim/aerospace.nix
    ./tim/age.nix
    ./tim/alacritty.nix
    ./tim/bat.nix
    ./tim/claude.nix
    ./tim/direnv.nix
    ./tim/ghostty.nix
    ./tim/git.nix
    ./tim/gpg.nix
    ./tim/k8s.nix
    ./tim/neovim.nix
    ./tim/netrc.nix
    ./tim/pass.nix
    ./tim/syncthing.nix
    ./tim/tmux.nix
    ./tim/yaak.nix
    ./tim/zsh.nix
  ];

  # System Preferences Configuration
  targets.darwin = {
    search = "Google";
  };

  # Home Manager Configuration
  home = {
    username = lib.mkDefault config.modules.darwin.primary-user.username;
    homeDirectory = lib.mkDefault "/Users/${config.home.username}";
    stateVersion = "24.05";
  };

  home.packages = with pkgs; [
    alejandra
    jq
    ripgrep
    sops
  ];

  # XDG Base Directory Specification
  xdg = {
    enable = true;
    configHome = "${config.home.homeDirectory}/.config";
    cacheHome = "${config.home.homeDirectory}/.cache";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
  };

  sops = {
    gnupg = {
      home = "~/.gnupg";
    };
  };
}
