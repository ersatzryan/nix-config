{pkgs, ...}: let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  session = "${pkgs.hyprland}/bin/Hyprland";
in {
  # Enable Hyprland
  programs.hyprland.enable = true;

  # XDG Portal for screen sharing, file pickers, etc.
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${session}";
        user = "ryan";
      };
      default_session = {
        command = "${tuigreet} --greeting 'Welcome to ErsatzOS' --asterisks --remember --remember-user-session --time -cmd ${session}";
        user = "greeter";
      };
    };
  };

  # Optional: Keep X11 support for compatibility with X11 apps
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
