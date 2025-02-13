{ self, system, ... }@pkgs:
{
  cura = pkgs.callPackage ./cura.nix {};
}
