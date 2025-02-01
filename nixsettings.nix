{ config, pkgs, inputs, ... }:
{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      builders-use-substitutes = true;
      auto-optimise-store = true;
      # extra substituters to add
      extra-substituters = [
        "https://cache.nixos.org"
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
      ];

      extra-trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    optimise.automatic = true;
    extraOptions = ''
        warn-dirty = false
      '';
    gc = {
      automatic = false;
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
