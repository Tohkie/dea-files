{ ... }:

{
  services.dunst = {
    enable = true;
    
    # iconTheme = {
    #   
    # };

    settings = {
      global = {
        origin = "";
        layer = "top";
        offset = "(16, 24)";

        padding = 4;
        gap_size = 4;
        frame_width = 2;

        font = "DroidSansM Nerd Font Mono 10";

        corner_radius = 12;
        icon_corner_radius = 12;

        progress_bar = true;
        progress_bar_height = 16;
      };
    };
  };
}
