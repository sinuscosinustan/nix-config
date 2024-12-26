{ config, lib, pkgs, inputs, ... }:

with lib;

{
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [ nvme-cli smartmontools coreutils lm_sensors ];

  users.mutableUsers = false;

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  nix = {
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates     = "weekly";
      options   = "--delete-older-than 7d";
    };
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };

  users.users."root" = {
    initialHashedPassword = lib.mkForce "$6$3HrtwevsTYl1fmzQ$ojze.VlnfWhq6fc.zY.aL4jb3y/UohomFmikPbvR/NPh6SKpYokAb.hnnK9rUeonJMSVc8m31r9Ju0eV0uiGQ.";
    hashedPassword = config.users.users."root".initialHashedPassword;
  };
}
