{ config, lib, pkgs, inputs, ...}:
let
	cfg = config.local.hex.blender;
in{
	options.local.hex.blender.enable = lib.mkEnableOption ''
		blender related

		Depends on:
			- idk
			'';
	config = lib.mkIf cfg.enable {
		home.packages = [
			pkgs.blender_4_1
		];
	};
}
