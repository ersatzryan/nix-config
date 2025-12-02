{ pkgs, ...}:

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

  programs.gh = {
    enable = true;
    extensions = [ pkgs.gh-copilot];
    settings = {
      aliases = {
        co = "pr checkout";
        prs = "pr list";
      };
    };
  };
}
