{
  lib,
  inputs,
  pkgs,
  config,
  ...
}:

let
  nvidiaPackage = config.hardware.nvidia.package;
in
{
  networking.hostName = lib.mkDefault "sandalphon";

  # nvidia drivers
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = lib.mkDefault [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = false;

    powerManagement.finegrained = false;
    # open = true;
    open = lib.mkOverride 990 (nvidiaPackage ? open && nvidiaPackage ? firmware);
    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  services.flatpak = {
    enable = true;
    packages = [
      {
        appId = "org.vinegarhq.Sober";
        origin = "flathub";
      }
    ];
    update.onActivation = true;
    uninstallUnmanaged = true;
  };

  environment.systemPackages = with pkgs; [
    prismlauncher # minecraft
    waywall # mcsr

    r2modman
  ];
}
