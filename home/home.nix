{
  inputs,
  stylix,
  hyprland,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs
    ./src/script
    ../stylix.nix
    inputs.spicetify-nix.homeManagerModules.default
  ];

  home.username = "neutra";
  home.homeDirectory = "/home/neutra";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
  ];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  nixpkgs.config.allowUnfree = true ;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
