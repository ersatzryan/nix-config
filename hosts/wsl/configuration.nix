# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
    inputs.home-manager.nixosModules.home-manager
  ];

  wsl = {
    enable = true;
    defaultUser = "ryan";
  };

  nixpkgs.config.allowUnfree = true;

  # Basic user setup
  users.users.ryan = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.ryan = {
      imports = [ ../../home ];

      # CLI-only setup for WSL (no GUI)
      features = {
        gui.enable = false;
      };
    };
  };

  system.stateVersion = "23.11";
}

