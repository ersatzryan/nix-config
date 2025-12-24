{...}: {
  imports = [
    ./apps
    ./desktop
  ];

  config = {
    programs.ghostty.enable = true;
  };
}
