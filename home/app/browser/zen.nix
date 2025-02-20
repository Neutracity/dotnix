{ config, lib, pkgs, ...}:
let
	cfg = config.local.hex.zen;
in{
	options.local.hex.zen.enable = lib.mkEnableOption ''
		zen related

		Depends on:
			- idk
			'';
	config = lib.mkIf cfg.enable {
    inputs.zen-browser.packages."${pkgs.system}".default.enable = true;
	};
}
