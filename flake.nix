{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    himmelblau.url = "github:himmelblau-idm/himmelblau";
  };

  outputs = { self, nixpkgs, himmelblau, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; }; 
      modules = [
        ./configuration.nix
        himmelblau.nixosModules.himmelblau # This fixes the 'no value defined' error
      ];
    };
  };
}
