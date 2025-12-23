{...}: {
  imports = [
    ./apps.nix
    ./desktop
  ];

  config = {
    programs.ghostty.enable = true;
  };
}
