{
  config,
  pkgs,
  ...
}: let
  linear-cli = pkgs.stdenv.mkDerivation rec {
    name = "linear-cli";
    src = pkgs.fetchzip {
      url = "https://github.com/schpet/linear-cli/releases/download/v1.7.0/linear-aarch64-apple-darwin.tar.xz";
      sha256 = "sha256-lqNrzwZKh+QActU92r9h9d843iclyvPmafCHEyrHm+s=";
    };
    phases = ["installPhase"];
    installPhase = ''
      mkdir -p $out/bin
      cp $src/linear-aarch64-apple-darwin/linear $out/bin
      chmod +x $out/bin/linear
    '';
  };
in {
  home.packages = [linear-cli];
}
