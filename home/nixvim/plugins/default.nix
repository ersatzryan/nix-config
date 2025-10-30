{ ... }:

{
  imports = [
    ./cmp.nix
    ./floaterm.nix
    ./lsp.nix
    ./lsp-format.nix
    ./lspkind.nix
    ./luasnip.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nixvim.plugins.web-devicons.enable = true;
}
