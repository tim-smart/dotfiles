{pkgs, ...}: let
  pinentry-touchid = pkgs.callPackage ../../pkgs/pinentry-touchid.nix {};
in {
  programs.gpg = {
    enable = true;
  };

  home.file.".gnupg/gpg-agent.conf".text = ''
    default-cache-ttl 3600
  '';
}
