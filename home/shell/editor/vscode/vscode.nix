{ lib
, config
, ...
}:

let
	cfg = config.local.hex.vscode;
in{
	options.local.hex.vscode.enable = lib.mkEnableOption ''
		vscode related

		Depends on:
			- idk
			'';
	config = lib.mkIf cfg.enable {
        programs.vscode = {
            enable = true;
        };
	};
}
