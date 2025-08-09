{ config, lib, pkgs, ...}:
let
	cfg = config.local.hex.quickshell;
in{
	options.local.hex.quickshell.enable = lib.mkEnableOption ''
		quickshell related

		Depends on:
			- idk
			'';
	config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      quickshell
          ];
  };
}