# credit to uku: https://git.uku3lig.net/uku/flake/src/branch/main/programs/mcsr
{
  lib,
  pkgs,
  config,
  hjem,
  ...
}:

let
  ninjabrain-bot = pkgs.callPackage ./ninjabrain.nix { };
  waywork = pkgs.callPackage ./waywork.nix { };
  cfg = config.programs.waywall;
in
{
  options = {
    programs.waywall = {
      width = lib.mkOption {
        type = lib.types.int;
        default = 1920;
      };

      height = lib.mkOption {
        type = lib.types.int;
        default = 1080;
      };
    };
  };
  
  config = {
    environment.systemPackages = [ pkgs.waywall ];
    hjem.users.dea.files.".config/waywall/init.lua".text = ''
      package.path = package.path .. ";${waywork}/?.lua"
      local ninb_path = "${lib.getExe ninjabrain-bot}"
      local resolution = { w = ${toString cfg.width}, h = ${toString cfg.height} }
      local images = {
        eye_overlay = "${./eye-overlay.png}",
        thin = "${./yukata.jpg}",
        wide = "${./yukata.jpg}",
        tall = "${./yukata.jpg}",
      }
      -- end globals
    ''
    + builtins.readFile ./waywall.lua;
  };
}
