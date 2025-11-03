{ pkgs, ... }:

{
  programs.bat = {
    enable = true;
    config = {
      theme = "tokyonight";
    };
    themes = {
      tokyonight = {
        src = pkgs.fetchFromGitHub {
          owner = "folke";
          repo = "tokyonight.nvim";
          rev = "v4.14.1";
          sha256 = "0i68hqxbhk7pqwkd8faskcdh0nr8lan61fp4vxlw3j9z3z9ia2wi";
        };
        file = "extras/sublime/tokyonight_night.tmTheme";
      };
    };
  };
}
