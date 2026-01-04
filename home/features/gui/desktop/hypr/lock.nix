{...}: {
  programs.hyprlock = {
    settings = {
      general = {
        hide_cursor = true;
      };

      background = {
        blur_passes = 1;
      };
    };
  };
}
