{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    settings = {
      theme = "light:TokyoNight Day,dark:TokyoNight Storm";
      font-size = 16;
      font-thicken = true;
      macos-titlebar-style = "hidden";
      window-padding-x = 10;
      window-padding-y = 10;
    };
  };
}
