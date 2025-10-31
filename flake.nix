{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      # A list of hosts with their corresponding profiles
      hosts = [
        { name = "wsl"; profile = "desktop"; }
        { name = "desktop"; profile = "desktop"; }
      ];

      # Helper function to generate a NixOS configuration for a given host
      mkHost = host:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/${host.name}/configuration.nix
            ./profiles/${host.profile}
          ];
        };

      # Generates a set of NixOS configurations for each host
      nixosConfigurations = builtins.listToAttrs (map (host: {
        name = host.name;
        value = mkHost host;
      }) hosts);
    in
    {
      inherit nixosConfigurations;
    };
}
