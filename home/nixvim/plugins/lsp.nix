{ ... }:

{
  programs.nixvim.plugins.lsp = {
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
      };
    };
    servers = {
      ruby_lsp = {
        enable = true;
        autostart = true;
      };
      nixd = {
        enable = true;
        autostart = true;
        settings = {
          nixpkgs = {
            expr = "import <nixpkgs> { }";
          };
        };
      };
    };
  };
}
