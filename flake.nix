{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Add Home Manager here
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    himmelblau.url = "github:himmelblau-idm/himmelblau";
  };

  outputs = { self, nixpkgs, home-manager, himmelblau, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; }; 
      modules = [
        ./configuration.nix
        himmelblau.nixosModules.himmelblau
        
        # Add the Home Manager NixOS module here
        home-manager.nixosModules.home-manager
      ];
    };
  };
}