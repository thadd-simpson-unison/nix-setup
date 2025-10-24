{ config, pkgs, ... }:
let
      home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
in
{
    imports = [
        (import "${home-manager}/nixos")
    ];
    home-manager.useGlobalPkgs = true;
    home-manager.users.ts = {
        # The state version is required and should stay at the version you
        # originally installed.
        home.stateVersion = "25.05";
        
        # Dotfiles
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