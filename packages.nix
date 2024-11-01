{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.swww.packages.${pkgs.system}.swww
    inputs.godot-bin.packages.x86_64-linux.godot-mono
    zsh-powerlevel10k
    playerctl
    vim
    wget
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
    fzf
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

  #FONTS
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" "FiraMono" "FantasqueSansMono" "JetBrainsMono" ]; })
  ];

  #MODULES
  programs.kdeconnect.enable = true;
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/neutra/.dotfiles/";
  };


}
