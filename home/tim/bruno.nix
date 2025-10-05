{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [bruno];
}
