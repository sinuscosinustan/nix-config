{
  description = "NixOS configs by Tan";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    sops-nix.url = "github:Mic92/sops-nix";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nixpkgs-master, sops-nix, home-manager, nixos-hardware }:
    let
      overlay-unstable = final: prev: {
        unstable = import inputs.nixpkgs-unstable { config.allowUnfree = true; system = final.system; };
        master = import inputs.nixpkgs-master {
          config = {
            allowUnfree = true;
            segger-jlink.acceptLicense = true;
            permittedInsecurePackages = [ "segger-jlink-qt4-810" ];
          };
          system = final.system;
        };
      };
    in {
      nixosConfigurations = {
        mobilerschrott = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ({ config, pkgs, ...}: { nixpkgs.overlays = [ overlay-unstable ]; })
            ./hosts/mobilerschrott/configuration.nix
            sops-nix.nixosModules.sops
          ];
          specialArgs = { inherit inputs; };
        };
        matcha-tea-latte = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ({ config, pkgs, ...}: { nixpkgs.overlays = [ overlay-unstable ]; })
            ./hosts/matcha-tea-latte/configuration.nix
            sops-nix.nixosModules.sops
          ];
          specialArgs = { inherit inputs; };
        };
        bastelpi = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            ({ config, pkgs, ...}: { nixpkgs.overlays = [ overlay-unstable ]; })
            ./hosts/bastelpi/configuration.nix
            sops-nix.nixosModules.sops
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
