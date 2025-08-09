# My nixos config
{

  imports =
    [
      ./hardware-configuration.nix
      ./hardware-acceleration.nix
      ./bootloader.nix
      ./network.nix
      ./locales.nix
      ./packages.nix
      ./users.nix
      ./hyprland.nix
      ./plasma.nix
      ./nixsettings.nix
      ./sddm.nix
      ./devices.nix
      ./variables.nix
      ./config-var.nix
      ./seafile.nix
    ];

  system.stateVersion = "24.05";
}
