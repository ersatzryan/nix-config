# profiles/base.nix
{ pkgs, ... }:

{
  nix = {
    package = pkgs.nixVersions.latest;
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };

  # Basic user setup
  users.users.ryan = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  system.stateVersion = "23.11";
}
