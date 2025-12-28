{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/hardware/network/broadcom-43xx.nix")
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "nvme" "usbhid" "usb_storage" "sd_mod"];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/caac5942-cff9-4c98-b634-cdcbec18dd38";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/7203-93F1";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/a97ac1de-6906-4e3e-a640-775920dd2fb1";}
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
