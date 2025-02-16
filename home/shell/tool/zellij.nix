{ config, lib, ...}:
let
	cfg = config.local.hex.zellij;
in{
	options.local.hex.zellij.enable = lib.mkEnableOption ''
		zellij related

		Depends on:
			- idk
			'';
	config = lib.mkIf cfg.enable {
	    programs.zellij = {
	      enable = true;
				enableZshIntegration = config.local.hex.zsh.enable;
				# enableFishIntegration = config.local.hex.fish.enable;
		};
	};

	
}
