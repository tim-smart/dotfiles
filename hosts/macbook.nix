{
  config,
  lib,
  inputs,
  pkgs,
  self,
  ...
}: let
  inherit (lib) attrValues;

  primaryUser = config.modules.darwin.primary-user.username;
in {
  # imports = [
  #   ./macbook/homebrew.nix
  # ];

  nix.enable = false;
  nix.settings.experimental-features = "nix-command flakes";

  nix.settings.substituters = ["https://nix-community.cachix.org"];
  nix.settings.trusted-public-keys = ["nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];

  # Environment Configuration
  environment = {
    systemPackages = with pkgs; [
      coreutils
      direnv
      findutils
      ncurses
      neovim
    ];
    variables = {
      EDITOR = "nvim";
    };
  };

  # Home Manager Configuration
  home-manager.extraSpecialArgs = {inherit inputs self;};
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users = {
    "${primaryUser}" = import "${self}/home/${primaryUser}.nix";
  };
  home-manager.sharedModules = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  # Primary User
  system.primaryUser = primaryUser;
  modules.darwin.primary-user = {
    username = "tim";
    fullName = "Tim Smart";
    email = "hello@timsmart.co";
  };

  users.users.tim = {
    name = "tim";
    home = "/Users/tim";
    shell = pkgs.zsh;
  };

  # Networking Configuration
  networking = {
    hostName = "tims-macbook";
  };

  nixpkgs = {
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };

  # Global Programs
  programs = {
    zsh.enable = true;
  };

  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyleSwitchesAutomatically = true;
      KeyRepeat = 120;
      NSAutomaticWindowAnimationsEnabled = false;
    };

    dock = {
      autohide = true;
      mru-spaces = false;
      show-recents = false;
    };
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  # Enable auto-upgrading Nix
  nix.package = pkgs.nix;

  # Enforce the Nix Darwin state version - used for backwards compatibility,
  # please read the changelog before changing
  # $ darwin-rebuild changelog
  system.stateVersion = lib.mkDefault 4;
}
