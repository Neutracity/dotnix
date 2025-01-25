{  pkgs, ... }:
{
  stylix= {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    polarity = "dark";
    image = ./home/src/wallpaper/kanagawa_2.jpg;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    fonts = {
      serif = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack";
      };
      sizes = {
        popups = 12 ;
      };
    };
    opacity.terminal = 0.85;
    # targets.btop.enable = false;
    # targets.hyprland.enable = false;
    # targets.hyprpaper.enable = true;
  };
  

}
