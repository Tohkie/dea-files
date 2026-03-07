{
  inputs,
  root,
  ...
}: {
  home.username = "dea";
  home.homeDirectory = "/home/dea";
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  imports = [
    inputs.plasma-manager.homeModules.plasma-manager

    /${root}/homes/modules/bash
    /${root}/homes/modules/starship
    /${root}/homes/modules/vim
    /${root}/homes/modules/mpv
  ];

  programs.plasma = {
    enable = true;
    kwin.edgeBarrier = 50;
  };

  # DO NOT MODIFY
  home.stateVersion = "25.11";
}
