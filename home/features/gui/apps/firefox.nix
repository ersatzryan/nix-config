{
  lib,
  config,
  pkgs,
  ...
}: let
  firefox-addons = pkgs.nur.repos.rycee.firefox-addons;
in {
  config = lib.mkIf config.features.gui.apps.firefox.enable {
    programs.firefox = {
      enable = true;

      profiles = {
        default = {
          extensions = {
            force = true;
            packages = with firefox-addons; [
              augmented-steam
              the-camelizer-price-history-ch
              facebook-container
              onepassword-password-manager
              protondb-for-steam
            ];
          };
          settings = {
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "browser.newtabpage.activity-stream.feeds.showSponsoredTopSites" = false;
            "browser.newtabpage.activity-stream.feeds.topsites" = false;
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;

            "browser.ssb.enabled" = true;

            "browser.startup.homepage" = "https://home.blendedshire.com";

            "browser.urlbar.suggest.quickactions" = false;
            "browser.urlbar.suggest.quicksuggest.all" = false;
          };
        };
      };
    };

    stylix.targets.firefox = {
      colorTheme.enable = true;
      profileNames = ["default"];
    };
  };
}
