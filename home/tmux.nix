{ pkgs, ... }:
{
  programs.tmux = {
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
}
