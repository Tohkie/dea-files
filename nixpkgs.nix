{
  inputs,
  system,
  ...
} @ args: {
  nixpkgs.channels = {
    default = {
      inherit system;
      overlays = [
        (import ./overlays args)
      ];
      config = {
        allowUnfree = true;
        allowBroken = false;
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
      };
    };
  };
}
