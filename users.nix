{ config, pkgs, inputs, ... }:
{
  users.users.neutra = {
    isNormalUser = true;
    description = "neutra";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      thunderbird
    ];
  };
}
