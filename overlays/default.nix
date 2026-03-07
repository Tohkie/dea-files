{
  inputs,
  system,
  ...
}: (
  self: super: {
    element-desktop = super.element-desktop.overrideAttrs (
      final: prev: {
        desktopItems = [
          ((builtins.elemAt prev.desktopItems 0).override {
            exec = "element-desktop %u --password-store=\"gnome-libsecret\"";
          })
        ];
      }
    );

    waywall = super.waywall.overrideAttrs (
      f: p: {
        version = "0-unstable-2026-01-06";

        src = super.fetchFromGitHub {
          owner = "tesselslate";
          repo = "waywall";
          rev = "c6504f95f8d757a2e060c4df8bd3ed145ad59e8d";
          hash = "sha256-kfBsppc+esz0Q6iIIKAeOMwkIWdN12AlH3Dji8bU32c=";
        };
      }
    );
  }
)
