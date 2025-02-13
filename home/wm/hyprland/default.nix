{ config, lib, ...}:
let
	cfg = config.local.hex.hyprland;
in{
	options.local.hex.hyprland.enable = lib.mkEnableOption ''
		hyprland related

		Depends on:
			- idk
			'';
	config = lib.mkIf cfg.enable {
		imports = [
			./hypr_settings.nix
			./hypr_binds.nix
			./hypridle.nix
			./hyprlock.nix
			./waybar.nix
			./dunst.nix
		];
	};
}
