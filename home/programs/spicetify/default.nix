{
  config,
  inputs,
  pkgs,
  spicetify-nix,
  ...
}: {
  programs.spicetify =
   let
     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
   in
   {
     enable = true;
   };
}
