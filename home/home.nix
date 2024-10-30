{
  inputs,
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
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
