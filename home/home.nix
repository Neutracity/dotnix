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

  };

  


  home.sessionVariables = {
    EDITOR = "nvim";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
