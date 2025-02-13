{pkgs, config, lib, ...}:
let
	cfg = config.local.hex.ricing;
in{
	options.local.hex.ricing.enable = lib.mkEnableOption ''
		ricing related

		Depends on:
			- idk
			'';
	config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      cava    
      cbonsai
      pipes
      cmatrix
    ];
	};
}
