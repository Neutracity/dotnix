{ config
, pkgs, lib
, ...
}: {
  imports = [
    ./src/script
    ./style/stylix.nix
    # ./style/gtk-qt.nix
    ./utils
    ./wm
    ./shell
    ./app
    ../system/config-var.nix
    ../system/variables.nix
  ];

  
  config = {
    local.hex = {
      hyprland.enable = true;
      kitty.enable = true;
      ghostty.enable = true;
      vscode.enable = true;
      zellij.enable = false;
      tmux.enable = false;
      zsh.enable = true;
      cliricing.enable = true;
      epita.enable = true;
      spotify.enable = true;
      firefox.enable = false;
      zen.enable = true;
      blender.enable = true;
      nvim.enable = true;
      helix.enable = true;
      quickshell.enable = true;
      # fish.enable = true;
    };
  home.username = config.var.username;
  home.homeDirectory = "/home/" + config.var.username;

  programs.ssh.enable = true;

  


  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    udiskie
    nerd-fonts.hack
    nerd-fonts.fira-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.fantasque-sans-mono
  ];
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    # EDITOR = "";
    SHELL = if config.local.hex.zsh.enable then pkgs.zsh else pkgs.bash;
    # TERM = if config.local.hex.ghostty.enable then "ghostty" else if config.local.hex.kitty.enable then "kitty" else "xterm";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  };
}
