{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.shellInit = ''
    eval "$(${config.homebrew.brewPrefix}/brew shellenv)"
  '';

  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "zap";
  homebrew.global.brewfile = true;
  homebrew.taps = [];
  homebrew.brews = [];

  # https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
  programs.zsh.interactiveShellInit = ''
    if type brew &>/dev/null; then
      FPATH="$(brew --prefix)/share/zsh/site-functions:''${FPATH}"
      autoload -Uz compinit
      compinit
    fi
  '';
}
