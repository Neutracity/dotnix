{
  description = "Neutracity nix-flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz";# For latest stable version
      inputs.nixpkgs.follows = "nixpkgs";
    };
    godot-bin = {
      url = "github:Damianu/godot4-bin";
      inputs.nixpkgs.follows = "nixpkgs"; #Might prevent some OpenGL issues
    };

    stylix.url = "github:danth/stylix";

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
    
    nixpkgs-sddm.url = "github:NixOS/nixpkgs/1997e4aa514312c1af7e2bda7fad1644e778ff26";
     

  };

  outputs = { self, nixpkgs, nixpkgs-sddm,  home-manager, spicetify-nix, stylix, solaar, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in
    {
      # Nixos declaration
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ ./configuration.nix inputs.stylix.nixosModules.stylix solaar.nixosModules.default ];
      };
      formatter.${system} = pkgs.nixpkgs-fmt;
      # Home manager declaration
      homeConfigurations."neutra" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/home.nix stylix.homeManagerModules.stylix  ];
        extraSpecialArgs = {
          inherit inputs spicetify-nix ;
        };

      };
    };
}

