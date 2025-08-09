{ config, lib, pkgs, ...}:
let
	cfg = config.local.hex.hyprland;
in{
	options.local.hex.hyprland.enable = lib.mkEnableOption ''
		hyprland related

		Depends on:
			- idk
			'';

		imports = [
			./hypr_settings.nix
			./hypr_binds.nix
			./hypridle.nix
			./hyprlock.nix
			#./waybar.nix
			./dunst.nix
			./quickshell/quickshell.nix
		];
	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [
	    hyprpicker
	    hyprcursor
	    hypridle
	    mpv
	    imv
	    qt5.qtwayland
	    qt6.qtwayland
	    libsForQt5.qt5ct
	    qt6ct
	    hyprshot
	    swappy
	    wf-recorder
	    wlr-randr
	    wl-clipboard
	    brightnessctl
	    gnome-themes-extra
	    libva
	    dconf
	    nemo-with-extensions
	    wayland-utils
	    wayland-protocols
	    direnv
	    meson
	    swaylock-effects
	    cliphist
	  ];

		wayland.windowManager.hyprland = {
			enable = true;
			# set the Hyprland and XDPH packages to null to use the ones from the NixOS module
			package = null;
			portalPackage = null;
		};
	};
}
