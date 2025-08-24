{ config, lib, pkgs, ...}:
let
	cfg = config.local.hex.bongocat;
in{
	options.local.hex.bongocat.enable = lib.mkEnableOption ''
		bongocat related

		Depends on:
			- idk
			'';
		imports = [
			./caelestia.nix
		];
	config = lib.mkIf cfg.enable {
    programs.wayland-bongocat = {
      enable = true;
      package = pkgs.callPackage (bongocat + "/default.nix") {};
      settings = {
        autostart = true;
        soundEffects = true;
        soundVolume = 0.5;
        theme = "default";
        customThemePath = null;
        showOnAllWorkspaces = false;
        followMouse = true;
        followActiveWindow = false;
        position = "bottom-right";
        offsetX = 0;
        offsetY = 0;
        scale = 1.0;
        opacity = 1.0;
        alwaysOnTop = true;
        clickThrough = false;
        hideWhenFullscreen = true;
        hideWhenIdle = false;
        idleTimeout = 300; # seconds
      };
    };
  };
}