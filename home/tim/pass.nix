{
  config,
  pkgs,
  ...
}: let
  motus = pkgs.stdenv.mkDerivation rec {
    name = "motus";
    src = pkgs.fetchzip {
      url = "https://github.com/oleiade/motus/releases/download/v0.4.0/motus_0.4.0_darwin_arm64.zip";
      sha256 = "00d6sw4jzr6ymqbc23siwv47grjd6k767n6kj0dd3lj73g0m45sr";
      stripRoot = false;
    };
    phases = ["installPhase"];
    installPhase = ''
      mkdir -p $out/bin
      cp $src/motus $out/bin
      chmod +x $out/bin/motus
    '';
  };
in {
  home.packages = [motus];
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [exts.pass-otp]);
  };
  programs.browserpass = {
    enable = true;
    browsers = ["chrome"];
  };
  programs.zsh.initContent = ''
    _fzf_complete_pass() {
      _fzf_complete +m -- "$@" < <(
        local prefix
        prefix="''${PASSWORD_STORE_DIR:-$HOME/.password-store}"
        command find -L "$prefix" \
          -name "*.gpg" -type f | \
          sed -e "s#''${prefix}/\{0,1\}##" -e 's#\.gpg##' -e 's#\\#\\\\#' -e 's# #\\ #g' | sort
      )
    }
    newpass() {
      local password="$(motus --no-clipboard memorable -c -s numbers-and-symbols)"
      local name="$1"
      local username="$2"
      if [ ! -z "$username" ]; then
        printf "%s\nusername: %s" "$password" "$username" | pass insert "$name" -m
      else
        printf "%s" "$password" | pass insert "$name" -m
      fi
      printf "%s" "$password" | pbcopy
      pass git pull
      pass git push
    }
  '';
  programs.zsh.oh-my-zsh.plugins = ["pass"];
}
