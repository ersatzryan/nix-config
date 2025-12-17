{ config, pkgs, modulesPath, ... }:

{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  # Enable Broadcom wireless drivers
  boot.kernelModules = [ "b43" "b43legacy" "bcma" "ssb" ];
  
  # Include firmware for Broadcom devices
  hardware.enableRedistributableFirmware = true;
  
  # Explicitly include Broadcom firmware packages
  hardware.firmware = with pkgs; [
    linux-firmware
    broadcom-bt-firmware
  ];

  # Also load the proprietary driver as a fallback option
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  
  # Network manager for easier WiFi setup
  networking.networkmanager.enable = true;
  networking.wireless.enable = false; # Disable wpa_supplicant in favor of NetworkManager

  # Useful tools for installation with Broadcom hardware
  environment.systemPackages = with pkgs; [
    # Network debugging
    iw
    wirelesstools
    pciutils
    usbutils
    
    # General utilities
    vim
    git
    wget
    curl
    htop
  ];

  # Allow passwordless sudo for the installer
  security.sudo.wheelNeedsPassword = false;

  # Set up a nixos user for installation
  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    password = "nixos";
  };

  # Enable SSH for remote installation
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  system.stateVersion = "23.11";
}
