# My nixos config

{ config, pkgs, inputs, ... }:

{
  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    allowInsecure = true;
  };
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
      ./sddm.nix
      ./devices.nix
      ./variables.nix
      ./config-var.nix
    ];

  system.stateVersion = "24.05";
}
