{ lib, ... }:

{
  options.features = {
    gui = {
      enable = lib.mkEnableOption "GUI applications and desktop environment";
      
      apps = {
        firefox.enable = lib.mkEnableOption "Firefox web browser" // {
          default = true;
        };
        
        discord.enable = lib.mkEnableOption "Discord" // {
          default = true;
        };
        
        signal.enable = lib.mkEnableOption "Signal" // {
          default = true;
        };
      };
      
      terminal = {
        ghostty.enable = lib.mkEnableOption "Ghostty terminal emulator" // {
          default = true;
        };
      };
    };
    
    cli = {
      enable = lib.mkEnableOption "CLI tools and utilities" // {
        default = true;
      };
    };
    
    editor = {
      nixvim.enable = lib.mkEnableOption "nixvim configuration" // {
        default = true;
      };
    };
    
    development = {
      enable = lib.mkEnableOption "Development tools and environments";
    };
  };
}
