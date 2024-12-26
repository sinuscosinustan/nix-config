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
      config = rec {
        modifier = "Mod4";
      };
    };
  };
}
