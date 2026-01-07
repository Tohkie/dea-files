{ config, pkgs, ...}:

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

    syncplay
    
  ];

  programs.neovim = # nvm??
  {};

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

  programs.home-manager.enable = true;
}