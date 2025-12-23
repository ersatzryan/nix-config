{ inputs, ... }:

{
  # Import modules unconditionally to avoid infinite recursion
  # The actual enabling is controlled by mkIf in nixvim/default.nix
  imports = [
    inputs.nixvim.homeManagerModules.default
    ./nixvim
  ];
}
