
{ config, pkgs, inputs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    theme = "where-is-my-sddm-theme";
  };
}
