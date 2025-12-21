{ ... }:

{
  imports = [
    ./cmp.nix
    ./floaterm.nix
    ./lsp.nix
    ./luasnip.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nixvim.plugins.web-devicons.enable = true;
}
