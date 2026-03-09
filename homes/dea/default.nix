{
  config,
  inputs,
  root,
  ...
}: {
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager # 

    /${root}/homes/modules/bash
    /${root}/homes/modules/starship
    /${root}/homes/modules/vim
    /${root}/homes/modules/mpv
    /${root}/homes/modules/zen
  ];

  home.username = "dea";
  home.homeDirectory = "/home/dea";
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
  home.shellAliases = {
    eep = "systemctl suspend";
    hibernate = "systemctl hybrid-sleep";
    restart = "systemctl reboot";
    shutdown = "systemctl poweroff";
    vim = "dvim";
    nvim = "dvim";
    rebuild = "nh os switch ~/dea-files";
    trybuild = "nh os test ~/dea-files";
  };

  programs.plasma = {
    enable = true;
    kwin.edgeBarrier = 50;
  };

  # DO NOT MODIFY
  home.stateVersion = "25.11";
}
