{ ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader><leader>" =  "find_files";
      "<leader>sg" = "live_grep";
    };
  };
}
