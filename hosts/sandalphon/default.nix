{config, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./games.nix
  ];

  networking.hostName = "sandalphon";

  # nvidia drivers
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = true;

    nvidiaSettings = true;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };

  services.flatpak = {
    enable = true;
    packages = [
      {
        appId = "org.vinegarhq.Sober";
        origin = "flathub";
      }
    ];
  };

  home-manager.sharedModules = [
    ./mcsr
  ];
}
