{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "DroidSansMono" ]; })
    dejavu_fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.sinuscosinustan = { pkgs, ... }: {
    home.stateVersion = "24.11";
    home.sessionVariables = {
      EDITOR = "vim";
    };
    programs.home-manager.enable = true;

    wayland.windowManager.sway = {
      enable = true;

      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
        export _JAVA_AWT_WM_NONREPARENTING=1
        export MOZ_ENABLE_WAYLAND=1
      '';

      config = rec {
        modifier = "Mod4";
        terminal = "kitty";
        bars = [{
          position = "top";
          fonts = { names = ["pango:DejaVu Sans Mono" "FontAwesome 8" ]; size = 8.0; };
          trayOutput = "primary";
          statusCommand = "${pkgs.i3status}/bin/i3status";
          workspaceButtons = true;
        }];

        floating = { modifier = "Mod4"; };

        keybindings = {
          "Mod4+Shift+q" = "kill";

          "Mod4+Return" = "exec ${pkgs.kitty}/bin/kitty";
          "Mod4+d" = "exec ${pkgs.fuzzel}/bin/fuzzel";
          "Mod4+Shift+e" = "exec swaynag -t warning -m 'Really exit?' -b 'Yes' 'swaymsg exit'";

          # Window focus
          "Mod4+j" = "focus left";
          "Mod4+k" = "focus down";
          "Mod4+l" = "focus up";
          "Mod4+semicolon" = "focus right";
          "Mod4+Left" = "focus left";
          "Mod4+Down" = "focus down";
          "Mod4+Up" = "focus up";
          "Mod4+Right" = "focus right";

          # Move windows
          "Mod4+Shift+j" = "move left";
          "Mod4+Shift+k" = "move down";
          "Mod4+Shift+l" = "move up";
          "Mod4+Shift+semicolon" = "move right";
          "Mod4+Shift+Left" = "move left";
          "Mod4+Shift+Down" = "move down";
          "Mod4+Shift+Up" = "move up";
          "Mod4+Shift+Right" = "move right";

          # Splits and layouts
          "Mod4+h" = "splith";
          "Mod4+v" = "splitv";
          "Mod4+f" = "fullscreen toggle";
          "Mod4+s" = "layout stacking";
          "Mod4+w" = "layout tabbed";
          "Mod4+e" = "layout toggle split";

          # Floating mode
          "Mod4+Shift+space" = "floating toggle";

          # Focus mode toggle
          "Mod4+space" = "focus mode_toggle";

          # Focus parent
          "Mod4+a" = "focus parent";

          # Workspaces
          "Mod4+1" = "workspace 1";
          "Mod4+2" = "workspace 2";
          "Mod4+3" = "workspace 3";
          "Mod4+4" = "workspace 4";
          "Mod4+5" = "workspace 5";
          "Mod4+6" = "workspace 6";
          "Mod4+7" = "workspace 7";
          "Mod4+8" = "workspace 8";
          "Mod4+9" = "workspace 9";
          "Mod4+0" = "workspace 10";

          # Move to workspaces
          "Mod4+Shift+1" = "move container to workspace 1";
          "Mod4+Shift+2" = "move container to workspace 2";
          "Mod4+Shift+3" = "move container to workspace 3";
          "Mod4+Shift+4" = "move container to workspace 4";
          "Mod4+Shift+5" = "move container to workspace 5";
          "Mod4+Shift+6" = "move container to workspace 6";
          "Mod4+Shift+7" = "move container to workspace 7";
          "Mod4+Shift+8" = "move container to workspace 8";
          "Mod4+Shift+9" = "move container to workspace 9";
          "Mod4+Shift+0" = "move container to workspace 10";

          # Reload and restart
          "Mod4+Shift+c" = "reload";
          "Mod4+Shift+r" = "restart";

          # Lock screen
          "Mod4+Shift+x" = "exec swaylock -c 000000";
        };

        window = {
          border = 0;
          commands = [{
            command = "border pixel 0";
            criteria.class = "^.*";
          }];
        };
      };
    };

    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          terminal = "${pkgs.kitty}/bin/kitty";
          layer = "overlay";
          width = 120;
          font = "Iosevka Nerd Font Medium:size=12";
        };
        colors = {
          background = "151515ff";
          text = "ffffffff";
          selection = "424242ff";
          selection-text = "ffffffff";
        };
      };
    };

    dconf = {
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          clock-format = "12h";
          clock-show-weekday = true;
        };
        "org/gnome/desktop/media-handling" = {
          automount = false;
          automount-open = false;
          autorun-never = true;
        };
        "org/gnome/mutter" = {
          edge-tiling = true;
          dynamic-workspaces = true;
          experimental-features = ["variable-refresh-rate"];
        };
      };
    };
  };
}
