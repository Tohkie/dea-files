{upkgs, ...}: {
  # ======================
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # nixos-rebuild switch --use-remote-sudo
  # ======================
  # Update packages?:
  # sudo nix-channel --update
  # sudo nixos-rebuild switch
  # ======================
  # sudo nixos-rebuild switch --flake .
  environment.systemPackages = with upkgs; [
    wget
    lunarvim
    vscode
    python3
    p7zip
    unzip
    chawan # tui browser cha <url>
    git
    gcc
    gdb
    glibc.static
    nixfmt

    kitty # terminal
    wayland

    nemo # file browser
    monophony # yt music tryout

    vesktop # discord-canary
    equibop # equibop 3.1.7

    vivaldi # vivaldi install requires qt5
    qt5.qtbase

    starship # shell customizer

    libreoffice-qt # libreoffice
    hunspell
    hunspellDicts.uk_UA
    hunspellDicts.th_TH
    openjdk

    notepad-next # notepad++
    sqlitebrowser

    ffmpeg-full
    yt-dlp
    qbittorrent

    bottles # windows emulation

    element-desktop # element 4 matrix

    libsForQt5.qtstyleplugin-kvantum # libs for Qt5
    libsForQt5.qt5ct
    libsForQt5.qt5.qtbase
    btop-cuda

    croc
    syncplay
  ];
}
