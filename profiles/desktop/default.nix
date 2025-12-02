# profiles/desktop/default.nix
{ pkgs, ... }:

{
  imports = [
    ../base.nix
  ];

  nixpkgs.config.allowUnfree = true;
}
