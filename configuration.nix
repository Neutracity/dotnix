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
      ./sddm.nix
      ./devices.nix
      ./variables.nix
      ./config-var.nix
    ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
