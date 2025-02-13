{ config, lib, pkgs, ...}:
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
			settings = {
				initial-command = "${pkgs.zsh}/bin/zsh";
				command = "${pkgs.zsh}/bin/zsh";
				window-padding-x = 20;
				window-padding-y = 20;
			};
    };
  };
}
