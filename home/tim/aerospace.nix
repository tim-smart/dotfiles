{
  config,
  pkgs,
  ...
}: let
  aerospace-swipe = pkgs.stdenv.mkDerivation {
    name = "aerospace-swipe";
    src = pkgs.fetchFromGitHub {
      owner = "acsandmann";
      repo = "aerospace-swipe";
      rev = "main";
      hash = "sha256-Qfj6+qZ/SQND+LMOSdUiYGDXFxU6+xmXxkYerxsdkcE=";
    };

    NIX_ENFORCE_NO_NATIVE = false;
    preferLocalBuild = true;
    allowSubstitutes = false;

    buildInputs = with pkgs; [
      gcc
      apple-sdk_15
      (darwinMinVersionHook "15")
    ];
    buildPhase = ''
      make bundle
    '';
    installPhase = ''
      mkdir -p $out/bin
      cp swipe $out/bin/swipe
    '';
  };
in {
  home.packages = with pkgs; [
    aerospace
    jankyborders
  ];

  xdg.configFile."aerospace/aerospace.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Volumes/Code/dotfiles/home/tim/aerospace/aerospace.toml";
  };
  xdg.configFile."aerospace/gaps" = {
    text = ''
      #!/usr/bin/env zsh
      if [[ -n "$1" ]]; then
        size="[{ monitor.main = $1 }, 8]"
      else
        size="8"
      fi
      sed -i ''' 's/^outer\.left = .*/outer.left = '$size'/; s/^outer\.right = .*/outer.right = '$size'/' /Volumes/Code/dotfiles/home/tim/aerospace/aerospace.toml
      aerospace reload-config
    '';
    executable = true;
  };
}
