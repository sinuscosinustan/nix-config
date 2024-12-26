{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # generic
    bc
    curl
    delta
    dmidecode
    ethtool
    git
    git-lfs
    gparted
    htop
    jq
    man-pages
    p7zip
    wget
    xz
    zstd
    bind
    whois
    kicad

    # browser
    chromium

    # editor
    vim

    # video
    vlc

    # communication
    unstable.tmate

    # misc
    asciinema
    pwgen

    # development
    nix-prefetch-git
    python3
    virtualenv
    virt-manager
    wireshark
    yarn

    # terminal
    kitty
  ];

  programs = {
    mtr.enable = true;
    gnupg.agent.enable = true;
    zsh.enable = true;
  };
}
