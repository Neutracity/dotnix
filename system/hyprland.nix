{lib, config, pkgs, inputs, ... }:
let
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
	# cfg = config.local.hex.hyprland;
in{
	# config = lib.mkIf cfg.enable {
    services.xserver.enable = true;
    services.libinput.enable = true;
    programs.hyprland = {
        enable = true;
        # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
        package = null;
      };
  # };
}
