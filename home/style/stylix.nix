{ pkgs,config, ... }:
{
  stylix = {
    enable = false;
    /*base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    polarity = "dark";
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
        popups = 12;
      };
    };
    opacity.terminal = 0.85;
    # targets.btop.enable = false;
    # targets.hyprland.enable = false;
    # targets.hyprpaper.enable = true;
  };

  

  home.file = {
    ".cache/wal/colors".text = ''
      #${config.lib.stylix.colors.base00}
      #${config.lib.stylix.colors.base08}
      #${config.lib.stylix.colors.base0B}
      #${config.lib.stylix.colors.base0A}
      #${config.lib.stylix.colors.base0D}
      #${config.lib.stylix.colors.base0E}
      #${config.lib.stylix.colors.base0C}
      #${config.lib.stylix.colors.base05}
      #${config.lib.stylix.colors.base03}
      #${config.lib.stylix.colors.base08}
      #${config.lib.stylix.colors.base0B}
      #${config.lib.stylix.colors.base0A}
      #${config.lib.stylix.colors.base0D}
      #${config.lib.stylix.colors.base0E}
      #${config.lib.stylix.colors.base0C}
      #${config.lib.stylix.colors.base07}
    '';
    ".cache/wal/colors.json".text = ''
      {
          "wallpaper": "/home/neutra/.dotfiles/home/src/wallpaper/bladerunner_1.jpg",
          "alpha": "100",

          "special": {
              "background": "#${config.lib.stylix.colors.base00}",
              "foreground": "#${config.lib.stylix.colors.base05}",
              "cursor": "#${config.lib.stylix.colors.base05}"
          },
          "colors": {
              "color0": "#${config.lib.stylix.colors.base00}",
              "color1": "#${config.lib.stylix.colors.base08}",
              "color2": "#${config.lib.stylix.colors.base0B}",
              "color3": "#${config.lib.stylix.colors.base0A}",
              "color4": "#${config.lib.stylix.colors.base0D}",
              "color5": "#${config.lib.stylix.colors.base0E}",
              "color6": "#${config.lib.stylix.colors.base0C}",
              "color7": "#${config.lib.stylix.colors.base05}",
              "color8": "#${config.lib.stylix.colors.base03}",
              "color9": "#${config.lib.stylix.colors.base08}",
              "color10": "#${config.lib.stylix.colors.base0B}",
              "color11": "#${config.lib.stylix.colors.base0A}",
              "color12": "#${config.lib.stylix.colors.base0D}",
              "color13": "#${config.lib.stylix.colors.base0E}",
              "color14": "#${config.lib.stylix.colors.base0C}",
              "color15": "#${config.lib.stylix.colors.base07}"
          }
      }

    '';
*/
  };


}
