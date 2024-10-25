{ config, pkgs, inputs, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings = {
    builders-use-substitutes = true;
    # extra substituters to add
    extra-substituters = [
      "https://anyrun.cachix.org"
    ];

    extra-trusted-public-keys = [
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
    ];
  };
  nixpkgs.config.allowUnfree = true;
  nix.settings.auto-optimise-store = true;
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}
