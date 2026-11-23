{ ... }: {
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+shift+enter" = "new_window_with_cwd";
      "ctrl+shift+up"    = "previous_window";
      "ctrl+shift+down"  = "next_window";
      "ctrl+shift+q"     = "close_other_windows_in_tab";
      "ctrl+shift+f"     = "move_window_to_top";
      "ctrl+shift+`"     = "move_window_forward";
    };
    themeFile = "Carbonfox";
    settings = {
      # active_tab_foreground = "#000";
      active_tab_background = " #F8CDFA";
      cursor_shape = "block";
      shell_integration = "no-cursor";
      tab_activity_symbol = "↪ ";
      tab_bar_style = "powerline";
      tab_title_template = "{fmt.fg.red}{bell_symbol}{fmt.fg.orange}{activity_symbol}{fmt.fg.red}{secure_input_symbol}{fmt.fg.tab}{tab.last_focused_progress_percent}{title}";
    };
  };
}
