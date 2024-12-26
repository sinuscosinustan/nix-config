{ config, lib, pkgs, ... }:

{
  imports = [
    ./fzf.nix
    ./git.nix
    ./home-manager.nix
    ./kitty.nix
    ./zsh.nix
  ];

  users = {
    extraGroups."sinuscosinustan".gid = 1000;

    users."sinuscosinustan" = {
      isNormalUser = true;
      uid = 1000;
      group = "sinuscosinustan";
      home = "/home/sinuscosinustan";
      hashedPassword = "$6$79.VsxdSujAe3LWQ$B4oyIVjrGuUUY6OKKxDgPCj1pebq0CxsW5QqVgA3w4K21hpKwxlMmM5xzD4VLfMMiZzX6TESaM7uMPXIYVAlH.";
      shell = pkgs.zsh;
      extraGroups = [
        "wheel" "docker"
        "networkmanager" "audio" "video" "sound"
        "pulse" "input"
      ];
    };
  };
}
