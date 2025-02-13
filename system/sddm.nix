{ config, pkgs, inputs, ... }:
{
  services.displayManager.sddm = {
    enable = false;
    wayland.enable = false;
    theme = "where-is-my-sddm-theme";
  };
}
