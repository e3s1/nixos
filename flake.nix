{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";	
    };
  };

  outputs = inputs@{ self, home-manager, niri-flake, sops-nix, nixpkgs,  ... }: {

	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	  specialArgs = { inherit inputs; };

      system = "x86_64-linux";
  
	  modules = [
		./configuration.nix

		home-manager.nixosModules.home-manager
		sops-nix.nixosModules.sops
        
		./modules/home-manager.nix
		./modules/obsidian
		./modules/intel.nix
		./modules/spotify
		./modules/niri.nix
		./modules/noctalia
		./modules/plymouth
		./modules/sops.nix
	  ];
	};

  };
}
