{inputs, ...}: {
  nodes = {
    base = inputs.nixpkgs-unstable;
    homeManager = inputs.home-manager-unstable;

    args = {inherit inputs;};
    modules = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
      inputs.mangowm.nixosModules.mango
    ];

    groups = {
      # desktop environment group
      yezelhlev = {};
    };

    nodes = {
      # laptop
      nahemah = {
        system = "x86_64-linux";
        groups = groups: [groups.yezelhlev];
      };

      # pc
      sandalphon = {
        system = "x86_64-linux";
        groups = groups: [groups.yezelhlev];
      };
    };
  };
}
