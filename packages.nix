{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.swww.packages.${pkgs.system}.swww
    zsh-powerlevel10k
    playerctl
    vim
    wget
    webcord
    spotify
    pavucontrol
    steam
    git
    tree
    prismlauncher
    clinfo
    btop
    gnome-bluetooth
    pavucontrol
    mesa
    ocaml
    blender
    heroic
    thefuck
    lmms
    gimp
    python3
    nmap
    vesktop
    dolphin
    godot_4
    brightnessctl
    cava
    zoxide
    killall
    home-manager
    nixd
    libsForQt5.qt5.qtgraphicaleffects 

    (callPackage ./sddm-theme-wimst.nix {})
  ];
  programs.kdeconnect.enable = true;
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" "FiraMono" "FantasqueSansMono" "JetBrainsMono" ]; })
  ];

}
