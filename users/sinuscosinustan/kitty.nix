{ lib, config, inputs, ... }:

{
  home-manager.users.sinuscosinustan = { pkgs, ... }: {
    programs.kitty = {
      enable = true;

      settings = {
        enable_audio_bell = false;
        term = "xterm";
        allow_remote_control = true;
        bell_on_tab = false;
        scrollback_lines = 20000;
        tab_bar_edge = "top";
        tab_bar_style = "powerline";
        tab_powerline_style = "slanted";
        tab_title_template = "{index}:{title}";
        tab_bar_min_tabs = 1;
        tab_bar_background = "#333333";

        # Fix for black text visibility
        color0 = "#4d4d4d";  # Change black to a dark grey for better visibility
      };

      font = {
        name = "dejavysansmono";
        size = 11.0;
      };

      keybindings = {
        "shift+page_up" = "scroll_page_up";
        "shift+page_down" = "scroll_page_down";
        "shift+right" = "next_tab";
        "shift+left" = "previous_tab";
        "ctrl+alt+c" = "copy_to_clipboard";
        "ctrl+alt+v" = "paste_from_clipboard";
        "alt+left" = "send_text all \\x1b\\x62";
        "alt+right" = "send_text all \\x1b\\x66";
        "ctrl+cmd+," = "load_config_file";

        # Updated alternative keybindings for window splitting and movement
        "ctrl+shift+f5" = "launch --location=hsplit";
        "ctrl+shift+f6" = "launch --location=vsplit";
        "ctrl+shift+f7" = "launch --location=split";
        "ctrl+shift+f8" = "layout_action rotate";
        "ctrl+shift+up" = "move_window up";
        "ctrl+shift+down" = "move_window down";
        "ctrl+shift+left" = "move_window left";
        "ctrl+shift+right" = "move_window right";
        "ctrl+shift+alt+up" = "layout_action move_to_screen_edge top";
        "ctrl+shift+alt+left" = "layout_action move_to_screen_edge left";
        "ctrl+shift+alt+right" = "layout_action move_to_screen_edge right";
        "ctrl+shift+alt+down" = "layout_action move_to_screen_edge bottom";
        "ctrl+shift+page_up" = "neighboring_window up";
        "ctrl+shift+page_down" = "neighboring_window down";
      };
    };
  };
}
