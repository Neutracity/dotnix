{inputs, stylix, hyprland, config, pkgs, ... }:

{
  imports = [
    ./programs
    ./src/script
  ];

  home.username = "neutra";
  home.homeDirectory = "/home/neutra";
  
  home.stateVersion = "24.05"; 

  home.packages = (with pkgs; [
  ]);

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  #Stylix config

  stylix.enable = true; 
  stylix.polarity = "dark";
  stylix.image = ./src/wallpaper/evangelion_1.jpg;
  #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
   stylix.fonts = {
    serif = {
      package = pkgs.nerdfonts.override {fonts = ["Hack"];};
      name = "Hack";
    };

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
