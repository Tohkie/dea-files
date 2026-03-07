{upkgs, ...}: {
  programs.steam = {
    enable = true;
    package = upkgs.millennium-steam;

    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true;

    extraCompatPackages = with upkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with upkgs; [
    steamcmd
    protonup-qt

    bottles
    mangohud
  ];
}
