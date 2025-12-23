{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.features.cli.enable {
    home.packages = with pkgs; [
      direnv
      fzf
      jq
      ripgrep
      tldr
      tree
    ];

    programs = {
      bash.enable = true;
      bat = {
        enable = true;
        config = {
          theme = "tokyonight";
        };
        themes = {
          tokyonight = {
            src = pkgs.fetchFromGitHub {
              owner = "folke";
              repo = "tokyonight.nvim";
              rev = "v4.14.1";
              sha256 = "0i68hqxbhk7pqwkd8faskcdh0nr8lan61fp4vxlw3j9z3z9ia2wi";
            };
            file = "extras/sublime/tokyonight_night.tmTheme";
          };
        };
      };

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
        plugins = [
          pkgs.tmuxPlugins.tokyo-night-tmux
        ];
      };
    };
  };
}
