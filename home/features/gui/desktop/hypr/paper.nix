{...}: {
  services.hyprpaper = {
    settings = {
      ipc = "on";
      splash = false;
      preload = [
        "~/Pictures/wallpaper.jpg"
      ];
      wallpaper = [
        ",~/Pictures/wallpaper.jpg"
      ];
    };
  };
}
