{ config
, pkgs
, lib
, spicetify-nix
, ...
}:

let
	cfg = config.local.hex.spotify;
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in{
	options.local.hex.spotify.enable = lib.mkEnableOption ''
		spotify related

		Depends on:
			- idk
			'';
  imports = [ spicetify-nix.homeManagerModules.default ];
	config = lib.mkIf cfg.enable {

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
      keyboardShortcut
      fullAppDisplay
    ];
    enabledSnippets = with spicePkgs.snippets; [
    ];

    enabledCustomApps = with spicePkgs.apps; [
      marketplace
    ];
  };
};
}
