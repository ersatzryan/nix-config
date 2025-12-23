{ ... }:

{
  programs.nixvim.opts = {
    autoindent = true;
    backup = false;
    clipboard = "unnamedplus";
    colorcolumn = "80";
    completeopt = ["menu" "menuone" "noselect"];
    confirm = true;
    encoding = "utf-8";
    expandtab = true;
    fillchars = "eob: ";
    hidden = true;
    ignorecase = true;
    joinspaces = false;
    laststatus = 1;
    list = true;
    listchars = "trail:•,tab:|→,nbsp:␣";
    number = true;
    relativenumber = true;
    ruler = false;
    shiftround = true;
    shiftwidth = 2;
    showmatch = true;
    showmode = false;
    signcolumn = "yes";
    smartcase = true;
    smartindent = true;
    softtabstop = 2;
    swapfile = false;
    tabstop = 2;
    termguicolors = true;
    undofile = true;
    wrap = false;
  };
}
