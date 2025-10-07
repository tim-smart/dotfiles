{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Tim Smart";
    userEmail = "hello@timsmart.co";
    extraConfig = {
      pull = {
        rebase = true;
      };
      push = {
        autoSetupRemote = true;
      };
    };
  };

  home.packages = with pkgs; [gitAndTools.gh];
}
