{
  lib,
  config,
  ...
}: let
  # Helper to create an enable option with optional default value
  mkFeature = description: default:
    lib.mkEnableOption description // lib.optionalAttrs (default != null) {inherit default;};

  # Helper to create app options (all default to true when parent is enabled)
  mkApps = apps:
    lib.listToAttrs (map (app: {
        name = app;
        value.enable = mkFeature "${app} application" true;
      })
      apps);
in {
  options.features = {
    gui = {
      enable = lib.mkEnableOption "GUI applications and desktop environment";

      # Desktop environment choice (only one should be enabled)
      desktop = {
        gnome.enable = lib.mkEnableOption "GNOME desktop environment";
        hyprland.enable = lib.mkEnableOption "Hyprland window manager";
      };

      # Hyprland ecosystem components
      hyprland = {
        hyprlock.enable = mkFeature "Hyprlock screen locker" true;
        hyprpaper.enable = mkFeature "Hyprpaper wallpaper daemon" true;
        hypridle.enable = mkFeature "Hypridle idle daemon" true;
        waybar.enable = mkFeature "waybar status bar" true;
        wofi.enable = mkFeature "Wofi menu" true;
      };

      apps = mkApps [
        "firefox"
        "discord"
        "signal"
      ];

      terminal.ghostty.enable = mkFeature "Ghostty terminal emulator" true;
    };

    cli = {
      enable = mkFeature "CLI tools and utilities" true;
      code.enable = mkFeature "Code tools and utilities" true;
    };

    editor.nixvim.enable = mkFeature "nixvim configuration" true;

    development.enable = mkFeature "Development tools and environments" null;
  };

  config = {
    assertions = [
      {
        assertion = !(config.features.gui.desktop.gnome.enable && config.features.gui.desktop.hyprland.enable);
        message = "Cannot enable both GNOME and Hyprland simultaneously. Please choose one desktop environment.";
      }
    ];
  };
}
