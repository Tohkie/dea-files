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
 
  # settings for cs2
  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  boot.extraModprobeConfig = ''
    options iwlwifi power_save=0
    options iwlwifi uapsd_disable=1
    options iwlwifi disable_11ax=1
    options iwlmvm power_scheme=1
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
