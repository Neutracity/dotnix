{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    (inputs.godot-bin.packages.x86_64-linux.godot-mono.override { dotnetPackage = pkgs.dotnet-sdk_7;})
    zsh-powerlevel10k
    playerctl
    osu-lazer
    bluetui
    gnome-calendar
    vim
    rar
    unrar
    moonlight-qt
    remmina
    wget
    unzip
    pavucontrol
    steam
    git
    tree
    prismlauncher
    audacity
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
    brightnessctl
    cava
    zoxide
    killall
    mpd
    home-manager
    nixd
    nil
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
