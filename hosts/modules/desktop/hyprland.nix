{ pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland.enable = true;

  # XDG Portal for screen sharing, file pickers, etc.
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Display manager - SDDM works well with Hyprland
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
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
