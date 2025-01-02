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
    btop
    ripgrep
    chromium
    libsForQt5.qt5.qtgraphicaleffects
    appimage-run
    (callPackage ./clife.nix {})
    (callPackage ./sddm-theme-wimst.nix {})
    (callPackage ./cura.nix {})
  ];

  #FONTS
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" "FiraMono" "FantasqueSansMono" "JetBrainsMono" ]; })
  ];

  virtualisation.docker.enable = true;

  #MODULES
  programs.kdeconnect.enable = true;
  # programs.nh = {
  #   enable = true;
  #   clean.enable = true;
  #   clean.extraArgs = "--keep-since 4d --keep 3";
  #   flake = "/home/neutra/.dotfiles/";
  # };
 services.solaar = {
    enable = true; # Enable the service
    package = pkgs.solaar; # The package to use
    window = "hide"; # Show the window on startup (show, *hide*, only [window only])
    batteryIcons = "regular"; # Which battery icons to use (*regular*, symbolic, solaar)
    extraArgs = ""; # Extra arguments to pass to solaar on startup
  }; 
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    
  };
  programs.nix-ld.enable = true;
  services.udisks2.enable = true;


}
