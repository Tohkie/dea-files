{ inputs, ... }:

{
  imports = [
    inputs.mango.hmModules.mango
  ];

  wayland.windowManager.mango = {
    enable = true;
    
    systemd = {
      enable = true;
      xdgAutostart = true;
    };
    
    settings = { }; 
    extraConfig = builtins.readFile ./mango.conf; 
  };

  xdg.configFile."mango" = {
    recursive = true;
    source = ./config;
  };
}
