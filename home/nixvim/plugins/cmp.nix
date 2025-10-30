{ ... }:

{
  programs.nixvim.plugins.cmp = {
    enable = true;
    settings = {
      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.close()";
        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<S-CR>" = "cmp.mapping.confirm({ select = true })";
      };

      sources = [
        { name = "path"; }
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        {
          name = "buffer";
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
        }
      ];
    };
  };
}
