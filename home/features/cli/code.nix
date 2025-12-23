{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.features.cli.code.enable {
    programs.opencode.enable = true;
  };
}
