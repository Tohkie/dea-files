{
  config,
  root,
  ...
}: {
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

  # desktop theming
  programs.silentSDDM = {
    backgrounds.dea = /${root}/assets/wallpapers/lock.png;
    profileIcons.dea = /${root}/assets/pfps/happy.jpg;
    settings = {
      "General" = {
        background-fill-mode = "fill";
      };
      "LockScreen" = {
        background = "lock.png";
        blur = 0;
      };
      "LockScreen.Clock" = {
        position = "center-left";
        align = "center";
        font = "DroidSansM Nerd Font";
        font-size = 160;
      };
      "LockScreen.Date" = {
        display = false;
      };
      "LockScreen.Message" = {
        display = true;
        position = "bottom-center";
        align = "center";
        text = "Have a maimai day :3";
        font-family = "DroidSansM Nerd Font";
        display-icon = false;
      };
      "LoginScreen" = {
        background = "lock.png";
      };
      "LoginScreen.LoginArea" = {
        position = "left";
        margin = 96;
      };
      "LoginScreen.LoginArea.Avatar" = {
        shape = "square";
        active-border-color = "#c4c4f1";
        active-border-size = 4;
      };
      "LoginScreen.LoginArea.Username" = {
        font-family = "DroidSansM Nerd Font";
      };
      "LoginScreen.LoginArea.PasswordInput" = {
        font-family = "DroidSansM Nerd Font";
        width = 256;
      };
      "LoginScreen.LoginArea.Spinner" = {
        font-family = "DroidSansM Nerd Font";
      };
      "LoginScreen.LoginArea.WarningMessage" = {
        font-family = "DroidSansM Nerd Font";
      };
      "LoginScreen.MenuArea.Buttons" = {
        font-family = "DroidSansM Nerd Font";
        margin-top = 200;
      };
      "LoginScreen.MenuArea.Popups" = {
        font-family = "DroidSansM Nerd Font";
      };
      "Tooltips" = {
        font-family = "DroidSansM Nerd Font";
      };
    };
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
