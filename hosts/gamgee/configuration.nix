{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./stylix.nix
    inputs.home-manager.nixosModules.home-manager

    ../modules/desktop/hyprland.nix
  ];

  nix.settings.extra-experimental-features = "nix-command flakes";
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  hardware.graphics.enable = true;
  hardware.bluetooth.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "gamgee";
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  time.timeZone = "America/New_York";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  programs = {
    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = ["ryan"]; # TODO: Make this dynamic
    };
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.ryan = {
    isNormalUser = true;
    description = "Ryan Glover";
    extraGroups = ["networkmanager" "wheel"];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.ryan = {
      imports = [../../home];

      features = {
        gui = {
          enable = true;
          desktop.hyprland.enable = true;
        };
        cli.enable = true;
        editor.nixvim.enable = true;
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    git
  ];

  system.stateVersion = "25.11";
}
