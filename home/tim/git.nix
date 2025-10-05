{config, pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "Tim Smart";
    userEmail = "hello@timsmart.co";
  };

  home.packages = with pkgs; [gitAndTools.gh];
}