# My nixos config

{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./hardware-acceleration.nix
      ./rider.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 33471 ];
    allowedUDPPorts = [ 33471 51820 ];
    allowedTCPPortRanges = [{ from = 1714; to = 1764; }]; # for Gsconnect
    allowedUDPPortRanges = [{ from = 1714; to = 1764; }]; # for Gsconnect
  };
  networking.firewall.checkReversePath = false;
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowBroken = true;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings = {
    builders-use-substitutes = true;
    # extra substituters to add
    extra-substituters = [
      "https://anyrun.cachix.org"
    ];

    extra-trusted-public-keys = [
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
    ];
  };
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  #services.displayManager.sddm.enable = true;
  #services.desktopManager.plasma6.enable = true;
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  console.keyMap = "us";

  services.printing.enable = true;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  hardware.graphics.enable32Bit = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;


  users.users.neutra = {
    isNormalUser = true;
    description = "neutra";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      thunderbird
    ];
  };

  nixpkgs.config.allowUnfree = true;

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
  ];

  stylix.enable = true;
  #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  stylix.polarity = "dark";
  stylix.image = ./home/src/wallpaper/evangelion_1.jpg;


  programs.hyprland.xwayland.enable = true;
  programs.kdeconnect.enable = true;
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" "FiraMono" "FantasqueSansMono" "JetBrainsMono" ]; })
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  nix.settings.auto-optimise-store = true;
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  system.stateVersion = "24.05";

}
