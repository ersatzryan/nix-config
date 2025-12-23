{ lib, ... }:

let
  # Helper to create an enable option with optional default value
  mkFeature = description: default:
    lib.mkEnableOption description // lib.optionalAttrs (default != null) { inherit default; };

  # Helper to create app options (all default to true when parent is enabled)
  mkApps = apps:
    lib.listToAttrs (map (app: {
      name = app;
      value.enable = mkFeature "${app} application" true;
    }) apps);
in
{
  options.features = {
    gui = {
      enable = lib.mkEnableOption "GUI applications and desktop environment";

      apps = mkApps [
        "firefox"
        "discord"
        "signal"
      ];

      terminal.ghostty.enable = mkFeature "Ghostty terminal emulator" true;
    };

    cli.enable = mkFeature "CLI tools and utilities" true;

    editor.nixvim.enable = mkFeature "nixvim configuration" true;

    development.enable = mkFeature "Development tools and environments" null;
  };
}
