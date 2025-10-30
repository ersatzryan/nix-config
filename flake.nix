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
      # You can add new hosts here
      hosts = [ "wsl" "desktop" ];

      # Helper function to generate a NixOS configuration for a given host
      mkHost = host:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/${host}/configuration.nix ];
        };

      # Generates a set of NixOS configurations for each host
      nixosConfigurations = builtins.listToAttrs (map (host: {
        name = host;
        value = mkHost host;
      }) hosts);
    in
    {
      inherit nixosConfigurations;
    };
}
