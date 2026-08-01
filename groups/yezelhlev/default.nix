{
  pkgs,
  root,
  lib, # temp call for services.displayManager.sddm.wayland.enable
  ...
}: {
  imports = [
    ./programs.nix
    /${root}/hosts/modules/steam.nix
  ];

  # Configure keymap in X11
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = lib.mkDefault true;
  };

  services.desktopManager.plasma6.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    wireplumber.enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
    # pulse.enable = true;
    # jack.enable = true;
  };

  security.polkit.enable = true;

  services.nginx.enable = true;

  services.mullvad-vpn = {
    enable = true;
    gui.enable = true;
    # package = pkgs.mullvad-vpn; # mullvad only has the cli
  };

  # Enable docker virtualisation.
  virtualisation.docker.enable = true;

  programs.nix-ld = {
    enable = true;
    libraries = [
      ## Put here any library that is required when running a package
      ## ...
      ## Uncomment if you want to use the libraries provided by default in the steam distribution
      ## but this is quite far from being exhaustive
      ## https://github.com/NixOS/nixpkgs/issues/354513
      (pkgs.runCommand "steamrun-lib" {} "mkdir $out; ln -s ${pkgs.steam-run.fhsenv}/usr/lib64 $out/lib")
    ];
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
    flake = "/home/dea/dea-files"; # sets NH_OS_FLAKE variable for you
  };

  programs.mango = {
    enable = false; # TODO: enable mango after configuring
  };

  programs.silentSDDM = {
    enable = true;
    theme = "default";
  };

  # stylix = {
  #   enable = true;
  #   image = /${root}/assets/wallpapers/lantern.png;
  # };

  users.users.dea = {
    description = "dea";
    isNormalUser = true;
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

  # Better alternative to the standard ssh-agent
  # services.pcscd.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
