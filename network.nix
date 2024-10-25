{ config, pkgs, inputs, ... }:

{
  
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 33471 ];
    allowedUDPPorts = [ 33471 51820 ];
    allowedTCPPortRanges = [{ from = 1714; to = 1764; }]; # for Gsconnect
    allowedUDPPortRanges = [{ from = 1714; to = 1764; }]; # for Gsconnect
  };
  networking.firewall.checkReversePath = false;
}
