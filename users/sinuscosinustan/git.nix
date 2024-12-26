{ config, lib, pkgs, ... }:

{
  home-manager.users.sinuscosinustan = { pkgs, ... }: {
    programs.git = {
      enable = true;
      userName = "Tan Siewert";
      userEmail = "tan@siewert.io";
    };
  };
}
