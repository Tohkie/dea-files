{ ... }:

{
  services.dunst = {
    enable = true;
    
    settings = {
      global = {
        origin = "top-right";
        layer = "overlay";
        offset = "(16, 24)";

        padding = 10;
        gap_size = 4;
        frame_width = 2;
        frame_color = "#14161b";

        font = "DroidSansM Nerd Font Mono 10";

        corner_radius = 12;
        icon_corner_radius = 12;
        show_indicators = false;

        progress_bar = true;
        progress_bar_height = 16;

        mouse_left_click = "do_action, remove_current";
      };

      urgency_normal = {
        background = "#14161b";
        foreground = "#FFFFFF";
        timeout = 5;
      };
    };
  };
}
