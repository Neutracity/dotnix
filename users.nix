{ config, pkgs, inputs, ... }:
{
  users.users.neutra = {
    isNormalUser = true;
    description = config.var.username;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      thunderbird
    ];
  };
}
