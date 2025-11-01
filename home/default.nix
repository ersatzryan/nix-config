{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./nixvim
    ./git.nix
  ];

  home = {
    username = "ryan";
    homeDirectory = "/home/ryan";
  };

  programs = {
    home-manager.enable = true;
    nixvim.enable = true;
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

  home.stateVersion = "23.11";
}
