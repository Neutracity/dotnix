
{ config, lib, ...}:
let
	cfg = config.local.hex.kitty;
in{
	options.local.hex.kitty.enable = lib.mkEnableOption ''
		kitty related

		Depends on:
			- idk
			'';
	config = lib.mkIf cfg.enable {

    programs.kitty = {
      enable = true;
      #font.package = pkgs.Hack ;
      #font.name = "Hack" ;
      #font.name = "jetbrains mono nerd font" ;
      settings = {
        confirm_os_window_close = 0;
        allow_remote_control = true;
        close_on_child_death = true;
        cursor_shape = "beam";
        enable_audio_bell = false;
        shell = "zsh";
        background_padding_width = 10;
        window_margin_width = 20;
      };
      shellIntegration.enableZshIntegration = true;
    };
	};
}
