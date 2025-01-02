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
    udiskie
    peaclock
    cbonsai
    pipes
    cmatrix
  ];

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

  };

  


  home.sessionVariables = {
    EDITOR = "nvim";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
