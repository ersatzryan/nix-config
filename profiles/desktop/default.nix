# profiles/desktop/default.nix
{ ... }:

{
  imports = [
    ../base.nix
  ];

  nixpkgs.config.allowUnfree = true;
}
