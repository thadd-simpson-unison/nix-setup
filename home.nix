{ config, pkgs, ... }:

{
    # No more 'let' or 'imports' needed here!
    # The flake handles the import of the home-manager module.

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true; # Highly recommended for flakes

    home-manager.users.ts = {
        home.stateVersion = "25.05";
        
        programs.git = {
            enable = true;
            userName = "thadd-simpson-unison";
            userEmail = "thadd.simpson@unison.com";
        };
        
        xresources.properties = {
            "XTerm*faceName" = "DejaVu Sans Mono";
            "XTerm*background" = "#000000";
            "XTerm*foreground" = "#8ABEB7";
            "XTerm*selectToClipboard" = true;
        };
    };
}