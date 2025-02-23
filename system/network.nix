{ config, pkgs, inputs, ... }:

{

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 33471 4242 1701 9001 24800];
    allowedUDPPorts = [ 33471 51820 4242 24800];
    allowedTCPPortRanges = [{ from = 1714; to = 1764; }]; # for Gsconnect
    allowedUDPPortRanges = [{ from = 1714; to = 1764; }]; # for Gsconnect
  };
  networking.firewall.checkReversePath = false;
  networking.extraHosts =
    ''
      192.168.1.33 gamepve
      192.168.1.22 neutraserv
    '';
}
