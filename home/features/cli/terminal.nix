{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.features.cli.enable {
    home.packages = with pkgs; [
      direnv
      fzf
      jq
      lazydocker
      ripgrep
      tldr
      tree
    ];

    programs = {
      bash.enable = true;
      bat.enable = true;
      btop.enable = true;

      starship = {
        enable = true;
        enableBashIntegration = true;
      };

      tmux = {
        enable = true;
        baseIndex = 1;
        newSession = true;
        escapeTime = 0;
        secureSocket = false;
        terminal = "screen-256color";
      };
    };
  };
}
