{ config, pkgs, inputs, ... }:
{
  services.xserver.enable = true;
  services.libinput.enable = true;
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.hyprland.xwayland.enable = true;
}
