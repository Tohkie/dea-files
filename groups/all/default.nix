# configuration shared by all cerulean nodes
{lib, ...}: {
  nix.settings.extra-experimental-features = [
    "nix-command"
    "flakes"
    "pipe-operators"
  ];

  boot.loader.systemd-boot.enable = lib.mkDefault true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = lib.mkDefault "tohka";
  networking.networkmanager.enable = true;
  networking.nftables.enable = true; # firewall
  networking.firewall.enable = true;
  # networking.wireless.enable = true;
  networking.networkmanager.logLevel = "INFO";
  networking.networkmanager.wifi.scanRandMacAddress = false;

  # hi dea - edward
  networking.networkmanager.wifi.powersave = false;
  networking.networkmanager.connectionConfig = {
    "wifi.bgscan" = "simple:30:-70:300";
    "wifi.cloned-mac-address" = lib.mkForce "permanent";
  };
  boot.extraModprobeConfig = ''
   options rtw88_core disable_lps_deep=y
   options rtw88_pci disable_msi=y disable_aspm=y
   options rtw88_8822ce disable_lps_deep=y
  '';

  time.timeZone = lib.mkDefault "America/New_York";
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
}
