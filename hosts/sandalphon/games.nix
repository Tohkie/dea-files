{upkgs, ...}: {
  # hardware = {
  #   xone.enable = true;
  #   xpadneo.enable = true;
  # };

  environment.systemPackages = with upkgs; [
    prismlauncher # minecraft
    r2modman
    osu-lazer-bin
    waywall
    glfw3-minecraft
    
    # strinova
    protonplus
    yad
    xdotool
    xxd
    xwininfo
    directx-shader-compiler
    directx-headers

    # clipping software
    # (python313.withPackages (p: with p; [
    #   evdev
    #   aiohttp
    #   click
    #   tomli
    #   tomli-w
    #   psutil
    #   pywebview
    #   pyqt6
    #   pyqt6-webengine
    #   pygobject3
    #   fuse
    #   cloudflare
    # ]))
    # gpu-screen-recorder-gtk
    # cloudflared
    
    obs-cmd # controls obs from cli

    cifs-utils
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
