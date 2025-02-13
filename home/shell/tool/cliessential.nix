{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [

    # cli
    fastfetch
    unzip
    unrar
    fd
    file
    fzf
    ripgrep
    killall 

    # tui
    yazi
    nix-tree
    lazygit
    nix-inspect

  ];



  programs.btop = {
    enable = true;
    settings = {
      color_theme = lib.mkForce "TTY";
    };
  };
}
