{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./firefox.nix
  ];

  config = lib.mkIf config.features.gui.enable {
    home.packages = with pkgs;
      lib.optional config.features.gui.apps.discord.enable discord
      ++ lib.optional config.features.gui.apps.signal.enable signal-desktop;
  };
}
