{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    aerospace
    jankyborders
  ];

  home.file.".aerospace.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Volumes/Code/dotfiles/home/tim/aerospace/aerospace.toml";
  };
}
