{ ... }: {
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+shift+enter" = "new_window_with_cwd";
      "ctrl+shift+up"    = "nth_window";
      "ctrl+shift+down"  = "neighboring_window";
      "ctrl+shift+q"     = "close_other_windows_in_tab";
      "ctrl+shift+f"     = "move_window_to_top";
      "ctrl+shift+`"     = "move_window_forward";
    };
    themeFile = "Carbonfox";
    settings = {
      tab_bar_style = "slant";
      tab_activity_symbol = "➜";
    };
  };
}
