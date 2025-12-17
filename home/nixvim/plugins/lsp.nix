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
      bashls.enable = true;
      dockerls.enable = true;
      nixd = {
        enable = true;
        settings = {
          nixpkgs = {
            expr = "import <nixpkgs> { }";
          };
        };
      };
      postgres_lsp.enable = true;
      ruby_lsp.enable = true;
      terraformls.enable = true;
    };
  };
}
