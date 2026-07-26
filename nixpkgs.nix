{
  inputs,
  system,
  ...
}@args:
{
  nixpkgs.channels = rec {
    base = spkgs;
    spkgs = {
      inherit system;
      source = inputs.nixpkgs;
      overlays = [
        (import ./overlays args)
      ];
      config = {
        allowUnfree = true;
        allowBroken = false;
        permittedInsecurePackages = [
          "pnpm-10.29.2"
        ];
      };
    };

    # nixpkgs-unstable (upkgs)
    upkgs = {
      inherit system;
      source = inputs.nixpkgs-unstable;
      overlays = [
        inputs.millennium.overlays.default
        (import ./overlays args)
      ];
      config = {
        allowUnfree = true;
        allowBroken = false;
        permittedInsecurePackages = [
          "pnpm-10.29.2"
        ];
      };
    };
  };
}
