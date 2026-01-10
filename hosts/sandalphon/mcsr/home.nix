# mcsr credit to uku: https://git.uku3lig.net/uku/flake/src/branch/main/programs/mcsr
{
  lib,
  pkgs,
  ...
}:

let
  ninjabrain-bot = pkgs.callPackage ./ninjabrain.nix { };
  waywork = pkgs.callPackage ./waywork.nix { };
in
{
  home.file.dea.target = ".config/waywall/init.lua";
  home.file.dea.text = ''
    package.path = package.path .. ";${waywork}/?.lua"
    local ninb_path = "${lib.getExe ninjabrain-bot}"
    local resolution = { w = ${toString 1920}, h = ${toString 1080} }
    local images = {
      eye_overlay = "${./eye-overlay.png}",
      thin = "${./yukata.jpg}",
      wide = "${./yukata.jpg}",
      tall = "${./yukata.jpg}",
    }
    -- end globals
  ''
  + builtins.readFile ./waywall.lua;
}
