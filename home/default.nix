{inputs, ...}: {
  imports = [
    ./modules/features.nix
    ./features/cli
    ./features/editor
    ./features/gui
  ];

  nixpkgs = {
    overlays = [inputs.nur.overlays.default];
    config.allowUnfree = true;
  };

  home = {
    username = "ryan";
    homeDirectory = "/home/ryan";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
