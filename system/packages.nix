{ pkgs, inputs, ... }:
{
environment.systemPackages = with pkgs; [
    
    # blender
    libGL
    clinfo

    weylus
    dotnet-sdk_7
    playerctl
    # osu-lazer
    gnome-calendar
    moonlight-qt
    pavucontrol
    steam
    git
    gnome-bluetooth
    pavucontrol
    mesa
    # gimp
    python3
    vesktop
    brightnessctl
    mpd
    home-manager
    nixd
    nil
    libsForQt5.qt5.qtgraphicaleffects
    appimage-run
    git-lfs
    alejandra


    # (callPackage ./clife.nix { })
    (callPackage ./sddm-theme-wimst.nix { })
  ];

  virtualisation.docker.enable = false;

  #MODULES
  programs.kdeconnect.enable = true;
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/neutra/.dotfiles/";
  };

  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;

  };
  programs.nix-ld.enable = true;
  services.udisks2.enable = true;

  programs.git = {
    enable = true;
    userName  = "neutra";
    userEmail = "neutracity@gmail.com";
  };



}
