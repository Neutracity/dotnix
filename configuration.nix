# My nixos config

{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./hardware-acceleration.nix
      ./rider.nix
      ./bootloader.nix
      ./network.nix
      ./locales.nix
      ./packages.nix
      ./users.nix
      ./wm.nix
    ];



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

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = "where-is-my-sddm-theme";
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



  nixpkgs.config.allowUnfree = true;


  stylix.enable = true;
  #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  stylix.polarity = "dark";
  stylix.image = ./home/src/wallpaper/evangelion_1.jpg;


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
