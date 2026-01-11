{
  description = "Tim Smart configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    darwin,
    home-manager,
    ...
  }: let
    defaultModuleArgs = {
      _module.args.self = self;
      _module.args.inputs = inputs;
    };
  in {
    darwinConfigurations.macbook = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        defaultModuleArgs
        home-manager.darwinModules.home-manager
        ./modules/darwin/primary-user.nix
        ./hosts/macbook.nix
      ];
    };
  };
}
