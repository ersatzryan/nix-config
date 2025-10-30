{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "/dev/sda" ]; # or "nodev" for efi only

  fileSystems."/" =
    { device = "/dev/disk/by-label/NIXOS";
      fsType = "ext4";
    };

  nix = {
    package = pkgs.nixVersions.latest;
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };

  environment.systemPackages = with pkgs; [
    ripgrep
    ruby
  ];

  users.users.ryan = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs pkgs; };
    users = {
      ryan = import ../../home/default.nix;
    };
  };

  system.stateVersion = "23.11";
}
