{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Ryan Glover";
        email = "esatzryan@gmail.com";
      };
      alias = {
        co = "checkout";
        l = "log --pretty=oneline --abbrev-commit";
        st = "status -s";
      };
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        pull = {
          rebase = true;
        };
        rebase = {
          autostash = true;
        };
      };
    };
  };
}
