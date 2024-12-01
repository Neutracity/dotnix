{  pkgs, ... }:
{
  stylix= {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    polarity = "dark";
    image = ./home/src/wallpaper/mocha2.png;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    fonts = {
      serif = {
        package = pkgs.nerdfonts.override { fonts = [ "Hack" ]; };
        name = "Hack";
      };
      sizes = {
        popups = 12 ;
      };
    };
    opacity.terminal = 0.85;
  };
}
