{ config, lib, pkgs, ... }:

{
  home-manager.users.sinuscosinustan = { pkgs, ... }: {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
