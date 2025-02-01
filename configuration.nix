# My nixos config

{ config, pkgs, inputs, ... }:

{
  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    allowInsecure = true;
  };
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-runtime-6.0.36"
    "aspnetcore-runtime-6.0.36"
    "aspnetcore-runtime-wrapped-6.0.36"
    "dotnet-sdk-6.0.428"
    "dotnet-sdk-wrapped-6.0.428"
    "rider"
    "dotnet-sdk-7.0.410"
    "dotenv6"
  ];

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
      ./seafile.nix
    ];

  system.stateVersion = "24.05";
}
