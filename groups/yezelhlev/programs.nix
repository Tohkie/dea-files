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
    # CLI tools
    git
    wget
    unzip
    p7zip
    kitty # terminal
    starship # shell customizer
    btop-cuda # system monitoring
    croc # e2ee file transfer
    chawan # tui browser cha <url>
    shellcheck # sh warning
    calcure # calendar app TODO: remove & fork calendar.vim

    # editors
    lunarvim
    vscode

    # languages
    gcc
    gdb
    glibc.static
    python3
    nixfmt

    # window management
    wayland

    # programs 
    vivaldi # vivaldi install requires qt5
    zen # TODO: switch to better browser
    vesktop # discord-canary
    equibop # equibop 3.1.7
    element-desktop # element 4 matrix
    monophony # yt music tryout
    syncplay
    qbittorrent
    libreoffice-qt # libreoffice
    notepad-next # notepad++
    # notepadqq # TODO: which is better?
    sqlitebrowser
    bottles # windows emulation

    # dependencies 
    qt5.qtbase # vivaldi + others
    libsForQt5.qtstyleplugin-kvantum # libs for Qt5
    libsForQt5.qt5ct
    libsForQt5.qt5.qtbase

    hunspell # spellcheck for libreoffice
    hunspellDicts.uk_UA
    hunspellDicts.th_TH
    openjdk

    ffmpeg-full # mpv + syncplay
    yt-dlp
  ];
}
