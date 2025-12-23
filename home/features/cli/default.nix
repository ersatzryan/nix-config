{ ... }:

{
  # Import modules unconditionally to avoid infinite recursion
  # Use mkIf in individual modules to control enabling
  imports = [
    ./git.nix
    ./terminal.nix
  ];
}
