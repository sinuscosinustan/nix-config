{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # generic
    bc
    curl
    delta
    dmidecode
    efibootmgr
    ethtool
    git
    git-lfs
    gparted
    htop
    jq
    man-pages
    p7zip
    silver-searcher
    wget
    restic
    xz
    zstd
    bind
    whois
    changelogger

    # browser
    firefox
    google-chrome

    # editor
    nano
    vim

    # office
    evince
    libreoffice

    # video
    arandr
    glxinfo
    vlc

    # mail
    thunderbird

    # games
    gnome3.adwaita-icon-theme
    lutris
    steam
    polymc

    # communication
    (discord.override {
      version = "0.0.19";
      src = fetchurl {
        url = "https://dl.discordapp.net/apps/linux/0.0.19/discord-0.0.19.tar.gz";
        sha256 = "1403vdc7p6a8mhr114brfp4dqvikaj5s71wrx20ca5y6srsv5x0r";
      };
    })
    element-desktop
    openvpn
    remmina
    tdesktop
    unstable.tmate
    wireguard-tools
    (pkgs.unstable.mumble.override { pulseSupport = true; })

    # misc
    unstable.anydesk
    asciinema
    pwgen
    scrot
    sipcalc
    gnome.file-roller

    # development
    bundix
    nix-prefetch-git
    nodejs
    python3
    ruby
    virtualenv
    wireshark
    yarn

    # terminal
    rxvt-unicode

    # management
    azure-cli
    unstable.fluxcd
    hcloud
    kubectl
    kubernetes-helm
    unstable.velero

    # voice
    spotify
  ];

  programs = {
    mtr.enable = true;
    gnupg.agent.enable = true;
    zsh.enable = true;
  };
}
