{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs
    ./src/script
    ../stylix.nix
    ../config-var.nix
    ../variables.nix
  ];
  home.username = config.var.username;
  home.homeDirectory = "/home/"+config.var.username;
  

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
