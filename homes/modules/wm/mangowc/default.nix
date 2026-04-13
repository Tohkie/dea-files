{ inputs, ... }:

{
  wayland.windowManager.mango = {
    enable = true;
  };
  
  systemd = {
    enable = true;
    xdgAutostart = true;
  };
  
  settings = builtins.readFile ./mango.conf; 
}
