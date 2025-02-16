{pkgs, config, lib, ...}:
let
	cfg = config.local.hex.cliricing;
in{
	options.local.hex.cliricing.enable = lib.mkEnableOption ''
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
			peaclock
    ];
	};
}
