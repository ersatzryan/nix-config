{ config, lib, pkgs, ... }:

{
  config = lib.mkIf (config.features.gui.enable && config.features.gui.desktop.gnome.enable) {
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };
    };

    # GNOME utilities and extensions
    home.packages = with pkgs; [
      gnome-tweaks
      gnome-extension-manager
    ];
  };
}
