{ config
, inputs
, pkgs
, lib
, spicetify-nix
, ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  imports = [ spicetify-nix.homeManagerModules.default ];

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
}

