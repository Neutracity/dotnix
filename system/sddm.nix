{ config, pkgs, inputs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "where-is-my-sddm-theme";
  };
}
