{ config, pkgs, inputs, ... }:
{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      builders-use-substitutes = true;
      auto-optimise-store = true;
      # extra substituters to add
      extra-substituters = [
      "https://anyrun.cachix.org"
      ];

      extra-trusted-public-keys = [
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      ];
    };
      optimise.automatic = true;
      extraOptions = ''
          warn-dirty = false
        '';
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };
  nixpkgs.config = { allowBroken = true; allowUnfree = true; }; 

  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
