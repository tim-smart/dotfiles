{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Tim Smart";
        email = "hello@timsmart.co";
      };
      commit = {
        gpgsign = true;
      };
      init = {
        defaultBranch = "master";
      };
      pull = {
        rebase = true;
      };
      push = {
        autoSetupRemote = true;
      };
    };
  };

  home.packages = with pkgs; [gh];
}
