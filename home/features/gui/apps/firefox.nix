{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.features.gui.apps.firefox.enable {
    programs.firefox = {
      enable = true;
      profiles = {
        default = {
          search = {
            default = "ddg";
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
  };
}
