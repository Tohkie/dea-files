{
  description = "release the dea files";

  inputs = {
    systems.url = "github:nix-systems/default-linux";

    nixpkgs.url = "github:NixOS/nixpkgs";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager-unstable.url = "github:nix-community/home-manager";
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs-unstable";

    cerulean.url = "github:cry128/cerulean";
    cerulean.inputs.systems.follows = "systems";
    cerulean.inputs.nixpkgs.follows = "nixpkgs-unstable";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    nixcats.url = "github:BirdeeHub/nixCats-nvim";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.home-manager.follows = "home-manager-unstable";
    };

    millennium = {
      url = "github:SteamClientHomebrew/millennium?dir=packages/nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.home-manager.follows = "home-manager-unstable";
    };
  };

  outputs = {cerulean, ...} @ inputs:
    cerulean.snow.flake inputs ./.;
}
