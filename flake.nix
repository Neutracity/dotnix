{
  description = "Neutracity nix-flake";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    swww.url = "github:LGFae/swww";

    stylix.url = "github:danth/stylix";

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

  };

  outputs = { self, nixpkgs, swww, home-manager, spicetify-nix, stylix, anyrun, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Nixos declaration
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs swww anyrun; };
        modules = [ ./configuration.nix inputs.stylix.nixosModules.stylix ];
      };
      formatter.${system} = pkgs.nixpkgs-fmt;
      # Home manager declaration
      homeConfigurations."neutra" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/home.nix stylix.homeManagerModules.stylix anyrun.homeManagerModules.default ];
        extraSpecialArgs = {
          inherit inputs spicetify-nix anyrun;
        };

      };
    };
}

