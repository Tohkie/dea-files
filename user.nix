{ pkgs, ... }:
{
  users.users.dea = {
    isNormalUser = true;
    description = "dea";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };
}