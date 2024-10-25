{ config, pkgs, inputs, ... }:
{
  stylix.enable = true;
  #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  stylix.polarity = "dark";
  stylix.image = ./home/src/wallpaper/evangelion_1.jpg;
}
