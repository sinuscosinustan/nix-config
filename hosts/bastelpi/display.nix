{ config, lib, pkgs, ... }:

{
  hardware.raspberry-pi."4".fkms-3d.enable = true;

  services.greetd = {
    enable = true;
    settings = {
     default_session.command = ''
      ${pkgs.greetd.tuigreet}/bin/tuigreet \
        --time \
        --asterisks \
        --user-menu \
        --cmd sway
    '';
    };
  };

  environment.etc."greetd/environments".text = ''
    sway
  '';

  programs.sway = {
    enable = true;
  };
}
