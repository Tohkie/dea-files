{
  lib,
  pkgs,
  inputs,
  ...
}:


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

    croc
    syncplay
  ];

  programs.neovim = { };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ (import ./exprs/overlay.nix { }) ];
  imports = [
    ./homemanager/mpv.nix
    ./hosts/sandalphon/mcsr/home.nix
    inputs.plasma-manager.homeModules.plasma-manager
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

  programs.plasma = {
    enable = true;
    kwin.edgeBarrier = 50;
  };

  programs.home-manager.enable = true;
}