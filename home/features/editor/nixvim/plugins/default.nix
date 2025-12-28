{...}: {
  imports = [
    ./cmp.nix
    ./floaterm.nix
    ./lsp.nix
    ./luasnip.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nixvim.plugins = {
    fugitive.enable = true;
    web-devicons.enable = true;
  };
}
