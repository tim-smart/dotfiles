{
  config,
  pkgs,
  ...
}: {
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
