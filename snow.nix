{inputs, ...}: {
  nodes = {
    base = inputs.nixpkgs-unstable;
    homeManager = inputs.home-manager-unstable;

    args = {inherit inputs;};
    modules = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
      inputs.sddm-silent.nixosModules.default
      inputs.stylix.nixosModules.stylix
      inputs.mango.nixosModules.mango
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
