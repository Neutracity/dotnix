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
    wget
    zoxide
    killall
    thefuck


    # tui
    yazi
    nix-tree
    lazygit
    nix-inspect
    bluetui

  ];



  programs.btop = {
    enable = true;
    settings = {
      color_theme = lib.mkForce "TTY";
    };
  };
}
