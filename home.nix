{
  pkgs,
  inputs,
  ...
}:

{
  # Enables nix commands + flakes - set in configuration.nix
  # nix = {
  #   settings.extra-experimental-features = [
  #     "nix-command"
  #     "flakes"
  #     "pipe-operators"
  #   ];
  # };

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

  # programs.neovim = { };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (import ./exprs/overlay.nix { })
    (self: super: {
      element-desktop = super.element-desktop.overrideAttrs (
        final: prev: {
          desktopItems = [
            ((builtins.elemAt prev.desktopItems 0).override {
              exec = "element-desktop %u --password-store=\"gnome-libsecret\"";
            })
          ];
        }
      );
    })
  ];
  imports = [
    ./homemanager/mpv.nix
    ./hosts/sandalphon/mcsr/home.nix
    ./homemanager/vim/nixcats.nix
    inputs.plasma-manager.homeModules.plasma-manager
  ];

  # dconf.settings = {};

  # home = {};

  programs.bash = {
    enable = true;
    bashrcExtra = builtins.readFile ./homemanager/bashrc;
  };

  programs.starship = {
    enable = true;
    settings = builtins.readFile ./homemanager/starship.toml
            |> builtins.fromTOML;
  };

  programs.plasma = {
    enable = true;
    kwin.edgeBarrier = 50;
  };

  programs.home-manager.enable = true;
}
