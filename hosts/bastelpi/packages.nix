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
    tmux
    usbutils

    # browser
    chromium

    # editor
    vim

    # video
    janus-gateway
    vlc
    v4l-utils
    ustreamer

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
    master.segger-jlink
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
