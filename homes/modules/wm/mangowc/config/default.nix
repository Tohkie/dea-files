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
    
    autostart_sh = " ";

    settings = { }; 
    extraConfigs = builtins.readFile ./mango.conf; 
  };
}
