{
  description = "Neutracity nix-flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    minegrub-theme.url = "github:Lxtharia/minegrub-theme";
    minecraft-plymouth-theme.url = "github:nikp123/minecraft-plymouth-theme";

    ghostty = {
      url = "github:ghostty-org/ghostty";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    blender-bin.url = "github:edolstra/nix-warez?dir=blender";

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

  outputs = { self, minecraft-plymouth-theme, ghostty, blender-bin, nixpkgs, home-manager, spicetify-nix, stylix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ minecraft-plymouth-theme.overlay blender-bin.overlays.default];
          config = {
            allowBroken = true;
            allowUnfree = true;
            allowInsecure = true;
            permittedInsecurePackages = [
              "dotnet-runtime-6.0.36"
              "aspnetcore-runtime-6.0.36"
              "aspnetcore-runtime-wrapped-6.0.36"
              "dotnet-sdk-6.0.428"
              "dotnet-sdk-wrapped-6.0.428"
              "rider"
              "dotnet-sdk-7.0.410"
              "dotenv6"
            ];
          };
      };
    in
    {
      # Nixos declaration
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        specialArgs = { inherit inputs; };
        modules = [
          ./system/configuration.nix
          inputs.minegrub-theme.nixosModules.default
        ];
      };
      formatter.${system} = pkgs.nixpkgs-fmt;
      lib = import ./lib;
      # Home manager declaration
      homeConfigurations."neutra" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/home.nix
          stylix.homeManagerModules.stylix
        ];
        extraSpecialArgs = {
          inherit inputs spicetify-nix;
        };

      };
    };
}

