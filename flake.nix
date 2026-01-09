{
  description = "release the dea files";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;

      commonModules = [
        ./configuration.nix
        ./user.nix
        inputs.nix-flatpak.nixosModules.nix-flatpak
      ];
    in
    {
      # laptop
      nixosConfigurations.nahemah = lib.nixosSystem {
        specialArgs = {
          host = "nahemah";
          inherit inputs;
        };
        modules = [
          ./hosts/nahemah/hardware-configuration.nix
        ]
        ++ commonModules;
      };

#       pc
      nixosConfigurations.sandalphon = lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/sandalphon/hardware-configuration.nix
          ./hosts/sandalphon/configuration.nix
        ]
        ++ commonModules;
      };
    };
}
