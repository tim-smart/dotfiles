{
  config,
  pkgs,
  ...
}: {
  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
    stdlib = ''
      # enable asdf support
      use_asdf() {
        source_env "$(${pkgs.asdf-vm}/bin/asdf direnv envrc "$@")"
      }
    '';
    config = {
      global = {
        strict_env = true;
        warn_timeout = "12h";
      };
      whitelist = {
        prefix = ["/Volumes/Code"];
      };
    };
  };
  programs.zsh.initContent = ''
    flakeify() {
      cat << EOF > flake.nix
      {
        inputs = {
          nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        };
        outputs = {nixpkgs, ...}: let
          forAllSystems = function:
            nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
              system: function nixpkgs.legacyPackages.\''${system}
            );
        in {
          formatter = forAllSystems (pkgs: pkgs.alejandra);
          devShells = forAllSystems (pkgs: {
            default = pkgs.mkShell {
              packages = with pkgs; [
                bun
                corepack
                nodejs
              ];
            };
          });
        };
      }
    EOF

      git add flake.nix || true

      touch .gitignore
      echo ".direnv/" >> .gitignore

      cat << EOF > .envrc
      use flake
    EOF
    }
  '';
}
