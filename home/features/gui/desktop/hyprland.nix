{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.features.gui;
in {
  imports = [
    ./hypr/autostart.nix
    ./hypr/bindings.nix
    ./hypr/env.nix
    ./hypr/idle.nix
    ./hypr/inputs.nix
    ./hypr/lock.nix
    ./hypr/look.nix
    ./hypr/paper.nix

    ./mako.nix
    ./walker.nix
    ./waybar.nix
  ];

  config = lib.mkIf (cfg.enable && cfg.desktop.hyprland.enable) {
    home.packages = with pkgs;
      lib.optionals cfg.desktop.hyprland.enable [
        wl-clipboard # Clipboard manager
        networkmanagerapplet # Network manager applet
        pavucontrol # Volume control

        xfce.thunar # File manager

        # Screenshot tools
        grim
        slurp
      ];

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        # Modifier key
        "$mod" = "SUPER";

        "$browser" = lib.mkDefault "firefox";
        "$fileManager" = lib.mkDefault "nautilus --new-window";
        "$launcher" = lib.mkDefault "walker";
        "$messenger" = lib.mkDefault "signal-desktop";
        "$music" = lib.mkDefault "spotify";
        "$passwordManager" = lib.mkDefault "1password";
        "$terminal" = lib.mkDefault "ghostty";
        "$webapp" = lib.mkDefault "$browser --app";

        # Monitor configuration
        monitor = ",preferred,auto,1";
      };
    };

    programs.hyprlock = lib.mkIf cfg.hyprland.hyprlock.enable {enable = true;};
    programs.waybar = lib.mkIf cfg.hyprland.waybar.enable {enable = true;};

    services.hyprpaper = lib.mkIf cfg.hyprland.hyprpaper.enable {enable = true;};
    services.hypridle = lib.mkIf cfg.hyprland.hypridle.enable {enable = true;};
  };
}
