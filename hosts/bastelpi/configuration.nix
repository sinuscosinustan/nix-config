{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.raspberry-pi-4
    ./audio.nix
    ./display.nix
    ./network.nix
    ./packages.nix
    ../../common/base
    ../../common/bluetooth.nix
    ../../users/sinuscosinustan
  ];

  hardware = {
    raspberry-pi."4" = {
      apply-overlays-dtmerge.enable = true;
      tc358743.enable = true;
      bluetooth.enable = true;
    };
  };

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
        grub.enable = false;
        generic-extlinux-compatible.enable = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  environment.systemPackages = with pkgs; [
    libraspberrypi
    raspberrypi-eeprom
  ];

  services.openssh.enable = true;
  virtualisation.docker.enable = true;
  services.udev.packages = with pkgs; [ master.segger-jlink ];

  networking.hostName = "bastelpi";
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "24.11";
}
