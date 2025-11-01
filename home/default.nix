{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./nixvim
    ./git.nix
    ./tmux.nix
  ];

  home = {
    username = "ryan";
    homeDirectory = "/home/ryan";
  };

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.11";
}
