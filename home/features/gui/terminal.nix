{ config, lib, ... }:

{
  config = lib.mkIf (config.features.gui.enable && config.features.gui.terminal.ghostty.enable) {
    programs.ghostty = {
      enable = true;
      settings = {
        # Theme now managed by Stylix
        # theme = "TokyoNight";
      };
    };
  };
}
