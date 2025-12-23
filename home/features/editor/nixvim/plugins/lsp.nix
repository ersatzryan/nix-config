{ pkgs, ... }:

{
  programs.nixvim = {
    extraPackages = with pkgs; [
      alejandra
    ];

    plugins = {
      lsp-format.enable = true;
      lsp = {
        enable = true;
        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<leader>F" = "format";
          };
        };
        servers = {
          bashls.enable = true;
          dockerls.enable = true;
          nixd = {
            enable = true;
            settings = {
              nixpkgs = {
                expr = "import <nixpkgs> { }";
              };
              formatting = {
                command = ["alejandra"];
              };
            };
          };
          ruby_lsp.enable = true;
          terraformls.enable = true;
        };
      };

      lspkind = {
        enable = true;
        settings.cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            nvim_lua = "[api]";
            path = "[path]";
            luasnip = "[snip]";
            buffer = "[buffer]";
            neorg = "[neorg]";
          };
        };
      };
    };
  };
}
