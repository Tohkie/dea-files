{
  lib,
  pkgs,
  ...
}:

let
  ninjabrain-bot = pkgs.callPackage ./hosts/sandalphon/mcsr/ninjabrain.nix { };
  waywork = pkgs.callPackage ./hosts/sandalphon/mcsr/waywork.nix { };
in
{
  # Enables nix commands + flakes
  nix = {
    settings.extra-experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Home manager things
  home.username = "dea";
  home.homeDirectory = "/home/dea";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum # libs for Qt5
    libsForQt5.qt5ct
    libsForQt5.qt5.qtbase
    btop-cuda

    syncplay
  ];

  programs.neovim = { };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  nixpkgs.config.allowUnfree = true;
  imports = [
    ./homemanager/mpv.nix
  ];

  # dconf.settings = {};

  # home = {};

  programs.bash = {
    enable = true;
    bashrcExtra = builtins.readFile ./homemanager/bashrc;
  };

  # programs.starship = {
  #   enable = true;
  #   settings = {
  #     add_newline = true;

  #     format = "$directory\n$character";

  #     directory = {
  #       truncation_length = 3;
  #       truncate_to_repo = false;
  #       format = "[$path]($style) [❤](bold fg:#ff5fff) ";
  #       style = "bold cyan";
  #     };
  #     character = {
  #       success_symbol = "";
  #       error_symbol = "";
  #     };
  #   };
  # };

  # mcsr credit to uku: https://git.uku3lig.net/uku/flake/src/branch/main/programs/mcsr
  home.file.dea.target = ".config/waywall/init.lua";
  home.file.dea.text = ''
    package.path = package.path .. ";${waywork}/?.lua"
    local ninb_path = "${lib.getExe ninjabrain-bot}"
    local resolution = { w = ${toString 1920}, h = ${toString 1080} }
    local images = {
      eye_overlay = "${./hosts/sandalphon/mcsr/eye-overlay.png}",
      thin = "${./hosts/sandalphon/mcsr/yukata.jpg}",
      wide = "${./hosts/sandalphon/mcsr/yukata.jpg}",
      tall = "${./hosts/sandalphon/mcsr/yukata.jpg}",
    }
    -- end globals
  ''
  + builtins.readFile ./hosts/sandalphon/mcsr/waywall.lua;

  programs.home-manager.enable = true;
}
