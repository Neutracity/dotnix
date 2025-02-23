{lib, config, pkgs, ...}:
let
	cfg = config.local.hex.tmux;
in{
	options.local.hex.tmux.enable = lib.mkEnableOption ''
		tmux related

		Depends on:
			- idk
			'';
	config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "tmux-256color";
      historyLimit = 100000;
      plugins = with pkgs;
        [
          tmuxPlugins.better-mouse-mode
          tmuxPlugins.continuum
          tmuxPlugins.tmux-fzf
          tmuxPlugins.yank
          tmuxPlugins.power-theme
        ];
      extraConfig = ''
        set -g @tmux_power_theme 'moon'
      '';
    };
  };
}
