{
  config,
  inputs,
  pkgs,
  lib,
  spicetify-nix,
  ...
}: {

  nixpkgs.config.allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          "spotify"
   ];
  imports = [spicetify-nix.homeManagerModules.default];

  programs.spicetify =
   let
     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
   in
   {
     enable = true;
   };
}
