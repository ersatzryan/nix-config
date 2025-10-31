# profiles/desktop/default.nix
{ pkgs, ... }:

{
  imports = [
    ../base.nix
  ];

  environment.systemPackages = with pkgs; [
    ripgrep
    ruby
  ];
}
