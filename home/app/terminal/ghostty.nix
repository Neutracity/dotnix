{ config, lib, ...}:
let
	cfg = config.local.hex.ghostty;
in{
	options.local.hex.ghostty.enable = lib.mkEnableOption ''
		ghostty related

		Depends on:
			- idk
			'';
	config = lib.mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      installVimSyntax = true;
    };
  };
}
