{pkgs, ...}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/atraxsrc/tokyonight-wallpapers/refs/heads/main/tokyonight_original.png";
      hash = "sha256-VmIsHCWQBegiHNQ8BtQAmt3Da5cvR3aVc/sGHIIenEI=";
    };

    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 12;
        terminal = 13;
        desktop = 10;
        popups = 11;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    opacity = {
      terminal = 0.9;
      popups = 0.95;
    };
  };
}
