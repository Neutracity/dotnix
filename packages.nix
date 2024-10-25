{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.swww.packages.${pkgs.system}.swww
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
}
