{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  home.packages = with pkgs; [
    nodejs
  ];

  xdg.configFile."nvim/init.lua" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Volumes/Code/dotfiles/home/tim/neovim/init.lua";
  };
  xdg.configFile."nvim/lua" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Volumes/Code/dotfiles/home/tim/neovim/lua";
  };
  xdg.configFile."nvim/snippets" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Volumes/Code/dotfiles/home/tim/neovim/snippets";
  };
}
