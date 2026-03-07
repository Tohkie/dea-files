{upkgs, ...}: {
  # hardware = {
  #   xone.enable = true;
  #   xpadneo.enable = true;
  # };

  environment.systemPackages = with upkgs; [
    prismlauncher # minecraft
    r2modman
    # osu-lazer-bin
    waywall
    glfw3-minecraft
  ];

  programs = {
    obs-studio = {
      enable = true;
      plugins = with upkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
      ];
    };
  };
}
