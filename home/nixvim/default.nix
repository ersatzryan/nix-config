{ ... }:

{
  imports = [
    ./colorscheme.nix
    ./globals.nix
    ./options.nix
    ./plugins
  ];

  programs.nixvim.enable = true;
}
