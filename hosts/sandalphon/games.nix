{ pkgs, ... }:

{
  imports = [ ./mcsr ];

  # hardware = {
  #   xone.enable = true;
  #   xpadneo.enable = true;
  # };

  environment.systemPackages = with pkgs; [
    prismlauncher # minecraft
    r2modman
    # osu-lazer-bin
  ];

  programs = {
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
      ];
    };
  };
}
