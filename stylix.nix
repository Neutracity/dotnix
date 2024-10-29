{ config, pkgs, inputs, ... }:
{
  stylix= {
    enable = true;
    #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    polarity = "dark";
    image = ./home/src/wallpaper/evangelion_2.jpg;
    fonts = {
      serif = {
        package = pkgs.nerdfonts.override { fonts = [ "Hack" ]; };
        name = "Hack";
      };
    };
    opacity.terminal = 0.85;
  };
}
