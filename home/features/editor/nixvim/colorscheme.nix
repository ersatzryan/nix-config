{ ... }:

{
  programs.nixvim = {
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        floats = "dark";
        transparent = true;
      };
    };
  };
}
