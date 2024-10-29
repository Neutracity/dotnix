{ config, pkgs, inputs, ... }:
{
  stylix= {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    polarity = "dark";
    image = ./home/src/wallpaper/kanagawa_1.jpg;
    fonts = {
      serif = {
        package = pkgs.nerdfonts.override { fonts = [ "Hack" ]; };
        name = "Hack";
      };
    };
    opacity.terminal = 0.85;
  };
}
