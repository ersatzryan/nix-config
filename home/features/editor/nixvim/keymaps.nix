{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Lex<CR>";
      options = { silent = true; };
    }
  ];
}
