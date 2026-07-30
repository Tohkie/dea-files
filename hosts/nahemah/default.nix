{
  root,
  ... 
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "nahemah";
  
  # lock screen theming
  programs.silentSDDM = {
    backgrounds.dea = /${root}/assets/wallpapers/lantern.png;
    profileIcons.dea = /${root}/assets/pfps/happy.jpg;
    settings = {
      "General" = {
        background-fill-mode = "fill";
      };
      "LockScreen" = {
        background = "lantern.png";
        blur = 0;
      };
      "LockScreen.Clock" = {
        position = "center-right";
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
        background = "lantern.png";
      };
      "LoginScreen.LoginArea" = {
        position = "right";
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
        width = 216;
      };
      "LoginScreen.LoginArea.Spinner" = {
        font-family = "DroidSansM Nerd Font";
      };
      "LoginScreen.LoginArea.WarningMessage" = {
        font-family = "DroidSansM Nerd Font";
      };
      "LoginScreen.MenuArea.Buttons" = {
        font-family = "DroidSansM Nerd Font";
      };
      "LoginScreen.MenuArea.Popups" = {
        font-family = "DroidSansM Nerd Font";
      };
      "Tooltips" = {
        font-family = "DroidSansM Nerd Font";
      };
    };
  };
}
