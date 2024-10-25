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
      ./hyprland.nix
      ./nixsettings.nix
      ./stylix.nix
    ];



  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = "where-is-my-sddm-theme";

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







  programs.kdeconnect.enable = true;
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" "FiraMono" "FantasqueSansMono" "JetBrainsMono" ]; })
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;


  system.stateVersion = "24.05";

}
